+++ 
draft = true
date = 2023-11-06T12:15:33-05:00
title = "Spring"
description = "An introduction to the Spring Framework and Spring Boot"
slug = ""
authors = []
tags = []
categories = []
externalLink = ""
series = []
+++
The [Spring Framework](https://spring.io/projects/spring-framework) is a powerful, open-source application framework for Java that provides comprehensive infrastructure support for developing Java applications. It offers a wide array of features and functionalities, [including inversion of control (IoC)](https://docs.spring.io/spring-framework/docs/3.2.x/spring-framework-reference/html/beans.html), [aspect-oriented programming (AOP)](https://docs.spring.io/spring-framework/reference/core/aop.html), and a broad range of modules for various purposes like data access, web development, security, and more. Spring simplifies the development process by promoting a modular and flexible architecture, making it easier for developers to create [loosely coupled and easily testable applications](https://www.codingwithcarl.com/posts/2021-11-09-microservices/). It enables developers to build robust, scalable, and maintainable enterprise-level applications by offering a cohesive framework that integrates seamlessly with other libraries and frameworks.

Spring is considered a "framework of frameworks" where several sub-frameworks or sub-tools exists to simplify the development of complex applications or systems. We'll be going over some of them such as [Spring Data JPA](https://spring.io/projects/spring-data-jpa), and [Spring Secuirty](https://spring.io/projects/spring-security), but the concern for this post is Spring Boot.

[Spring Boot](https://spring.io/projects/spring-boot), an extension of the Spring Framework, is designed to simplify and accelerate the initial setup and development of Spring-based applications. It provides an opinionated approach to configuration, reducing the need for developers to spend time on boilerplate code and configurations. Spring Boot favors convention over configuration, offering a set of pre-configured settings and defaults that allow developers to create stand-alone, production-grade applications with minimal effort. It simplifies the deployment process by embedding a web server within the application, enabling applications to be easily packaged as JAR files, and simplifying the setup of production-ready features such as health checks, metrics, and monitoring. Overall, Spring Boot streamlines the development process, allowing developers to focus more on building the core features of their applications.

Oftentimes, you will hear developers incorrectly use the term "Spring Boot" and "Spring Framework" interchangeably. This will be important in interviews because a hiring manager may assume a dev has worked with several Spring tools since they have Spring Boot on their resume. So just note that Spring Boot is apart of the Spring Framework and not the entire Spring Framework.

### Spring Initializr

[Spring Initializr](https://start.spring.io/)

Project: Maven
Language: Java
Spring Boot: 3.1.4
Packaging: Jar
Java Version: 17
Dependecies: Spring Web ( a base for full stack development and provides an
embedded Tomcat server.) and Spring Boot DevTools (provides us with the Spring Boot developer
tools, which provide automatic restart functionality. It makes development much
faster because the application is automatically restarted when changes have been
saved.)

intellij - Current File > Edit Configs > Add > Application > com.codingwithcarl.cardDB.CardDbApplication