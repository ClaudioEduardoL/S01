
(defstruct criatura
  nome
  ambiente
  periculosidade
  vida-media)

(defparameter *catalogo-fauna*
  (list
  
   (make-criatura
    :nome "Peixe Safe Shallows"
    :ambiente "Safe Shallows"
    :periculosidade "Baixa"
    :vida-media 5)


   (make-criatura
    :nome "Reaper Leviathan"
    :ambiente "Open Ocean"
    :periculosidade "Alta"
    :vida-media 50)


   (make-criatura
    :nome "Ghost Leviathan Juvenile"
    :ambiente "Deep"
    :periculosidade "Alta"
    :vida-media 80)

   (make-criatura
    :nome "Crab Squid"
    :ambiente "Deep"
    :periculosidade "Media"
    :vida-media 30)))

(defun filtra-por-perigo (catalogo)
  "Retorna apenas criaturas cuja periculosidade NÃO seja Baixa."
  (remove-if-not
   (lambda (c)
     (not (string= (criatura-periculosidade c) "Baixa")))
   catalogo))

(defun relatorio-profundidade (catalogo)
  "Retorna lista de strings \"[NOME]: Vive em [AMBIENTE]\" para criaturas Deep."
  (let ((apenas-deep
          (remove-if-not
           (lambda (c)
             (string= (criatura-ambiente c) "Deep"))
           catalogo)))
    (mapcar
     (lambda (c)
       (format nil "~a: Vive em ~a"
               (criatura-nome c)
               (criatura-ambiente c)))
     apenas-deep)))
(defun main-exercicio-2 ()
  (format t "=== Catálogo completo ===~%")
  (dolist (c *catalogo-fauna*)
    (format t "~a (~a) - Periculosidade: ~a, Vida média: ~a anos~%"
            (criatura-nome c)
            (criatura-ambiente c)
            (criatura-periculosidade c)
            (criatura-vida-media c)))

  (format t "~%=== Criaturas perigosas (periculosidade != Baixa) ===~%")
  (dolist (c (filtra-por-perigo *catalogo-fauna*))
    (format t "- ~a (Periculosidade: ~a)~%"
            (criatura-nome c)
            (criatura-periculosidade c)))

  (format t "~%=== Relatório de criaturas do ambiente Deep ===~%")
  (dolist (linha (relatorio-profundidade *catalogo-fauna*))
    (format t "~a~%" linha)))

(main-exercicio-2)
