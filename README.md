
<!-- README.md is generated from README.Rmd. Please edit that file -->

<!-- badges: start -->

[![Website
shields.io](https://img.shields.io/website-up-down-green-red/http/shields.io.svg)](https://mayankagrawalbond.shinyapps.io/live-knit-rmd/)
[![made-with-Rshiny](https://img.shields.io/badge/Made%20with-RShiny-blue?style=plastic&logo=r)](https://shiny.rstudio.com/)
[![made-with-Markdown](https://img.shields.io/badge/Made%20with-Markdown-1f425f.svg)](http://commonmark.org)
[![made-with-latex](https://img.shields.io/badge/Made%20with-LaTeX-1f425f.svg)](https://www.latex-project.org/)
[![License: GPL
v3](https://img.shields.io/static/v1?label=license&message=MIT&color=blue)](https://opensource.org/licenses/MIT)
[![Open Source?
Yes\!](https://badgen.net/badge/Open%20Source%20%3F/Yes%21/blue?icon=github)]()

<!-- badges: end -->

# Introduction

This R Shiny application provides an intitutive user experenice to write
markdown documents and see the live rendering on the fly.

Since the output of markdown is native HTML, it paves way for multiple
use cases of this application, few of which are listed below -

  - Write blog posts directly in markdown, which can be then integrated
    with any web development tech stack, such as Wordpress, MERN, React,
    Native HTML/CSS/JS etc.
  - Write custom e-mailers in markdown, which can be then automatetd to
    send to 100s of recipents through Robotic Process automation using
    R, Python, Java.
  - Write project reports in markdown and style with css, so that all
    your reports have consitent styling and you are focused more on
    content creation.
  - Users new to markdown format can play with this app to get a hang of
    its capability.

Additional fun features of this application are -

  - View all available `BootStrap` themes via the Theme Selection
    widget.
  - Fully Customize the look and feel of your R Shiny Web application or
    any bootstrap powered web application by defining/changing color
    varaibales powered by **SASS**.

## Website

The Markdown application is deployed and live at
[shinyapps.io](https://mayankagrawalbond.shinyapps.io/live-knit-rmd/)

## [Dashboard Screenshots](https://mayankagrawalbond.shinyapps.io/live-knit-rmd/)

#### Home Page - View Tab

[![home-page](images/ScreenShot-1.png)](https://mayankagrawalbond.shinyapps.io/live-knit-rmd/)

#### Create Tab

[![createTab](images/ScreenShot-2.png)](https://mayankagrawalbond.shinyapps.io/live-knit-rmd/)

#### Editor Themes

[![editorThemes](images/ScreenShot-3.png)](https://mayankagrawalbond.shinyapps.io/live-knit-rmd/)

#### App Themes

[![appThemes](images/ScreenShot-4.png)](https://mayankagrawalbond.shinyapps.io/live-knit-rmd/)

##### Application References

This application uses two major chunks in its implementation, as
follows.

1.  **Ace Editor** - [shinyAce](https://github.com/trestletech/shinyAce)
    is a R package wrapper to implement the live text editor input
    section.
2.  [**knitr**](https://github.com/yihui/knitr) - R package to convert
    markdown documents to various formats such as - .docx, .ppt, HTML,
    ioslides among a few other. Here, we specifically knit it to HTML
    for live preview update.
    [Here](https://github.com/yihui/knitr/tree/master/inst/shiny) is the
    repo for the simple implementation of it via more web dev route,
    from 8 years ago.
