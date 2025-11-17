;; Exercício 1 – Farmácia da Maomao
;; Common Lisp

(defun calcula-dosagem (peso-kg idade-anos)
  "Retorna a dosagem base em ml, de acordo com as regras do enunciado."
  (cond
    ;; Se a idade for menor que 5 OU o peso for menor que 20 kg → 10 ml
    ((or (< idade-anos 5)
         (< peso-kg 20))
     10)

    ;; Se a idade estiver entre 5 e 12 (inclusive) E o peso ≥ 20 kg → 25 ml
    ((and (>= idade-anos 5)
          (<= idade-anos 12)
          (>= peso-kg 20))
     25)

    ;; Caso contrário → 50 ml
    (t 50)))


(defun ajusta-preco (preco-base nome-da-erva)
  "Aplica o fator de preço de acordo com o nome da erva."
  (cond
    ;; Ginseng → preço * 3.0
    ((string= nome-da-erva "Ginseng")
     (* preco-base 3.0))

    ;; Lótus (aceita 'Lótus' ou 'Lotus') → preço * 1.5
    ((or (string= nome-da-erva "Lótus")
         (string= nome-da-erva "Lotus"))
     (* preco-base 1.5))

    ;; Qualquer outra erva → preço-base
    (t preco-base)))


(defun main ()
  ;; Dados do paciente do item 3:
  ;; 14 anos, 60 kg, erva Lótus, preço base 10 moedas.
  (let* ((idade 14)
         (peso 60)
         (erva "Lótus")
         (preco-base 10)
         (dosagem (calcula-dosagem peso idade))
         (preco-final (ajusta-preco preco-base erva)))
    (format t "Paciente: ~a anos, ~a kg~%" idade peso)
    (format t "Erva: ~a~%" erva)
    (format t "Dosagem calculada: ~a ml~%" dosagem)
    (format t "Preço base: ~,2f moedas~%" preco-base)
    (format t "Preço final de uma dose: ~,2f moedas~%" preco-final)))

;; Chamada principal ao rodar o arquivo
(main)
