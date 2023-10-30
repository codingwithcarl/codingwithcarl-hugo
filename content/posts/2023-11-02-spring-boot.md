+++ 
draft = true
date = 2023-10-29T21:39:34-04:00
title = "Spring Boot"
description = ""
slug = ""
authors = []
tags = []
categories = []
externalLink = ""
series = []
+++
## Java, Spring, & Spring Boot

Some background knowledge: the [Spring Framework](https://spring.io/projects/spring-framework) provides a comprehensive programming and configuration model for modern Java-based enterprise applications - on any kind of deployment platform.

A key element of Spring is infrastructural support at the application level: Spring focuses on the "plumbing" of enterprise applications so that teams can focus on application-level business logic, without unnecessary ties to specific deployment environments.

Spring is considered a "framework of frameworks" where several sub-frameworks or sub-tools exists to simplify the development of complex applications or systems. We'll be going over some of them such as [Spring Data JPA](https://spring.io/projects/spring-data-jpa), and [Spring Secuirty](https://spring.io/projects/spring-security), but the biggest, most notable one is Spring Boot.

[Spring Boot](https://spring.io/projects/spring-boot) is a modern Java-based backend framework that makes development faster than with traditional Java-based frameworks. With Spring Boot, you can make a standalone web application that has an embedded application server.


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