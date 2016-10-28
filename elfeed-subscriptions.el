
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
        ("http://programmingisterrible.com/rss" programming)
        ("http://aegisknight.org/feed" programming)
        ("http://www.lunaryorn.com/feed.atom" programming)
        ("https://rkrishnan.org/atom.xml" programming)
        ("http://chromakode.com/recent.atom" programming)
        ("http://www.newartisans.com/rss.xml" programming)
        ("http://aliquote.org/memos/rss/" programming)
        ("http://blog.racket-lang.org/feeds/posts/default" programming racket)
        ("http://belkadan.com/blog/atom" programming)
        ("http://blog.fogus.me/feed/" programming)
        
        ;; Programming – Perl
        ("http://pl6anet.org/atom.xml" perl programming)
        ("https://rjbs.manxome.org/rubric/entries/user/rjbs/has_body/1?format=rss")
        
        ;; Programming – Haskell
        ("http://www.haskell-ita.it/atom.xml" haskell fp programming)
        ("http://planet.haskell.org/rss20.xml" haskell fp programming)
        ("http://donsbot.wordpress.com/feed/" haskell fp programming)
        ("http://jaspervdj.be/rss.xml" programming haskell)
        ("http://bitemyapp.com/" programming haskell)
        ("http://lambda.jstolarek.com/feed/" programming haskell)
        ("http://sigfpe.blogspot.com/feeds/posts/default" cs programming haskell)
        ("http://matthiasnehlsen.com/atom.xml" fp programming)
        ("http://chrisdone.com/rss.xml" haskell fp programming)
        ("https://byorgey.wordpress.com/feed/" haskell fp programming math)
        ("http://joeyh.name/blog/index.rss" haskell fp programming)
        ("https://pbrisbin.com/feed/index.xml" haskell fp programming)
        ("http://comonad.com/reader/feed/" haskell programming cs)
        
        ;; Programming – Lisp
        ("http://planet.lisp.org/rss20.xml" lisp fp programming)
        ("https://lisp.space/feed.xml" lisp fp programming)
        ("http://lispy.wordpress.com/feed/" lisp pf programmin)
        ("http://xach.livejournal.com/data/atom" lisp fp programming)
        ("http://funcall.blogspot.com/feeds/posts/default" lisp fp programming)
        ("http://feeds2.feedburner.com/stevelosh" lisp fp programming)
        ("http://planet.emacs-es.org/rss20.xml" lisp fp programming es)
        
        ;; Programming – Clojure
        ("http://planet.clojure.in/atom.xml" clojure programming)
        
        ;; Math
        ("http://blogs.ams.org/visualinsight/feed/" math)
        ("http://blogs.ams.org/blogonmathblogs/" math)
        ("http://jeremykun.wordpress.com/feed/" math programming cs)
        ("https://jeltsch.wordpress.com/feed/" math cs programming)
        ("http://mathlesstraveled.com" math)
        ("http://blog.stephenwolfram.com/feed/" math science)
        ("http://blog.ifem.co.uk/feed/" math)
        ("https://egtheory.wordpress.com/feed/" cs evolution gametheory)
        ("http://math.andrej.com/feed/" cs math)
        ("http://blog.acolyer.org/feed/" cs)
        ("http://www.scottaaronson.com/blog/?feed=rss2" cs)
        ("https://golem.ph.utexas.edu/category/atom11.xml" math)
        ("https://mathbabe.org/feed/" math)
        ("https://terrytao.wordpress.com/feed/" math)
        
        ;; Emacs
        ("http://planet.emacsen.org/atom.xml" emacs)
        ("https://asylum.madhouse-project.org/blog/atom.xml" emacs programming)
        ("http://www.masteringemacs.org/feed/" emacs)
        ("https://emacs.wordpress.com/feed/" emacs)
        ("http://pragmaticemacs.com/" emacs)

        ;; Vim
        ("http://howivim.com/feed.xml" vim)
        
        ;; Cinema
        ("http://www.i400calci.com/feed/" cinema)
        
        ;; Comics
        ("http://www.fumettologica.it/feed/" comics)
        ("http://xkcd.com/atom.xml" comics dailycomic)
        ("http://blog.xkcd.com/feed/" comics books)
        ("http://www.smbc-comics.com/rss.php" comics)
        ("http://feeds.feedburner.com/wondermark" comics)
        ("http://www.phdcomics.com/gradfeed.php" comics)
        ("http://abstrusegoose.com/atomfeed.xml" comics)
        ("http://www.casualvillain.com/Unsounded/feed/" comics)
        
        ;; SF
        ("http://scifiinterfaces.wordpress.com/feed/" sf ux ui)
        ("http://www.antipope.org/charlie/blog-static/atom.xml" sf )
        ("http://scifistorm.org/scifistorm.rdf" sf)
        ("http://lennesimoblogdellafantascienza.wordpress.com/feed/" sf)
        ("http://www.tor.com/feed" sf clutter)
        ("http://whatever.scalzi.com/feed/" sf)
        ("http://www.sfsignal.com/index.rdf" sf)
        ("http://auxiliarymemory.com/feed/" sf)
        ("http://andromedasf.altervista.org/feed/" sf)
        
        ;; Chess
        ("http://www.danamackenzie.com/blog/?feed=rss2" chess)

        ;; Personal blogs
        ("http://www.rousette.org.uk/blog/index.xml")
        ("http://cartesianfaith.com/feed/")
        ("http://jasmcole.com/feed/")
        ("http://susan-stepney.blogspot.com/feeds/posts/default?alt=rss" books science)
        ("http://www.joachim-breitner.de/blog_feed.rss")
        ("http://stephenramsay.us/atom.xml")
        ("https://alexschroeder.ch/wiki/feed/full/")
        ("https://mcristi.wordpress.com/feed/")
        ("http://www.charlespetzold.com/rss.xml")
        ("https://cartesianproduct.wordpress.com/feed/")
        
        ;; misc stuff
        ("http://boingboing.net/index.xml" clutter)
        ("http://nautil.us/rss/all")
        ("http://usesthis.com/feed/" setup)
        ("http://chneukirchen.org/trivium/index.atom" links)
        ("http://www.bytecellar.com/feed/" retrocomputing)
        ("http://basalgangster.macgui.com/RetroMacComputing/The_Long_View/rss.xml")
        ("http://ilovetypography.com/feed")
        ("http://www.ericrochester.com/atom.xml")
        ("http://blog.datadive.net/feed/")
        ("https://rpgcharacters.wordpress.com/feed/" rpg maps)
        ("https://lovecraftianscience.wordpress.com/feed/")
        ("https://damiengwalter.com/feed/")
        ("http://themacro.com/feed.xml")
        ("http://www.datatau.com/rss")
        ("https://jasmcole.com/feed/")
        ("http://lanyrd.com/places/bologna/feed/" conferences bologna)
        ("http://onethingwell.org/rss" software)
        
        ;; maybe
        ("https://blog.tymoon.eu/" maybe)
        ("http://adereth.github.io/atom.xml" maybe)
        ("https://eight2late.wordpress.com/feed/" maybe)
        ("http://feeds.akkartik.name/kartiks-scrapbook" maybe)
        ("https://backchannel.com/feed" maybe)
        ("http://realworldclojure.com/feed.xml" maybe)
        
        ;; suggested by Dan Luu -- 2016/05/03
        ("http://blog.nullspace.io/feed.xml" danluu maybe)
        ("http://akaptur.com/atom.xml" danluu maybe)
        ("http://www.chrisfenton.com/feed/" danluu maybe)
        ("https://codewords.recurse.com/feed.xml" danluu maybe)
        ("http://mcfunley.com/feed/atom" danluu maybe)
        ("http://davidad.github.io/atom.xml" danluu maybe)
        ("http://eli.thegreenplace.net/feeds/all.atom.xml" danluu maybe)
        ("http://www.evanjones.ca/index.rss" danluu maybe)
        ("https://blog.lse.epita.fr/rssfeed.xml" danluu maybe)
        ("http://neverworkintheory.org/feed.xml" danluu maybe)
        ("http://feeds.feedburner.com/GustavoDuarte" danluu maybe)
        ("https://www.blogger.com/feeds/4534865332750558938/posts/default" danluu maybe)
        ;; ("http://blog.regehr.org/comments/feed" danluu maybe)
        ("https://www.snellman.net/blog/rss-index.xml" danluu maybe)
        
        ))
