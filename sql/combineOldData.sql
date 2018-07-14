INSERT INTO house.community
	SELECT * FROM house.`community-2` WHERE house.`community-2`.id 
    not in 
    (select  house.community.id from house.community) ;
    
INSERT INTO house.houseinfo
	SELECT * FROM house.`houseinfo-2` WHERE house.`houseinfo-2`.houseID 
    not in 
    (select  house.houseinfo.houseID from house.houseinfo) ;
    
INSERT INTO house.hisprice
	SELECT * FROM house.`hisprice-2` WHERE house.`hisprice-2`.houseID 
    not in 
    (select  house.hisprice.houseID from house.hisprice) ;
    
INSERT INTO house.rentinfo
	SELECT * FROM house.`rentinfo-2` WHERE house.`rentinfo-2`.houseID 
    not in 
    (select  house.rentinfo.houseID from house.rentinfo) ;
    
INSERT INTO house.sellinfo
	SELECT * FROM house.`sellinfo-2` WHERE house.`sellinfo-2`.houseID 
    not in 
    (select  house.sellinfo.houseID from house.sellinfo) ;

#=============clean leatest 30 sellinfo==================================================================
delete
FROM
    house.monthSellinfo
where
    house.monthSellinfo.houseID in (select 
            house.sellinfo.houseID
        from
            house.sellinfo);


#=============update houseinfo ==================================================================

update house.houseinfo set house.houseinfo.isSold = 'yes'
where house.houseinfo.houseID in (select house.monthSellinfo.houseID from house.monthSellinfo);

update house.houseinfo set house.houseinfo.isSold = 'yes'
where house.houseinfo.houseID in (select house.sellinfo.houseID from house.sellinfo);sellinfo