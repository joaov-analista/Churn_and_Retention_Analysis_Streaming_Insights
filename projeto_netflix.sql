create database projeto_netflix;
use projeto_netflix;
select * from netflix_user_behavior_dataset;
desc netflix_user_behavior_dataset;

-- criar um backup da tabela
create table backup_netflix_user_behavior_dataset as select * from netflix_user_behavior_dataset;
truncate backup_netflix_user_behavior_dataset;
insert into backup_netflix_user_behavior_dataset select * from netflix_user_behavior_dataset;

set sql_safe_updates = 0;
-- alterar a coluna de user_id para primary key 
update netflix_user_behavior_dataset 
set user_id = cast(substring(user_id, 3) as unsigned);
alter table netflix_user_behavior_dataset modify column user_id int not null;
alter table netflix_user_behavior_dataset add primary key(user_id);

-- analises para verificar se há valores inconsistentes
select
    min(age) as idade_minima,
    max(age) as idade_maxima,
    min(monthly_fee) as preco_minimo,
    max(monthly_fee) as preco_maximo,
    min(account_age_months) as idade_conta_meses,
    max(avg_watch_time_minutes) as tempo_maximo_dia,
    min(avg_watch_time_minutes) as tempo_minimo_dia,
    max(watch_sessions_per_week) as max_sessoes_semana,
    min(watch_sessions_per_week) as min_sessoes_semana,
    max(completion_rate) as max_taxa_conclusao,
    min(completion_rate) as min_taxa_conclusao,
    max(rating_given) as max_classificacao_dada,
    min(rating_given) as min_classificacao_dada,
    max(recommendation_click_rate) as max_recomendacao,
    min(recommendation_click_rate) as min_recomendacao,
    max(days_since_last_login) as max_dias_ultimo_login,
    min(days_since_last_login) as min_dias_ultimo_login,
    count(*) as total_registros
from netflix_user_behavior_dataset;
select distinct country from netflix_user_behavior_dataset group by country;
select distinct subscription_type from netflix_user_behavior_dataset group by subscription_type;
select distinct payment_method from netflix_user_behavior_dataset group by payment_method;
select distinct primary_device from netflix_user_behavior_dataset group by primary_device;
select distinct gender from netflix_user_behavior_dataset group by gender;
select distinct favorite_genre from netflix_user_behavior_dataset group by favorite_genre;

-- verificando se há valores nulos
select 
    count(*) - count(user_id),
    count(*) - count(age),
    count(*) - count(gender),
    count(*) - count(country),
    count(*) - count(account_age_months),
    count(*) - count(subscription_type),
    count(*) - count(monthly_fee),
    count(*) - count(payment_method),
    count(*) - count(primary_device),
    count(*) - count(devices_used),
    count(*) - count(favorite_genre),
    count(*) - count(avg_watch_time_minutes),
    count(*) - count(watch_sessions_per_week),
    count(*) - count(binge_watch_sessions),
    count(*) - count(completion_rate),
    count(*) - count(rating_given),
    count(*) - count(content_interactions),
    count(*) - count(recommendation_click_rate),
    count(*) - count(days_since_last_login),
    count(*) - count(churned)
FROM netflix_user_behavior_dataset;

-- view para tratamento inicial dos dados
create view analise_netflix as
select 
	user_id, 
    age as idade, 
    trim(upper(gender)) as genero, 
	trim(upper(country)) as pais,
    account_age_months as idade_conta_meses,
    trim(upper(subscription_type)) as plano,
    monthly_fee as taxa_mensal,
    trim(upper(payment_method)) as metodo_pagamento,
    trim(upper(primary_device)) as dispositivo,
    trim(upper(favorite_genre)) as genero_favorito,
    avg_watch_time_minutes as media_minutos_dia,
    watch_sessions_per_week as sessoses_assistidas_semana,
    completion_rate as taxa_conclusao_sessoes,
    rating_given as media_classificacao,
    recommendation_click_rate as taxa_recomendacoes,
    days_since_last_login as dias_ultimo_login,
    case 
		when trim(upper(churned)) = 'YES' then 1 -- se foi cancelado recebe 1
        else 0
        end as cancelamento,
	case 
		when age < 25 then 'JOVEM'
        when age < 50 then 'ADULTO'
        else 'SENIOR'
	end as faixa_etaria,
    (account_age_months * monthly_fee) as faturamento_total
from netflix_user_behavior_dataset;

select * from analise_netflix;