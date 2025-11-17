-- LojaZelda.hs

-- Cada item tem nome, categoria ("Arma", "Poção", "Equipamento") e preço
data Item = Item
  { nomeItem   :: String
  , categoria  :: String
  , precoItem  :: Double
  } deriving (Show, Eq)

-- CompraZelda guarda apenas a lista de itens da compra
data CompraZelda = CompraZelda
  { itens :: [Item]
  } deriving (Show, Eq)

-- Função auxiliar: soma o preço dos itens
totalItens :: [Item] -> Double
totalItens xs = sum (map precoItem xs)

-- 1) calculaDesconto :: [Item] -> Double
--    10% de desconto se o total dos itens > 200, caso contrário 0
calculaDesconto :: [Item] -> Double
calculaDesconto xs
  | total > 200 = total * 0.10
  | otherwise   = 0
  where
    total = totalItens xs

-- 2) valorFinal :: CompraZelda -> Double
--    Usa guards:
--    - se total > 200: aplica desconto (10%)
--    - se total <= 200: não tem desconto e adiciona frete fixo de 15.0
valorFinal :: CompraZelda -> Double
valorFinal (CompraZelda xs)
  | total > 200 = total - desconto
  | otherwise   = total + frete
  where
    total    = totalItens xs
    desconto = calculaDesconto xs
    frete    = 15.0

------------------------------------------------------------
-- Exemplos de itens
------------------------------------------------------------

espada :: Item
espada = Item "Espada Mestre" "Arma" 150.0

escudo :: Item
escudo = Item "Escudo Hyliano" "Equipamento" 90.0

pocaoVida :: Item
pocaoVida = Item "Poção de Vida" "Poção" 25.0

pocaoMagia :: Item
pocaoMagia = Item "Poção de Magia" "Poção" 30.0

------------------------------------------------------------
-- Exemplos de compras
------------------------------------------------------------

-- Total = 150 + 90 = 240 (> 200) → aplica 10% de desconto, sem frete
compraGrande :: CompraZelda
compraGrande = CompraZelda [espada, escudo]

-- Total = 25 + 30 = 55 (<= 200) → sem desconto, adiciona frete de 15
compraPequena :: CompraZelda
compraPequena = CompraZelda [pocaoVida, pocaoMagia]

------------------------------------------------------------
-- main: mostrar itens e valor final de cada compra
------------------------------------------------------------

main :: IO ()
main = do
  putStrLn "=== Compra Grande ==="
  print (itens compraGrande)
  putStrLn $ "Valor final: " ++ show (valorFinal compraGrande)

  putStrLn "\n=== Compra Pequena ==="
  print (itens compraPequena)
  putStrLn $ "Valor final: " ++ show (valorFinal compraPequena)
