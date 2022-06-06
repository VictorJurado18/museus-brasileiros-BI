drop table  DW_mikeias_IPAV.FATO_IPAV;
create table  DW_mikeias_IPAV.FATO_IPAV(
[id_event] int,
[id_space] int,
[duration] float,
[endsAt] time,
[frequency] varchar(20),
[startsAt] time,
[startsOn] datetime,
[until] datetime
);

drop table DW_mikeias_IPAV.DIM_SPACE;
create table DW_mikeias_IPAV.DIM_SPACE(
[id_space] int primary key,
[latitude] float,
[longitude] float,
[name_space] varchar(200) null
);

drop table DW_mikeias_IPAV.DIM_EVENT;
create table DW_mikeias_IPAV.DIM_EVENT(
[id_event] int,
[name_event] varchar(500) null,
[shortDescription] text null,
[classificacaoEtaria] varchar(20),
[price] varchar(500) null,
);





