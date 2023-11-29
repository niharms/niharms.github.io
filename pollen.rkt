#lang racket

(module setup racket/base
  (provide (all-defined-out))
  (define linebreak-separator "//"))

(require pollen/decode
         pollen/misc/tutorial
         txexpr)

(provide (all-defined-out))


;--------------------------------------------------------------------------------------------------
; HTML Preprocessing
;--------------------------------------------------------------------------------------------------
(define (preprocess expr) (match expr
  [(txexpr 'simple-menu attrs elements) (format-simple-menu attrs elements)]
  [(txexpr tag attrs elements) (txexpr tag attrs (map preprocess elements))]
  )
)

(define (format-simple-menu-link lnk) (match lnk
  [(txexpr 'link (list (list 'src src)) text)
      (txexpr 'p (list (list 'class "simple-menu-link")) (list (txexpr 'a (list (list 'href src))
text)))]
  [_ (error "LINK FORMAT BAD TIMES")]
  )
)

(define (format-simple-menu attrs elements)
  (txexpr 'div (cons '(class "simple-menu") attrs) (map format-simple-menu-link elements)))

;--------------------------------------------------------------------------------------------------
; Logo
;--------------------------------------------------------------------------------------------------

(define (logo)
  `(div ((class "logo"))
    (a ((href "index.html"))
    (img ((class "logo") (src "/ornaments/titles/NH.png"))))))

;--------------------------------------------------------------------------------------------------
; Panels
;--------------------------------------------------------------------------------------------------

; Panel: Parallel Wide ----------------------------------------------------------------------------

(define (panel-parallel-panel width . elems)
  `(div ((class "parallel-block-spacer") (style ,(format "width:~a%;" width)))
   (div ((class "parallel-block")) ,@elems)))

(define (panel-parallel-wide . elems)
  `(div ((class "panel-parallel-wide")) ,@elems))

(define (panel-parallel-subpanel . elems)
  `(div ((class "panel-parallel-subpanel")) ,@elems))

; Panel: Gallery ----------------------------------------------------------------------------------

(define (panel-gallery . elems)
  `(div ((class "panel-gallery")) ,@elems))


; Panel: Main -------------------------------------------------------------------------------------

(define (panel-main . elems)
  `(div ((class "panel-basic"))
      (div ((class "panel-basic-column")) ,@elems)))

(define (panel-main-narrow . elems)
  `(div ((class "panel"))
      (div ((class "panel-main-left-narrow")) )
      (div ((class "center-column"))
        (div ((class "main")) ,@elems))
      (div ((class "panel-main-right-narrow")) )))

;--------------------------------------------------------------------------------------------------
; Content Cards
;--------------------------------------------------------------------------------------------------

(define (content-card-basic . elems)
  `(div ((class "content-card-basic")) ,@elems))

(define (card-header . elems)
  `(card-header ,@elems))

;--------------------------------------------------------------------------------------------------
; Markup Commands
;--------------------------------------------------------------------------------------------------

(define (link tgt . elements)
  `(a ((href ,tgt)) ,@elements))
  ;◊;`(a ((href tgt)) ,@elements))

(define (sc . elements)
  `(span ((style "font-feature-settings: 'smcp';")) ,@elements))

(define (it . elements)
  `(em ,@elements))

(define (bf . elements)
  `(strong ,@elements))

(define (large . elements)
  `(span ((style "font-size:120%")) ,@elements))

(define (Large . elements)
  `(span ((style "font-size:150%")) ,@elements))

;◊; padding top right bottom left

(define (padded . elements)
  `(div ((style "margin: 4em 0 4em 0;")) ,@elements))

(define (center . elements)
  `(div ((style "text-align:center")) ,@elements))

(define dinkus (center (Large "***")))

(define separator-large
  '(div ((class "separator-large"))
    (img ((src "ornaments/plant/separator_large.svg") ))))

(define separator-mid
  '(div ((class "separator-mid"))
    (img ((src "ornaments/plant/separator_mid.svg") ))))

(define (heading text) `(h1 ((style "font-size:300%")) ,text))

(define (subheading text) `(h2 ((style "font-size:200%")) ,text))
  
(define (image-inline src)
  `(div ((style "padding: 0 0 2em 0;text-align:center;margin:auto"))
    (img ((src ,src) (style "border:1px;width:90%;max-width:35em;margin:auto")))))

(define (image-inline-width width src)
  `(div ((style "padding: 0 0 2em 0;text-align:center;margin:auto"))
    (img ((src ,src) (style "border:1px;width:90%;max-width:10em;margin:auto")))
))

(define (image-fullwidth src alt)
  `(div ((class "image-fullwidth"))
    (img ((class "image-fullwidth") (src ,src) (alt ,alt)))))

(define (image-title src title maxwidth)
  `(div ((class "image-title") )
    (img ((class "image-title")
          (style ,(string-append (format "max-width:~a" maxwidth) "em;")) 
          (src ,src) (alt ,title)))))

(define (drop-cap str . elements)
  `(p ((class "drop-cap")) ,(sc str) ,@elements))

(define (poem . elements)
  `(div ((style "text-align:center;font-style:italic")) ,@elements) )

(define (root . elements)
  (txexpr 'root empty (decode-elements elements
    #:txexpr-elements-proc decode-paragraphs
    #:string-proc (compose1 smart-quotes smart-dashes))))

;◊; Images -----------------------------------------------------

(define (art thumbnail_src title . elements)
  `(div ((class "art"))
    (div ((class "art-left"))
      (img ((class "art-image-thumb") (src ,thumbnail_src) (alt ,title))))
    (div ((class "art-right")) ,@elements)))

(define (caption . elements)
  `(p ((class "caption")) ,@elements))

(define (art_large src title . elements)
  `(div ((class "art-large"))
    (div ((class "art-large-left"))
      (img ((class "art-image-large") (src ,src) (alt ,title))))
    (div ((class "art-large-right")) ,@elements)))

;◊; Publications -----------------------------------------------
(define (arxiv_link id)
  `(a ((class "arxiv-link") (href ,(string-append "https://arxiv.org/abs/" id))) "arXiv"))

(define (publication title authors arxiv_id conference . elements)
  `(div ((class "publication"))
    (div ((class "publication-left"))
      (div ((class "publication-title")) ,title )
      (div ((class "publication-authors")) ,authors )
      (div ((class "publication-arxiv-link")) ,(arxiv_link arxiv_id) ))
    (div ((class "publication-right"))
      (div ((class "publication-conference-venue")) ,conference ))
    (div ((class "publication-extra")) ,@elements)))
