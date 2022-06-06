drop table DW_mikeias_IPAV.FATO_IPAV;

create table  DW_mikeias_IPAV.FATO_IPAV(
[id_event] int,
[id_space] int,
[duration] float,
[endsAt] time,
[frequency] varchar,
[startsAt] time,
[startsOn] datetime,
[until] datetime
);