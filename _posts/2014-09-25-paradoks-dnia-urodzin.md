---
layout: post
title: "Paradoks dnia urodzin"
author: "Tomasz Stąpor"
date: "4 September 2014"
imagefeature: cover6.jpg
output:
  html_document:
    theme: readable
    toc: yes
---

# Wstęp

Jak wiele osób potrzeba, by prawdopodobieństwo natrafienia na dwie osoby urodzone tego samego dnia wynosiło 0,5 (czyli potocznie 50%)? Intuicyjnie zkładamy, że trzeba tych osób znacznie więcej niż 23.


{% highlight r %}
qbirthday(p=0.5, class=365, coincident = 2)
{% endhighlight %}



{% highlight text %}
## [1] 23
{% endhighlight %}

# Wykres funkcji.

![center](/figs/paradoks-dnia-urodzin/unnamed-chunk-2.png) 

# Pytania w kontekście astrologicznym

Ile horoskopów przebadać, by mieć ponad 50% szansę na znalezienie 5 osób które mają Słońce i Księżyc w tym samym znaku?


{% highlight r %}
qbirthday(p=0.5, class=144, coincident = 5)
{% endhighlight %}



{% highlight text %}
## [1] 154
{% endhighlight %}

Szansa na spotk. w grup. 200 os. 4 lub więcej osób ze Słońcem w tym samym stopniu:


{% highlight r %}
pbirthday(n = 200, classes = 360, coincident = 4)
{% endhighlight %}



{% highlight text %}
## [1] 0.6024
{% endhighlight %}

Ile horoskopów przebadać, by mieć ponad 50% szansę na znalezienie 3 Koziorożców:


{% highlight r %}
qbirthday(p = 0.5, classes = 12, coincident = 3)
{% endhighlight %}



{% highlight text %}
## [1] 11
{% endhighlight %}

Prawdopodobieństwo, że 3 kolejnych partnerów ma Słońce w Rybach?

```
{r}pbirthday(n = 3, classes = 12, coincident = 3)
```

