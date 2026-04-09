Neste projeto, explorei o comportamento de usuários de streaming para identificar padrões de Churn e oportunidades de retenção.

Busquei cobrir desde o tratamento de dados brutos com SQL até a criação de um dashboard estratégico no Power BI.

Primeiro: Engenharia e Tratamento de Dados (SQL)🛠️

Antes da visualização, apliquei técnicas de ETL para garantir a integridade dos dados:
• Limpeza de strings e normalização de IDs.
• Verificação de inconsistências nos registros da base de dados com ênfase na otimização do hardware.
• Desenvolvi uma VIEW otimizada com segmentação de Faixa Etária (Jovem, Adulto, Sênior) e cálculo de Faturamento Total histórico por usuário.
• Definição de Primary Keys e backups de segurança para o processo de carga.

Segundo: Inteligência de Negócio e Insights (Power BI)📈

Com os dados tratados, o foco foi transformar números em decisões:
• Identifiquei que a maior taxa de cancelamento ocorre no Plano Standard entre o público Jovem (até 25 anos), representando uma perda mensal de 7,76 Mil no faturamento.
• Através de um gráfico de dispersão, notei que usuários com menos de 150 minutos/dia e baixa taxa de conclusão são os que mais cancelam.
• O Churn médio acontece após 29 dias de inatividade, criando uma janela de oportunidade para campanhas de reengajamento.

Principais Conclusões💡

Engajamento vs. Retenção: A taxa de recomendação e a conclusão de sessões são os maiores preditores de fidelidade.
Otimização de Planos: O Plano Standard para jovens precisa de um "gancho" maior de conteúdo para evitar a evasão para planos básicos ou concorrentes.
Este projeto reforça minha transição para a área de dados, unindo visão administrativa e financeira com o poder das ferramentas analíticas.

Tecnologias utilizadas: MySQL, Power BI, DAX e UI/UX Design.
