# Identificação do problema

O problema foi proposto durante um laboratório de Azure. Os dados foram extraídos de uma API pública. 
A fonte mais atualizada para conhecer os museus brasileiros é a plataforma Museusbr. Criado pela Portaria nº 6, de 9 de janeiro de 2017, Museusbr é o sistema nacional de identificação de museus e plataforma para mapeamento colaborativo, gestão e compartilhamento de informações sobre os museus brasileiros.
O site pode ser acessado [clicando aqui](http://museus.cultura.gov.br/).

O problema a ser resolvido é derivado da necessidade de obter um relatório com todas as instituições culturais do Brasil separadas por estados e região e os principais eventos em uma linha do tempo.

# Solução
Os dados serão extraídos da API, subidos dentro de um servidor privado do serviço de dados não estruturados do Azure (Blob). 

## Extração da API

Após a extração utilizando a API dos museus, os dados foram salvos em formato JSON. Os arquivos foram modelados e ingeridos dentro do Blob.

## Databricks

Após a ingestão do Blob, os dados foram transmitidos para o Databricks, agregados e colocados dentro de uma tabela stage do SQL.

## SQL

Os dados da tabela stage foram convertidos, modelados e alimentaram tabelas de dimensão e uma tabela fato.

* Dimensão com os eventos 
* Dimensão com os Museus
* Tabela Fato

# Azure

A orquestração foi realizada dentro do Data Factory, serviço de automação e orquestração do Azure. 

## Descrição do processo de orquestração.

![image](https://user-images.githubusercontent.com/85235525/172206215-85310953-34d1-4ce6-9ecf-52bac8ea2aec.png)

O primeiro passo foi garantir acesso ao blob diretamente do Databricks. Os processos de acessos consistem em uma etapa condicional. Caso o acesso já exista, ele gerará falha. No caso da falha, o acesso será revogado e concedido. Após essa tarefa, os dados serão extraídos do Blob e tratados na etapa de processamento. Quando o processamento for concluído, será invocada um procedure do SQL Server que alimentará todas as tabelas do nosso Data Warehouse. Como última etapa, será realizado uma revogação do acesso para uma futura e mais ágil acesso.

# Tecnologias utilizadas

* Jupyter
* Python
* Azure
  * Data Factory
  * SQL Server 
  * Blob Storage
* Databricks
  * Pyspark
  * Regex
  * Adal
* PowerBI


# Autor

<a href="https://www.linkedin.com/in/mikeias-d-s-o/"><img src="https://github.com/xpcosmos/simulador-de-dados/blob/main/assets/linkedin.png" alt="linkedin" width="20"></a> <a href="mailto:mikeias.d.s.o@gmail.com"><img src="https://github.com/xpcosmos/simulador-de-dados/blob/main/assets/gmail.png" alt="gmail" width="20">

# Licença
  
MIT License

Copyright (c) 2022 xpcosmos

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
