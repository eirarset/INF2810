;; Oblig 1a INF2810
;; Brukernavn: eeaarset

;; Oppgave 1
;; ---------

;; A)
;; Uttrykk a evaluerer til 30. Fra evalueringsreglene for scheme vet vi at i en kombinasjon som denne vil vi først evaluere underuttrykkene, i uttrykket, før vi anvender operatoren.
;; I dette tilfellet vil den da først evaluere uttrykket (+ 4 2). For å evaluere det vil den se at først 4, og deretter 2 er atomære uttrykk,
;; og vil da bruke operatoren på de to, som her gir 6. Da har vi evaluert hele det underuttrykket, og vi går videre til neste som i dette tilfellet er et nytt atomært uttrykk,
;; og som derfor ikke kan evalueres mer. Da anvendes operasjonen multiplikasjon på operandene 6 og 5 som gir oss uttrykkets endelige evaluasjon 30.

;; B)
;; Uttrykk b gir oss en feilmelding, ettersom (5) ikke er et lovlig uttrykk. Dermed kan ikke uttrykket evalueres.

;; C)
;; Heller ikke uttrykk c er lovlig. Scheme bruker prefiksnotasjon, og dermed er ikke (4 + 2) et lovlig underuttrykk.

;; D)
;; Den første linjen definerer hva variabelen bar skal assosierer med, ettersom define er et “special form” uttrykk. I dette tilfellet er det underuttrykket (/ 42 2),
;; som fra evalueringsreglene blir 21. Etter denne definisjonen vil bar evalueres til 21.

;; E)
;; Dette uttrykket evalueres som alle andre. bar er definert som som 21, og da benytter vi bare operatoren subtraksjon på operandene 21 og 11. Dermed evalueres uttrykket til 10.

;; F)
;; Uttrykket evalueres til 12. Vi starter med å evaluere underuttrykket (* bar 3 4 1). Ettersom alle operandene i det er atomære uttrykk, kan vi ikke evaluere dem mer,
;; så vi anvender deres operator på dem, som gir oss 252. Videre evaluerer vi den høyre operand i hoveduttrykket, som allerede er atomært,
;; og vi kan da anvende hovedoperatoren divisjon, på 252 og 21 som gir oss 12.



;; Oppgave 2
;; ----------

;; A1)
;; Det første av de tre uttrykk evalueres til “piff!”. Dette er fordi “piff!” er det første underuttrykket med sannhetsverdien #t. Den syntaktiske feilen blir aldri evaluert,
;; og gir dermed ikke feilmelding fordi or er på special form, og evaluerer bare til den finner det første underuttrykket med sannhetsverdien #t.


;; A2)
;; Uttrykk 2 evalueres til #f, allerede etter å av evaluert første underuttrykk (= 1 2), som har sannhetsverdien #f. Da vil hele uttrykkets sannhetsverdi uansett være #f,
;; og det evalueres dermed ikke mer etter dette.

;; A3)
;; Det siste uttrykket evalueres til “poff!”. if er special form, og ettersom (positive? 42) evalueres til #t, vil bare “poff!” evalueres, og ikke den den nederste og udefinerte prosedyren.


;; B)

(define (sign x)
    (if (< x 0)
        -1
        (if (= x 0)
            0
            1)))

(define (sign x)
    (cond ((< x 0) -1)
          ((= x 0) 0)
          ((> x 0) 1)))

;; C)

(define (sign x)
    (or (and (< x 0) -1)
        (and (= x 0) 0)
        1))

;; Oppgave 3
;; ---------

;; A)

(define (add1 x)
  (+ x 1))

(define (sub1 x)
  (- x 1))

;; B)

(define (plus x y)
  (if (zero? y)
      x
      (plus (add1 x) (sub1 y))))

;; C)
;; Prosedyren definert over fører til en iterativ prosess. Når basistilfellet er nådd, er også den endelige returverdien beregnet.
 
  


;; D)
;; Hjelpeprosedyren definert under er forenklet ved at den ikke har egne argumenter for b og n, ettersom den har tilgang til hovedprosedyrens argmumenter.

(define (power-close-to b n)
  (define (power-iter e)
    (if (> (expt b e) n)
        e
        (power-iter (+ 1 e))))
  (power-iter 1))

;; E)
;; Det er ikke mulig å forenkle fib-iter defenisjonen. Dette er fordi den eneste felles variablen n, avhenger av å bli endret for hver iterasjon av fib-iter.

(define (fib n)
  (define (fib-iter a b count)
    (if (= count 0)
        b
        (fib-iter (+ a b) a (- count 1))))
  (fib-iter 1 0 n))
        
      