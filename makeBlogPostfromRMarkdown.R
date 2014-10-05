# From: http://www.r-bloggers.com/creating-jekyll-blog-posts-from-r/

# Create your R Markdown document with embedded code and graphics. Follow standard R Markdown syntax.
# Save this R Markdown file on your local machine.
# Create an new R Script and call it whatever you like. Mine is “makeBlogPostfromRMarkdown.R”
# Minimally, this script should contain the following code:


myjekyllsite = c("http://panto.github.io/")

KnitPost <- function(input, base.url = myjekyllsite) {
    require(knitr)
    opts_knit$set(base.url = base.url)
    fig.path <- paste0("figs/", sub(".Rmd$", "", basename(input)), "/")
    opts_chunk$set(fig.path = fig.path)
    opts_chunk$set(fig.cap = "center")
    render_jekyll()
    knit(input, envir = parent.frame())
}

KnitPost("paradoks-dnia-urodzin.Rmd")

# Move the resulting image folder (called ‘figs’) to your local git repository for your Jekyll site.
# Move the resulting markdown file to your local posts folder for your Jekyll site.
# Add YML front matter to the head of the newly generated markdown file.
# Note: You need to set the “base url” in the code to the full blog site URL or the Feedburner feed won’t
# pick up the images in the “fig” folder.