create procedure DW_mikeias_IPAV.Insert_data

as 
----------------- DIM SPACE ------------------
truncate table DW_mikeias_IPAV.DIM_SPACE;
insert into DW_mikeias_IPAV.DIM_SPACE
select distinct 
[id_space] as [id_space],
[latitude] as [latitude],
[longitude] as [longitude],
[name_space] as [name_space]
from [STAGE_mikeias].[DL_IPAV];
----------------- DIM EVENT ------------------
truncate table DW_mikeias_IPAV.DIM_EVENT;
insert into DW_mikeias_IPAV.DIM_EVENT
select distinct 
[id_event] as [id_event],
[name_event] as [name_event],
[shortDescription] as  [shortDescription],
[classificacaoEtaria] as [classificacaoEtaria],
[price] as [price]
from [STAGE_mikeias].[DL_IPAV] where [id_event] is not null
------------------TABLE FATO -----------------
truncate table DW_mikeias_IPAV.FATO_IPAV;
insert into DW_mikeias_IPAV.FATO_IPAV
select
[id_event] as [event_ID],
[id_space] as [space_ID],
[duration] as [duration],
[endsAt] as [endsAt],
[frequency] as [frequency],
[startsAt] as [startsAt],
convert(datetime, [startsOn]) as [startsOn],
convert(datetime, [until]) as [until]
from [STAGE_mikeias].[DL_IPAV];

truncate table [STAGE_mikeias].[DL_IPAV];