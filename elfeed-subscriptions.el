
(setq elfeed-feeds
      '(
        ;; Programming
        ("http://lambda-the-ultimate.org/rss.xml" programming cs)
        ("http://blog.thimbleweedpark.com/rss" games programming adventures)
        ("http://technomancy.us/feed/atom.xml" programming)
        ("http://wadler.blogspot.it/atom.xml" cs fp programming)
        ("http://conscientiousprogrammer.com/atom.xml" programming)
        ("http://tratt.net/laurie/blog/entries.rss" programming)
        ("http://nakkaya.com/rss-feed" programming)
        ("http://feeds.feedburner.com/ArcaneSentiment" programming)
        ("http://matt.might.net/articles/feed.rss" programming cs)
        
        ;; Programming – Haskell
        ("http://www.haskell-ita.it/atom.xml" haskell fp programming)
        ("http://planet.haskell.org/rss20.xml" haskell fp programming)
        ("http://donsbot.wordpress.com/feed/" haskell fp programming)
        ("http://jaspervdj.be/rss.xml" programming haskell)
        ("http://bitemyapp.com/" programming haskell)
        ("http://lambda.jstolarek.com/feed/" programming haskell)
        ("http://sigfpe.blogspot.com/feeds/posts/default" cs programming haskell)
        ("http://matthiasnehlsen.com/atom.xml" fp programming)
        ("http://stefanorodighiero.net/atom.xml" personal programming)
        ("http://chrisdone.com/rss.xml" haskell fp programming)
        ("https://byorgey.wordpress.com/feed/" haskell fp programming math)
        ("http://joeyh.name/blog/index.rss" haskell fp programming)
        ("https://pbrisbin.com/feed/index.xml" haskell fp programming)
        
        ;; Programming – Lisp
        ("http://planet.lisp.org/rss20.xml" lisp fp programming)
        ("https://lisp.space/feed.xml" lisp fp programming)
        ("http://lispy.wordpress.com/feed/" lisp pf programmin)
        ("http://xach.livejournal.com/data/atom" lisp fp programming)
        ("http://funcall.blogspot.com/feeds/posts/default" lisp fp programming)

        ;; Math
        ("http://blogs.ams.org/visualinsight/feed/" math)
        ("http://blogs.ams.org/blogonmathblogs/" math)
        ("http://jeremykun.wordpress.com/feed/" math programming cs)
        ("https://jeltsch.wordpress.com/feed/" math cs programming)
        ("http://mathlesstraveled.com" math)
        ("http://blog.stephenwolfram.com/feed/" math science)
        ("http://blog.ifem.co.uk/feed/" math)
        ("https://egtheory.wordpress.com/feed/" cs evolution gametheory)
        
        ;; Emacs
        ("http://planet.emacsen.org/atom.xml" emacs)
        ("https://asylum.madhouse-project.org/blog/atom.xml" emacs programming)
        ("http://www.masteringemacs.org/feed/" emacs)
        ("https://emacs.wordpress.com/feed/" emacs)
        
        ;; Cinema
        ("http://www.i400calci.com/feed/" cinema)
        
        ;; Comics
        ("http://www.fumettologica.it/feed/" comics)
        ("http://xkcd.com/atom.xml" comics dailycomic)
        ("http://blog.xkcd.com/feed/" comics books)
        
        ;; SF
        ("http://scifiinterfaces.wordpress.com/feed/" sf ux ui)
        ("http://www.antipope.org/charlie/blog-static/atom.xml" sf )
        ("http://scifistorm.org/scifistorm.rdf" sf)
        ("http://lennesimoblogdellafantascienza.wordpress.com/feed/" sf)
        ("http://www.tor.com/feed" sf)
        ("http://whatever.scalzi.com/feed/" sf)
        ("http://www.sfsignal.com/index.rdf" sf)

        ;; Chess
        ("http://www.danamackenzie.com/blog/?feed=rss2" chess)

        ;; Personal blogs
        ("http://feeds.feedburner.com/butshesagirl")
        ("http://cartesianfaith.com/feed/")
        ("http://jasmcole.com/feed/")
        ("http://susan-stepney.blogspot.com/feeds/posts/default?alt=rss" books science)
        
        ;; misc stuff
        ("http://boingboing.net/index.xml" clutter)
        ("http://nautil.us/rss/all")
        ("http://usesthis.com/feed/" setup)
        ("http://chneukirchen.org/trivium/index.atom")
        ("http://www.bytecellar.com/feed/" retrocomputing)
        
        ))