-- CasaShows.hs

-- Status do evento
data StatusEvento = Ativo | Encerrado | Cancelado
  deriving (Show, Eq)

-- Cada banda tem nome, gênero e cachê
data Banda = Banda
  { nomeBanda :: String
  , genero    :: String
  , cache     :: Double
  } deriving (Show, Eq)

-- Evento: nome, lista de bandas e status
data Evento = Evento
  { nomeEvento   :: String
  , bandasEvento :: [Banda]
  , status       :: StatusEvento
  } deriving (Show, Eq)

------------------------------------------------------------
-- Funções principais
------------------------------------------------------------

-- Soma todos os cachês, aplica taxa de produção de 20%.
-- Se o evento estiver Cancelado, retorna 0.0.
custoTotalEvento :: Evento -> Double
custoTotalEvento (Evento _ _ Cancelado) = 0.0
custoTotalEvento (Evento _ bs _) =
  let totalCaches = sum (map cache bs)
  in totalCaches * 1.20       -- 20% de taxa de produção

-- Banda de abertura: primeira da lista
bandaAbertura :: Evento -> String
bandaAbertura (Evento _ [] _)      = "Nao ha banda de abertura."
bandaAbertura (Evento _ (b:_) _)   =
  "Banda de abertura: " ++ nomeBanda b

-- Banda de encerramento: última da lista
bandaEncerramento :: Evento -> String
bandaEncerramento (Evento _ [] _)  = "Nao ha banda para encerrar a noite."
bandaEncerramento (Evento _ bs _)  =
  "Banda de encerramento: " ++ nomeBanda (last bs)

------------------------------------------------------------
-- Exemplos de bandas
------------------------------------------------------------

rockBand :: Banda
rockBand = Banda "Stone Dragons" "Rock" 8000.0

popBand :: Banda
popBand = Banda "Sky Lights" "Pop" 6000.0

jazzBand :: Banda
jazzBand = Banda "Blue Notes Trio" "Jazz" 4500.0

metalBand :: Banda
metalBand = Banda "Iron Howl" "Metal" 9000.0

------------------------------------------------------------
-- Três eventos: ativo, encerrado e cancelado
------------------------------------------------------------

eventoAtivo :: Evento
eventoAtivo =
  Evento "Noite do Rock" [rockBand, popBand] Ativo

eventoEncerrado :: Evento
eventoEncerrado =
  Evento "Festival Jazz & Metal" [jazzBand, metalBand] Encerrado

eventoCancelado :: Evento
eventoCancelado =
  Evento "Show Surpresa" [rockBand, jazzBand, popBand] Cancelado

------------------------------------------------------------
-- main: mostrar custos e bandas de abertura/encerramento
------------------------------------------------------------

main :: IO ()
main = do
  putStrLn "=== Evento Ativo ==="
  putStrLn (bandaAbertura eventoAtivo)
  putStrLn (bandaEncerramento eventoAtivo)
  putStrLn $ "Custo total: " ++ show (custoTotalEvento eventoAtivo)

  putStrLn "\n=== Evento Encerrado ==="
  putStrLn (bandaAbertura eventoEncerrado)
  putStrLn (bandaEncerramento eventoEncerrado)
  putStrLn $ "Custo total: " ++ show (custoTotalEvento eventoEncerrado)

  putStrLn "\n=== Evento Cancelado ==="
  putStrLn (bandaAbertura eventoCancelado)
  putStrLn (bandaEncerramento eventoCancelado)
  putStrLn $ "Custo total: " ++ show (custoTotalEvento eventoCancelado)
