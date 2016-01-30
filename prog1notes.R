ggpairs(mtcars[, 1:5], lower=list(continuous="smooth", mapping = ggplot2::aes(color = "blue")),
        diag=list(continuous="bar"), 
)

ggpairs(data=tips, # data.frame with variables
        columns=1:3, # columns to plot, default to all.
        title="tips data", # title of the plot
        mapping = ggplot2::aes(fill = "sex")
        ) # aesthetics, ggplot2 style

pm <- ggpairs(
    +     diamonds.samp[, 1:5],
    +     mapping = ggplot2::aes(color = cut),
    +     upper = list(continuous = wrap("density", alpha = 0.5), combo = "box"),
    +     lower = list(continuous = wrap("points", alpha = 0.3), combo = wrap("dot", alpha = 0.4)),
    +     title = "Diamonds"
    + )

xx <- ggpairs(
     mtcars,
     mapping = ggplot2::aes(color = am),
     upper = list(continuous = wrap("density", alpha = 0.5), combo = "box"),
     lower = list(continuous = wrap("points", alpha = 0.3), combo = wrap("dot", alpha = 0.4)),
     title = "mtcars"
     )
g <- ggpairs(mtcars[ ,1:6],
        mapping = ggplot2::aes(color = am),
        lower=list(continuous="smooth", combo="facetdensity", discrete="facetbar"), 
        upper=list(continuous="cor", combo="facethist", discrete="ratio")) + scale_fill_brewer()

g <- g + theme(legend.position = "none", 
      panel.grid.major = element_blank(), 
      axis.ticks = element_blank(), 
      panel.border = element_rect(linetype = "dashed", colour = "black", fill = NA))

add_to_plots <- function(pairs, modification) {
    str <- deparse(substitute(modification))
    pairs$plots <- lapply(pairs$plots, function(s) paste(s, '+', str))
    pairs
}

> add_to_plots(g, scale_colour_brewer(type = 'Pairs'))

