(setq elfeed-feeds
      (append
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
         ("https://www.thanassis.space/rss.xml" programming)
         ("http://steve-yegge.blogspot.com/atom.xml" programming)
         ("http://journal.stuffwithstuff.com/atom.xml" programming)
         ("https://gbracha.blogspot.com/feeds/posts/default" programming)
         ("https://chriskiehl.com/rss.xml" programming)
         ("https://queue.acm.org/rss/feeds/latestitems.xml" cs)
         ("https://blog.veitheller.de/feed.rss" programming)
         ("https://www.hillelwayne.com/index.xml" programming)
         ("https://henrikwarne.com/feed/" programming)
         ("https://yurichev.com/news/rss.xml" programming math)
         ("https://deprogrammaticaipsum.com/feed/" programming)
         ("https://pavpanchekha.com/rss.xml" programming cs)
         ("https://novalis.org/blog/atom.xml" programming)

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
         ("https://chrispenner.ca/atom.xml" haskell programming fp)
         ("https://blog.poisson.chat/rss.xml" haskell programming fp)

         ;; Programming – Lisp
         ("http://planet.lisp.org/rss20.xml" lisp fp programming)
         ("https://lisp.space/feed.xml" lisp fp programming)
         ("http://lispy.wordpress.com/feed/" lisp fp programming)
         ("http://xach.livejournal.com/data/atom" lisp fp programming)
         ("http://funcall.blogspot.com/feeds/posts/default" lisp fp programming)
         ("http://feeds2.feedburner.com/stevelosh" lisp fp programming)
         ("http://planet.emacs-es.org/rss20.xml" lisp fp programming es)
         ("http://www.scheme.dk/planet/atom.xml" scheme)
         ("https://lisp.sh/feed.atom" racket)
         ("https://recursive.games/rss.xml" lisp programming games)
         ("http://www.lispology.com/rss?JHE+3" lisp programming)
         ("https://hyperthings.garden/rss/all-posts.xml" lisp programming)
         ("https://www.tfeb.org/fragments/feeds/all.atom.xml" lisp programming)
         ("https://alex-hhh.github.io/feeds/all.atom.xml" lisp programming racket)

         ("http://planet.squeak.org/" smalltalk programming)

         ;; Programming – Clojure
         ("http://planet.clojure.in/atom.xml" clojure programming)
         ("http://gigasquidsoftware.com/atom.xml" clojure programming)
         ("https://tonsky.me/blog/atom.xml" clojure programming )

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

         ;; Data
         ("https://modern-sql.com/feed" data sql)
         ("https://kieranhealy.org/index.xml" data visualization R)
         ("https://chris-said.io/" data)
         ("http://datagenetics.com/feed/rss.xml" data)
         ("http://www.cs.cmu.edu/~pavlo//blog/feed.xml" data)
         ("https://caitlinhudon.com/feed/" data)
         ("https://www.locallyoptimistic.com/index.xml" data)
         ("https://meltano.com/blog/feed/" data etl)
         ("https://planet.postgresql.org/rss20.xml" data postgresql)
         ("http://www.cs.cmu.edu/~pavlo//blog/feed.xml" data distributed-systems)
         ("http://dbmsmusings.blogspot.com/feeds/posts/default" data distributed-systems)
         ("https://www.brentozar.com/feed/" data)
         ("https://blog.djnavarro.net/index.xml" data R)

         ;; R
         ("https://4dpiecharts.com/feed/" R)

         ;; Emacs
         ("http://planet.emacsen.org/atom.xml" emacs)
         ("https://planet.emacslife.com/atom.xml" emacs)
         ("https://asylum.madhouse-project.org/blog/atom.xml" emacs programming)
         ("http://www.masteringemacs.org/feed/" emacs)
         ("https://emacs.wordpress.com/feed/" emacs)
         ("http://pragmaticemacs.com/" emacs)
         ("http://www.howardism.org/index.xml" emacs)
         ("http://mbork.pl/?action=rss" emacs)
         ("https://blog.tecosaur.com/tmio/rss.xml" emacs org)
         ("https://scripter.co/atom.xml" emacs org)

         ;; Vim
         ("http://howivim.com/feed.xml" vim)

         ;; Cinema
         ("http://www.i400calci.com/feed/" cinema interesting)

         ;; Music

         ;; Comics
         ("http://www.fumettologica.it/feed/" comics)
         ("http://xkcd.com/atom.xml" comics dailycomic)
         ("http://blog.xkcd.com/feed/" comics books)
         ("http://www.smbc-comics.com/rss.php" comics)
         ("http://feeds.feedburner.com/wondermark" comics)
         ("http://www.phdcomics.com/gradfeed.php" comics)
         ("http://abstrusegoose.com/atomfeed.xml" comics)
         ("http://www.casualvillain.com/Unsounded/feed/" comics)
         ("http://feeds.feedburner.com/zenpencils" comics)

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
         ("https://www.tor.com/tag/jo-walton-reads/feed/" sf)

         ;; Chess
         ("http://www.danamackenzie.com/blog/?feed=rss2" chess)

         ;; Personal blogs
         ("https://scattered-thoughts.net/atom.xml" data programming interesting)
         ("https://lexi-lambda.github.io/feeds/all.rss.xml")
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
         ("http://regex.info/blog/feed" maybe)
         ("http://ariis.it/static/stream/rss.xml")
         ("http://babbagefiles.blogspot.com/feeds/posts/default" maybe)
         ("https://babbagefiles.xyz/index.xml" maybe)
         ("http://bactra.org/notebooks/index.rss")
         ("http://bactra.org/weblog/index.rss")
         ("http://emacsninja.com/feed.atom")
         ("http://r6.ca/blog/feed.atom" maybe)
         ("https://fare.livejournal.com/data/atom" maybe)
         ("https://shitpost.plover.com/index.atom")
         ("https://grumpygamer.com/rss")
         ("https://two-wrongs.com/feed.xml")
         ("https://11011110.github.io/blog/feed.xml")
         ("https://drewdevault.com/feed.xml" cs)
         ("https://falsemachine.blogspot.com/feeds/posts/default?alt=rss" books)
         ("https://ww.telent.net/news.rss")
         ("http://johnj.com/feed.xml")
         ("https://blog.nelhage.com/atom.xml")
         ("http://pchiusano.github.io/feed.xml")
         ("https://beepb00p.xyz/atom.xml")
         ("https://willschenk.com/feed.xml" maybe)
         ("https://sandymaguire.me/atom.xml")
         ("https://reasonablypolymorphic.com/atom.xml")
         ("http://muratbuffalo.blogspot.com/feeds/posts/default" cs distributed-systems)
         ("https://www.singlelunch.com/feed/" maybe)
         ("https://fluca1978.github.io/feed.xml")
         ("https://amitp.blogspot.com/feeds/posts/default")
         ("https://simblob.blogspot.com/feeds/posts/default")
         ("https://jameshunt.us/rss-bro.xml" programming)
         ("https://blog.jessfraz.com/post")
         ("https://blog.melyanna.net/feed/" maybe)
         ("https://wingolog.org/feed/atom" maybe evans)
         ("https://blog.bonnieeisenman.com/feed.xml" maybe evans)
         ("https://www.elidedbranches.com/feeds/posts/default" maybe evans)
         ("https://chelseatroy.com/feed/" maybe evans)
         ("https://allthingslinguistic.com/rss" maybe evans)
         ("https://blog.jfo.click/feed.xml" evans)
         ("http://composition.al/atom.xml" maybe evans)
         ("https://blog.nelhage.com/atom.xml" maybe evans)
         ("https://rachelbythebay.com/w/atom.xml" maybe evans)
         ("https://raphlinus.github.io/feed.xml" maybe evans)
         ("https://robertheaton.com/feed.xml" maybe evans)
         ("https://www.harihareswara.net/rss.xml" maybe evans)
         ("https://vicki.substack.com/feed/" maybe evans)
         ("https://feeds.feedburner.com/martinkl")
         ("https://eighty-twenty.org/index.atom")
         ("http://www.ultimatemark.com/feed/")
         ("https://erikbern.com/atom.xml")
         ("https://astralcodexten.substack.com/feed")
         ("https://danluu.com/atom.xml" interesting)
         ("https://jcs.org/rss")
         ("https://fabiensanglard.net/rss.xml")
         ("https://danpker.com/posts/index.xml")
         ("https://work.lisk.in/atom.xml")
         ("https://countvajhula.com/feed/")
         ("https://thesephist.com/index.xml")
         ("https://pluralistic.net/feed/" maybe)
         ("https://chreke.com/feeds/all.atom.xml" programming languages)
         ("https://archiloque.net/blog/atom.xml" maybe)
         ("https://blog.dshr.org/feeds/posts/default" maybe)

         ;; misc stuff
         ("http://usesthis.com/feed/" setup)
         ("http://chneukirchen.org/trivium/index.atom" links interesting)
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
         ("http://www.netflixlovers.it/rss" netflix clutter)
         ("http://onethingwell.org/rss" software)
         ("https://functionaljobs.com/jobs/search/?q=berlin&format=rss" jobs fp)
         ("https://twobithistory.org/feed.xml")
         ("http://catless.ncl.ac.uk/risksrss2.xml")
         ("http://tech.marksblogg.com/feeds/all.atom.xml")
         ("http://www.elidedbranches.com/feeds/posts/default")
         ("https://lethain.com/feeds/" maybe engineering management)
         ("http://n-gate.com/index.rss" interesting links)
         ("https://thetechnicalgeekery.com/feed.xml" maybe)
         ("https://controlaltbackspace.org/feed.xml" maybe)
         ("https://apod.nasa.gov/apod.rss")
         ("https://www.gatesnotes.com/rss" books)
         ("https://plaintextproject.online/feed.xml")
         ("https://www.lescienze.it/rss/all/rss2.0.xml" maybe)
         ("https://www.boristhebrave.com/feed/" games programming interesting)
         ("https://blogs.igalia.com/itoral/feed/" maybe graphics)

         ;; maybe
         ("https://blog.tymoon.eu/" maybe)
         ("http://adereth.github.io/atom.xml" maybe)
         ("https://eight2late.wordpress.com/feed/" maybe)
         ("http://feeds.akkartik.name/kartiks-scrapbook" maybe)
         ("http://realworldclojure.com/feed.xml" maybe)
         ("http://www.shortscience.org/rss.xml" maybe)
         ("https://interi.org/feed/" maybe)
         ("http://www.camilletalk.com/whilefalse?format=RSS" maybe)
         ("http://vicsydev.blogspot.com/feeds/posts/default?alt=rss" maybe)
         ("http://www.the2bears.com/?p=614" maybe gaming)
         ("http://dannyreviews.com/rss.xml" maybe books)
         ("http://bravenewgeek.com/feed/" maybe)
         ("http://www.nonsolo8bit.it/feed/" maybe 8bit programming)
         ("https://www.dgmlive.com/feeds/rss/diaries" maybe)
         ("http://acta-lingweenie.blogspot.com/feeds/posts/default" maybe)
         ("https://p1k3.com/feed" maybe)
         ("http://www.felienne.com/feed" maybe)
         ("https://www.filfre.net/feed/" maybe)
         ("http://linesandcolors.com/feed/" art maybe)
         ("http://www.cachestocaches.com/feed/" maybe)
         ("https://adventuregamers.com/rss/" maybe games adventures)
         ("https://acoup.blog/feed/" maybe)
         ("https://kiwihellenist.blogspot.com/feeds/posts/default" maybe)
         ("https://mantovauno.it/tag/castiglione/feed/" news local castiglione maybe)
         ("https://artemis.sh/feed.xml" maybe personal)
         ("https://rwmj.wordpress.com/feed/" maybe personal)

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

         ;; Youtube channels
         ("https://www.youtube.com/channel/UC05HyblY4hgLPzQYUfTJhHw" youtube bikes) ; Cyclo ergo sum
         ("https://www.youtube.com/channel/UCMV8p6Lb-bd6UZtTc_QD4zA" youtube lisp programming) ; TheBaggers
         ("https://www.youtube.com/channel/UC0uTPqBCFIpZxlz_Lv1tk_g" youtube emacs programming) ; Protesilaos Stavrou



         ;; Biking
         ("http://ridinggravel.com/feed/" bikes)
         ("https://www.cyclingabout.com/feed/" bikes)
         ("https://www.bikepacking.it/feed/" bikes italian))

       ;; Brent Ozar feeds, tentative
       ;; (removed some stuff from the initial list found here: https://github.com/BrentOzar/sqlblogs)
       (mapcar (lambda (f)
                 `(,(first f) brentozar maybe))
               '(("http://blog.2ndquadrant.com/feed/")
                 ("https://momjian.us/main/rss/pgblog.xml")
                 ("http://feeds.feedburner.com/depesz")
                 ("https://www.citusdata.com/feed.xml")
                 ("https://aws.amazon.com/blogs/database/tag/amazon-aurora/feed/")
                 ("https://debthedba.wordpress.com/feed/")
                 ("http://joedantoni.wordpress.com/feed/")
                 ("https://medium.com/feed/ingeniouslysimple")
                 ("http://cindygross.wordpress.com/feed/")
                 ("http://www.sqlskills.com/blogs/erin/feed/")
                 ("https://codingfamily.net/feed/")
                 ("https://www.0xsql.com/feed/")
                 ("http://port1433.com/feed/")
                 ("https://www.patrickkeisler.com/feed/")
                 ("http://feeds.feedburner.com/TheDatabaseWhisperer")
                 ("https://www.tsql-ninja.com/feed/")
                 ("http://blog.victoriaholt.co.uk/feeds/posts/default")
                 ("http://zenbytes.net/?feed=rss2")
                 ("http://www.davidklee.net/feed/")
                 ("https://michelleadavid.wordpress.com/feed/")
                 ("http://desertdba.com/feed/")
                 ("http://feeds2.feedburner.com/PaulSRandal")
                 ("http://www.brindlesolutions.com/feed/")
                 ("http://blogs.lobsterpot.com.au/feed/")
                 ("https://jimbabwe.co.za/feed/")
                 ("http://www.sqlskills.com/blogs/tim/feed/")
                 ("http://www.desertislesql.com/wordpress1/?feed=rss2")
                 ("http://www.sqlpassion.at/feed/")
                 ("http://feeds.feedburner.com/brent-ozar")
                 ("https://www.enricovandelaar.com/feed/")
                 ("http://auntkathisql.com/feed/")
                 ("http://www.nikoport.com/feed/")
                 ("https://mitchwheat.com/feed/")
                 ("http://sqlflipflopsdba.com/feed/")
                 ("https://mrfoxsql.wordpress.com/feed/")
                 ("https://rabryst.ca/feed/")
                 ("http://www.centinosystems.com/blog/feed/")
                 ("http://littlekendra.com/feed/")
                 ("http://www.martinguth.de/feed/")
                 ("https://tarynpivots.com/index.xml")
                 ("http://www.sqlgene.com/feed/")
                 ("http://sqlkover.com/feed/")
                 ("http://am2.co/feed/")
                 ("https://dotnetvibes.com/feed/")
                 ("http://blog.infoadvisors.com/index.php/feed/")
                 ("https://groupby.org/feed/")
                 ("http://www.dba-art.com/feed/")
                 ("https://www.sheldonhull.com/tags/tech/feed.xml")
                 ("http://clusteringformeremortals.com/feed/")
                 ("https://pianorayk.wordpress.com/feed/")
                 ("http://dallasdbas.com/feed/")
                 ("https://sqlreitse.home.blog/feed/")
                 ("http://tracyboggiano.com/feed/")
                 ("https://sqlkiwi.blogspot.com/feeds/posts/default")
                 ("https://social.technet.microsoft.com:443/Profile/u/activities/feed?displayName=Kevin%20Farlee%20%5BMSFT%5D")
                 ("http://sqlsunday.com/feed/")
                 ("http://blog.bartekr.net/feed/")
                 ("http://sqldatapartners.com/feed/")
                 ("http://blog.garrybargsley.com/feed/")
                 ("https://thenonclutteredindex.com/feed/")
                 ("http://datasavvy.wordpress.com/feed/")
                 ("https://www.drewsk.tech/feed/")
                 ("http://jasonbrimhall.info/feed/")
                 ("http://sql-sasquatch.blogspot.com/feeds/posts/default")
                 ("http://www.thebiccountant.com/feed/")
                 ("http://feeds.feedburner.com/agilesql/Blog")
                 ("http://davebland.com/feed")
                 ("http://www.sqlha.com/Blog/syndication.axd?format=rss")
                 ("https://gregdodd.me/feed/")
                 ("http://www.made2mentor.com/?feed=atom")
                 ("http://sqljana.wordpress.com/feed/")
                 ("http://markvsql.com/feed/")
                 ("https://matthewmcgiffen.com/feed/")
                 ("http://sqlstudies.com/feed/")
                 ("http://feeds2.feedburner.com/timmitchell")
                 ("http://www.riepedia.net/feeds/posts/default")
                 ("http://cwebbbi.spaces.live.com/feed.rss")
                 ("http://www.sqlskills.com/blogs/glenn/feed/")
                 ("http://stevestedman.com/feed/")
                 ("http://www.cathrinewilhelmsen.net/feed/")
                 ("http://www.sqlskills.com/BLOGS/jonathan/syndication.axd")
                 ("http://theserogroup.com/feed/")
                 ("http://sqlrus.com/feed/")
                 ("http://www.sql-aus-hamburg.de/feed/")
                 ("https://www.michaelscalise.com/feed/")
                 ("http://procuresql.com/feed/")
                 ("https://bertwagner.com/feed/")
                 ("https://curiousaboutdata.com/feed/")
                 ("http://sqlworldwide.com/feed/")
                 ("http://feeds.feedburner.com/JamesSerra")
                 ("https://www.mlakartechtalk.com/feed/")
                 ("https://timharkin.com/feed/")
                 ("http://thelonedba.wordpress.com/feed/")
                 ("https://richardbriansmith.com/feed/")
                 ("http://www.jenstirrup.com/feeds/posts/default")
                 ("http://minionware.net/feed/")
                 ("http://www.bradleyschacht.com/feed/")
                 ("http://www.straightpathsql.com/blog/atom.xml")
                 ("http://itsalljustelectrons.blogspot.com/feeds/posts/default?alt=rss")
                 ("http://skreebydba.com/feed/")
                 ("https://toddkleinhans.wordpress.com/feed/")
                 ("http://feeds.feedburner.com/MichaelSwart")
                 ("https://bornsql.ca/feed/")
                 ("http://joshthecoder.com/feed.xml")
                 ("http://feeds.feedburner.com/RyanAdamsBlog")
                 ("http://dbaduck.com/feed/")
                 ("http://codingsight.com/feed/")
                 ("https://sqlquantumleap.com/feed/")
                 ("http://facility9.com/feed/atom/")
                 ("http://feeds.feedburner.com/SQLRockstar")
                 ("https://codejuicer.com/feed/")
                 ("https://medium.com/feed/azure-sqldb-managed-instance")
                 ("https://sqlundercover.com/feed/")
                 ("https://github.com/joesackmsft.atom")
                 ("http://anothersqlgeek.wordpress.com/feed/")
                 ("http://feeds.feedburner.com/Sqlvariations")
                 ("http://moochingtusk.wordpress.com/feed/")
                 ("https://blog.coeo.com/rss.xml")
                 ("https://dansqldba.com/feed/")
                 ("https://blobeater.blog/feed/")
                 ("https://www.datahelge.no/feed/")
                 ("http://www.ford-it.com/sqlagentman/?feed=rss2")
                 ("http://sqldbawithabeard.com/feed/")
                 ("https://witsociety.wordpress.com/feed/")
                 ("http://arcanecode.wordpress.com/feed/")
                 ("https://forrestmcdaniel.com/feed/")
                 ("https://nocolumnname.wordpress.com/feed/")
                 ("https://www.coatesdatastrategies.com/blog?format=RSS")
                 ("https://mohammaddarab.com/feed/")
                 ("http://sqlinthewild.co.za/index.php/feed/")
                 ("http://chrisadkin.org/feed/")
                 ("https://www.sqlmelody.com/feed/")
                 ("http://www.sqlfingers.com/feeds/posts/default")
                 ("http://itknowledgeexchange.techtarget.com/sql-server/feed/")
                 ("http://www.sqlkohai.com/feed/")
                 ("http://www.gethynellis.com/feeds/posts/default")
                 ("http://blog.waynesheffield.com/wayne/feed/")
                 ("http://sqlswimmer.wordpress.com/feed/")
                 ("http://feeds.feedburner.com/StraightpathSolutionsSqlBlog")
                 ("https://schottsql.wordpress.com/feed/")
                 ("http://milossql.wordpress.com/feed/")
                 ("https://jesspomfret.com/feed/")
                 ("http://www.youdidwhatwithtsql.com/feed")
                 ("http://blog.developpez.com/mikedavem/feed")
                 ("http://nedotter.com/feed/")
                 ("http://feeds.feedburner.com/MarlonRibunal")
                 ("http://buckwoody.wordpress.com/feed/")
                 ("http://projectbotticelli.com/rss.xml")
                 ("http://feeds.feedburner.com/itdepends")
                 ("http://dbafromthecold.wordpress.com/feed/")
                 ("https://claudioessilva.eu/feed/")
                 ("http://36chambers.wordpress.com/feed/")
                 ("http://kevinekline.com/feed/")
                 ("http://www.sqlperformance.com/feed")
                 ("http://andyleonard.blog/feed/")
                 ("https://sqltechblog.com/feed/")
                 ("http://georgestocker.com/feed/")
                 ("https://blog.sqldoch.ca/feeds/posts/default")
                 ("http://chrisyatessql.wordpress.com/feed/")
                 ("http://www.sqlbobt.com/feed/")
                 ("https://www.sqlguatemala.com/feeds/posts/default?alt=rss")
                 ("http://spaghettidba.com/feed/")
                 ("https://flxsql.com/feed/")
                 ("http://www.bobpusateri.com/feed/")
                 ("http://royalsql.com/feed/")
                 ("http://blog.netnerds.net/feed/")
                 ("http://blog.sqlauthority.com/feed/")
                 ("http://cwebbbi.wordpress.com/feed/")
                 ("https://sqlrambling.net/feed/")
                 ("http://johnsterrett.com/feed/")
                 ("http://www.databasejournal.com/icom_includes/feeds/dbjournal/xml_front-10.xml")
                 ("http://sqlplayer.net/feed")
                 ("http://blogs.technet.com/dataplatforminsider/atom.xml")
                 ("http://sqlrecords.blogspot.com/feeds/posts/default")
                 ("http://www.sqlskills.com/blogs/paulselec/syndication.axd?format=rss")
                 ("http://gkdba.wordpress.com/feed/")
                 ("https://sqlmac.com/feed/")
                 ("http://diligentdba.wordpress.com/feed/")
                 ("http://blogs.technet.com/dataplatforminsider/rss.xml")
                 ("https://www.kevinrchant.com/feed/")
                 ("http://slavasql.blogspot.com/feeds/posts/default")
                 ("http://richardlees.blogspot.com/feeds/posts/default")
                 ("https://www.sqlozano.com/feed/")
                 ("https://www.hydrate.consulting/blog/feed/")
                 ("http://feeds.feedburner.com/sqlbi_blog/")
                 ("http://dataperfpro.com/feed/")
                 ("http://blogs.prodata.ie/syndication.axd")
                 ("http://www.sqlstad.nl/feed/")
                 ("http://sqlblog.karaszi.com/feed/")
                 ("http://feeds.feedburner.com/Official_PASS_Blog")
                 ("https://craigporteous.com/feed/")
                 ("https://sqlblog.org/feed")
                 ("http://www.seangallardy.com/feed/")
                 ("http://www.midnightdba.com/Jen/feed/")
                 ("https://richbenner.com/feed/")
                 ("https://dbatools.io/feed/")
                 ("http://www.arcticdba.se/?feed=rss2")
                 ("http://lisagb.info/feed")
                 ("https://api.reddit.com/subreddit/Database/b9b4bcd6-0872-437f-91b5-5ab7e37ac8a3")
                 ("https://api.reddit.com/subreddit/SQL/b9b4bcd6-0872-437f-91b5-5ab7e37ac8a3")))))
