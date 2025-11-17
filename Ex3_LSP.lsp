;; Exercício 3 – A Loja de Iwai
;; Common Lisp

;; 1. Estrutura e catálogo ---------------------------------

(defstruct item
  nome
  tipo
  preco
  forca-magica)

(defparameter *catalogo-iwai*
  (list
   ;; Armas
   (make-item :nome "Espada Amaldiçoada"
              :tipo "Arma"
              :preco 100
              :forca-magica 120)
   (make-item :nome "Adaga Sombria"
              :tipo "Arma"
              :preco 60
              :forca-magica 75)
   ;; Poção
   (make-item :nome "Poção de Cura"
              :tipo "Pocao"
              :preco 25
              :forca-magica 10)
   ;; Artefato
   (make-item :nome "Amuleto do Caos"
              :tipo "Artefato"
              :preco 200
              :forca-magica 95)))

;; 2. Funções de transformação -----------------------------

(defun adiciona-imposto (preco)
  "Aumenta o preço em 15%."
  (* preco 1.15))

(defun bonus-maldicao (forca)
  "Retorna forca * 1.5 se forca > 80; caso contrário, retorna a própria forca."
  (if (> forca 80)
      (* forca 1.5)
      forca))

;; 3. Processamento da venda -------------------------------

(defun processa-venda (catalogo)
  "Filtra apenas armas, aplica imposto no preço e bônus de maldição
   na força mágica. Retorna uma lista de strings com os resultados."
  (let* ((armas
           ;; a) Filtra: mantém apenas itens de tipo \"Arma\"
           (remove-if-not
            (lambda (it) (string= (item-tipo it) "Arma"))
            catalogo))
         (armas-com-imposto
           ;; b) Transforma (1): aplica adiciona-imposto ao preço com mapcar + lambda
           (mapcar
            (lambda (it)
              (let ((copia (copy-structure it)))
                (setf (item-preco copia)
                      (adiciona-imposto (item-preco copia)))
                copia))
            armas)))
    ;; c) Transforma (2): mapcar para retornar nome e nova força-mágica
    (mapcar
     (lambda (it)
       (format nil "~a → Preço: ~,2f | Força mágica: ~,1f"
               (item-nome it)
               (item-preco it)
               (bonus-maldicao (item-forca-magica it))))
     armas-com-imposto)))

;; 4. Função principal para testar -------------------------

(defun main-exercicio-3 ()
  (format t "=== Catálogo original ===~%")
  (dolist (it *catalogo-iwai*)
    (format t "~a (~a) - Preço: ~,2f | Força mágica: ~a~%"
            (item-nome it)
            (item-tipo it)
            (item-preco it)
            (item-forca-magica it)))

  (format t "~%=== Resultado processa-venda (somente armas) ===~%")
  (dolist (linha (processa-venda *catalogo-iwai*))
    (format t "~a~%" linha)))

;; Chamada ao executar o arquivo
(main-exercicio-3)
