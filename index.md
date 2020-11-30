## What is the Reed-Frost Model?
The Reed-Frost model is a simple epidemiologic model in which each individual in a population takes one of three possible states: Susceptible (S), Infected (I), or Recovered (R).

At each time step, each infected (I) individual has some probability p of coming into contact with each susceptible (S) individual, independently of the others. If a susceptible individual comes into contact with at least one infected individual, they will become infected for the next time step and recovered (R) the time step after that. As such, each infected individual is only infected for one time step and cannot be re-infected after they reach 'recovered' status.

## What does this look like?
The examples below show a few different Reed-Frost simulations with a population size of 150 and 1 initial infection.


<html>
  <p>First, let's try the simulation with p=0.005 (in other words, there is a 0.5% chance of contact between each pair of individuals in the population at each time step). With this small value of p, we can see that the disease dies out before most of the population gets infected. Think of this as the effect of social distancing: if there is less contact between individuals in the population, there will be fewer opportunities for infection.</p>
<iframe width="50%" height="50%" src="rfvideo3.mp4"></iframe>
<br>  
<p>Now let's try the simulation with a higher probability of contact, p=0.015. In this example, the disease spreads much more quickly through the population, but there are still some people who never get infected.</p>  
<iframe width="600" height="400" src="rfvideo.mp4"></iframe>
<br>
<p>Finally, let's try p=0.05. In this example, contact between individuals is more likely, and the disease quickly spreads to the entire population.</p>
<iframe width="600" height="400" src="rfvideo2.mp4"></iframe>
<br>  
</html>

[View](https://github.com/jamie-forschmiedt/reedfrost/blob/gh-pages/ReedFrostVideo.R) the R code for the simulation on GitHub.

[Download](https://downgit.github.io/#/home?url=https://github.com/jamie-forschmiedt/reedfrost/blob/gh-pages/ReedFrostVideo.R) the R code for the simulation.


<!---
```{r}
## this shows some R code
## will figure this out later

```

## Welcome to GitHub Pages

You can use the [editor on GitHub](https://github.com/jamie-forschmiedt/practice/edit/gh-pages/index.md) to maintain and preview the content for your website in Markdown files.

Whenever you commit to this repository, GitHub Pages will run [Jekyll](https://jekyllrb.com/) to rebuild the pages in your site, from the content in your Markdown files.

### Markdown


Markdown is a lightweight and easy-to-use syntax for styling your writing. It includes conventions for

```markdown
Syntax highlighted code block

# Header 1
## Header 2
### Header 3

- Bulleted
- List

1. Numbered
2. List

**Bold** and _Italic_ and `Code` text

[Link](url) and ![Image](src)
```

For more details see [GitHub Flavored Markdown](https://guides.github.com/features/mastering-markdown/).

### Jekyll Themes

Your Pages site will use the layout and styles from the Jekyll theme you have selected in your [repository settings](https://github.com/jamie-forschmiedt/practice/settings). The name of this theme is saved in the Jekyll `_config.yml` configuration file.

### Support or Contact

Having trouble with Pages? Check out our [documentation](https://docs.github.com/categories/github-pages-basics/) or [contact support](https://github.com/contact) and we’ll help you sort it out.

--->
