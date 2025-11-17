
data Status = Aberto | Entregue | Cancelado
  deriving (Show, Eq)

-- Tipo Bebida com campos nome, tipo e preco
data Bebida = Bebida
  { nome  :: String
  , tipo  :: String
  , preco :: Double
  } deriving (Show, Eq)

-- Tipo Pedido: lista de bebidas + status
data Pedido = Pedido
  { bebidas :: [Bebida]
  , status  :: Status
  } deriving (Show, Eq)

-- Função que calcula o valor total do pedido
-- Soma os preços das bebidas e adiciona taxa fixa de 5.0
-- Se o pedido estiver Cancelado, o valor é 0
valorTotalPedido :: Pedido -> Double
valorTotalPedido (Pedido _ Cancelado) = 0
valorTotalPedido (Pedido bs _) =
  let somaBebidas = sum (map preco bs)
  in somaBebidas + 5.0    -- taxa de serviço fixa

-- Função que devolve o nome da primeira bebida do pedido
-- ou uma mensagem se a lista estiver vazia
primeiraBebida :: Pedido -> String
primeiraBebida (Pedido [] _)      = "Nenhuma bebida no pedido."
primeiraBebida (Pedido (b:_)  _)  = nome b


-- Exemplos de dados para testar no GHCi
cafe :: Bebida
cafe = Bebida "Café Leblanc" "Café" 8.0

cha :: Bebida
cha = Bebida "Chá Verde" "Chá" 6.0

suco :: Bebida
suco = Bebida "Suco de Laranja" "Suco" 7.5

pedidoAberto :: Pedido
pedidoAberto = Pedido [cafe, cha, suco] Aberto

pedidoCancelado :: Pedido
pedidoCancelado = Pedido [cafe, cha] Cancelado
