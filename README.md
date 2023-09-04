"# dio_cienciadados02" 

Etapa 1: Esquema Conceitual
Primeiro, precisamos criar um esquema conceitual para entender os principais elementos da oficina mecânica. Alguns conceitos-chave incluem:

Clientes: Representa informações sobre os clientes da oficina, como nome, endereço e número de telefone.

Veículos: Contém informações sobre os veículos atendidos na oficina, como marca, modelo, ano e placa.

Ordens de Serviço: Registra detalhes sobre o trabalho realizado em cada veículo, incluindo a data de entrada, a descrição do serviço e o valor.

Peças e Materiais: Mantém um registro de peças e materiais utilizados nos serviços, incluindo nome, número de série e preço.

Fornecedores: Peças e Materiais são fornecidos por empresas específicas.

Estoque: É preciso garantir que as peças de reposição estarão disponíveis quando demandadas.

Mecânicos: Armazena informações sobre os mecânicos que realizam os serviços, como nome, especialidade e número de identificação.

Etapa 2: Esquema Lógico
Com base no esquema conceitual, podemos criar um esquema lógico que define as tabelas e os relacionamentos entre elas, que pode ser exemplificado como:

Tabelas:

Clientes
- cliente_id (Chave Primária)
- nome
- endereco
- telefone

Veículos
- veiculo_id (Chave Primária)
- marca
- modelo
- ano
- placa
- cliente_id (Chave Estrangeira para Clientes)

Ordens_de_Servico
- ordem_id (Chave Primária)
- data_entrada
- descricao_servico
- valor
- materiais_id (Chave Estrangeira para Materiais)
- veiculo_id (Chave Estrangeira para Veículos)
- cliente_id (Chave Estrangeira para Clientes)
- mecanico_id (Chave Estrangeira para Mecânicos)

Peças_e_Materiais
- peca_id (Chave Primária)
- nome
- numero_serie
- preco

Mecânicos
- mecanico_id (Chave Primária)
- nome
- especialidade
- CPF

Fornecedores
- fornecedor_id (Chave Primária)
- nome_empresa
- CNPJ
- endereço
- contato
- informacoes_pagamento

Estoque
- estoque_id (Chave Primária)
- peca_id (Chave Estrangeira para Peças_e_Materiais)
- quantidade_disponivel
- data_aquisicao DATE
- custo DECIMAL(10, 2)

Etapa 3: Implementação do Banco de Dados MySQL
Agora podemos criar o banco de dados MySQL com base no esquema lógico, por exemplo como no arquivo disponibilizado.

Etapa 4: Quais perguntas as queries SQL poderiam responder?

1. **Quantos clientes estão registrados no sistema?**

2. **Quais são os detalhes completos de um veículo específico, incluindo informações sobre o cliente proprietário?**

3. **Quais são os veículos fabricados após um determinado ano?**

4. **Quais são as ordens de serviço com um custo final superior a um valor específico?**

5. **Qual é o custo médio de reparo por ordem de serviço?**

6. **Quais são as marcas de veículos com mais de X veículos registrados?**

7. **Quais são os fornecedores com mais de X em materiais no estoque?**

8. **Quais são as ordens de serviço atribuídas a um reparador específico?**

9. **Quais são os detalhes completos de um cliente com base no seu CPF?**

10. **Quais são as ordens de serviço com determinado material incluído?**

11. **Quais são os materiais disponíveis no estoque?**

12. **Quais são as informações de contato de um fornecedor específico?**

13. **Quais são os reparadores na filial "X"?**

14. **Quais são as ordens de serviço que envolvem veículos da marca "Y"?**

15. **Quais são as ordens de serviço realizadas por um reparador específico em um determinado período de tempo?**
