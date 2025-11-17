-- CasaBanhos.hs

-- Status de um atendimento
data StatusAtendimento = EmAndamento | Finalizado | Cancelado
  deriving (Show, Eq)

-- Cada serviço tem nome, tipo ("Banho", "Massagem", "Banquete") e preço base
data Servico = Servico
  { nomeServico :: String
  , tipoServico :: String
  , precoServico :: Double
  } deriving (Show, Eq)

-- Atendimento: apenas lista de serviços e status
data Atendimento = Atendimento
  { servicos   :: [Servico]
  , statusAt   :: StatusAtendimento
  } deriving (Show, Eq)

------------------------------------------------------------
-- 1) bonusEspiritual :: [Servico] -> Double
--    Soma preços; se houver mais de 3 serviços, aplica bônus +25%;
--    depois, se o total (já com bônus) ultrapassar 500, aplica desconto -10%.
------------------------------------------------------------

bonusEspiritual :: [Servico] -> Double
bonusEspiritual ss =
  let base        = sum (map precoServico ss)
      comBonus    = if length ss > 3
                    then base * 1.25      -- +25%
                    else base
      comDesconto = if comBonus > 500
                    then comBonus * 0.90  -- -10%
                    else comBonus
  in comDesconto

------------------------------------------------------------
-- 2) valorFinalAtendimento :: Atendimento -> Double
--    Usa guards e zera o valor se o atendimento estiver Cancelado.
------------------------------------------------------------

valorFinalAtendimento :: Atendimento -> Double
valorFinalAtendimento (Atendimento ss status)
  | status == Cancelado   = 0.0
  | otherwise             = bonusEspiritual ss

------------------------------------------------------------
-- 3) descricaoPrimeiroServico :: Atendimento -> String
--    Retorna nome e tipo do primeiro serviço, ou mensagem se não houver.
------------------------------------------------------------

descricaoPrimeiroServico :: Atendimento -> String
descricaoPrimeiroServico (Atendimento [] _) =
  "Nao ha servicos neste atendimento."
descricaoPrimeiroServico (Atendimento (s:_) _) =
  "Primeiro servico: " ++ nomeServico s
  ++ " (" ++ tipoServico s ++ ")"

------------------------------------------------------------
-- Exemplos de servicos
------------------------------------------------------------

banhoSimples :: Servico
banhoSimples = Servico "Banho Simples" "Banho" 80.0

banhoLuxo :: Servico
banhoLuxo = Servico "Banho de Luxo" "Banho" 150.0

massagemRelax :: Servico
massagemRelax = Servico "Massagem Relaxante" "Massagem" 200.0

banqueteReal :: Servico
banqueteReal = Servico "Banquete Real" "Banquete" 250.0

------------------------------------------------------------
-- Atendimentos de exemplo
------------------------------------------------------------

-- Poucos servicos, total baixo
atendimento1 :: Atendimento
atendimento1 = Atendimento
  [banhoSimples, massagemRelax] EmAndamento

-- Varios servicos (>3) e total alto (>500) para ativar bonus + desconto
atendimento2 :: Atendimento
atendimento2 = Atendimento
  [banhoLuxo, massagemRelax, banqueteReal, banhoSimples] Finalizado

-- Atendimento cancelado
atendimento3 :: Atendimento
atendimento3 = Atendimento
  [banhoLuxo, banqueteReal] Cancelado

------------------------------------------------------------
-- main: demonstra atendimentos e seus valores finais
------------------------------------------------------------

main :: IO ()
main = do
  putStrLn "=== Atendimento 1 (EmAndamento) ==="
  putStrLn (descricaoPrimeiroServico atendimento1)
  putStrLn $ "Valor final: " ++ show (valorFinalAtendimento atendimento1)

  putStrLn "\n=== Atendimento 2 (Finalizado) ==="
  putStrLn (descricaoPrimeiroServico atendimento2)
  putStrLn $ "Valor final: " ++ show (valorFinalAtendimento atendimento2)

  putStrLn "\n=== Atendimento 3 (Cancelado) ==="
  putStrLn (descricaoPrimeiroServico atendimento3)
  putStrLn $ "Valor final: " ++ show (valorFinalAtendimento atendimento3)
