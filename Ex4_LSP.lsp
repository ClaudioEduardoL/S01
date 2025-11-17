
(defstruct ocorrencia
  nome
  ritual
  nivel-medo
  agentes-enviados)

;; 2. Função recursiva: soma-medo-recursiva ----------------

(defun soma-medo-recursiva (lista-ocorrencias)
  "Percorre recursivamente a lista e soma o campo NIVEL-MEDO."
  (if (endp lista-ocorrencias)
      0
      (+ (ocorrencia-nivel-medo (first lista-ocorrencias))
         (soma-medo-recursiva (rest lista-ocorrencias)))))

;; 3. Função de alto nível: analise-final ------------------

(defun analise-final (lista-ocorrencias)
  "Retorna a lista de nomes das ocorrências críticas:
   - nivel-medo acima da média
   - mais de 3 agentes-enviados."
  (let* ((total-medo (soma-medo-recursiva lista-ocorrencias))
         (quantidade (length lista-ocorrencias))
         (media      (if (> quantidade 0)
                         (/ (float total-medo) quantidade)
                         0.0)))
    (mapcar
     #'ocorrencia-nome
     (remove-if-not
      (lambda (oc)
        (and (> (ocorrencia-agentes-enviados oc) 3)
             (> (ocorrencia-nivel-medo oc) media)))
      lista-ocorrencias))))

;; 4. Lista de teste com 5 ocorrências ---------------------

(defparameter *ocorrencias-teste*
  (list
   (make-ocorrencia
    :nome "Ritual na Escola Abandonada"
    :ritual "Invocacao"
    :nivel-medo 70
    :agentes-enviados 2)

   (make-ocorrencia
    :nome "Casa Mal-Assombrada"
    :ritual "Exorcismo"
    :nivel-medo 90
    :agentes-enviados 4)

   (make-ocorrencia
    :nome "Floresta da Névoa Vermelha"
    :ritual "Selamento"
    :nivel-medo 85
    :agentes-enviados 5)

   (make-ocorrencia
    :nome "Túmulo Profanado"
    :ritual "Purificacao"
    :nivel-medo 60
    :agentes-enviados 3)

   (make-ocorrencia
    :nome "Subsolo do Hospital Antigo"
    :ritual "Contencao"
    :nivel-medo 95
    :agentes-enviados 6)))

;; 5. Função principal para visualizar os resultados -------

(defun main-exercicio-4 ()
  (format t "=== Ocorrências de teste ===~%")
  (dolist (oc *ocorrencias-teste*)
    (format t "~a | Ritual: ~a | Medo: ~a | Agentes: ~a~%"
            (ocorrencia-nome oc)
            (ocorrencia-ritual oc)
            (ocorrencia-nivel-medo oc)
            (ocorrencia-agentes-enviados oc)))

  (let* ((total-medo (soma-medo-recursiva *ocorrencias-teste*))
         (qtd        (length *ocorrencias-teste*))
         (media      (if (> qtd 0)
                         (/ (float total-medo) qtd)
                         0.0))
         (criticas   (analise-final *ocorrencias-teste*)))
    (format t "~%Média de nível de medo: ~,2f~%~%" media)
    (format t "=== Ocorrências críticas (resultado da analise-final) ===~%")
    (if criticas
        (dolist (nome criticas)
          (format t "- ~a~%" nome))
        (format t "Nenhuma ocorrência crítica encontrada.~%"))))

;; Chamada ao executar o arquivo
(main-exercicio-4)
