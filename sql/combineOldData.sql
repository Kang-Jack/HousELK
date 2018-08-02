ALTER TABLE `house`.`community` 
RENAME TO  `house`.`communityold` ;


ALTER TABLE `house`.`hisprice` 
RENAME TO  `house`.`hispriceold` ;


ALTER TABLE `house`.`houseinfo` 
RENAME TO  `house`.`houseinfoold` ;

ALTER TABLE `house`.`monthsellinfo` 
RENAME TO  `house`.`monthsellinfoold` ;


ALTER TABLE `house`.`rentinfo` 
RENAME TO  `house`.`rentinfoold` ;


ALTER TABLE `house`.`sellinfo` 
RENAME TO  `house`.`sellinfoold` ;




INSERT INTO house.community
    SELECT * FROM house.`communityold` WHERE house.`communityold`.id 
    not in 
    (select  house.community.id from house.community) ;
    
INSERT INTO house.houseinfo
    SELECT * FROM house.`houseinfoold` WHERE house.`houseinfoold`.houseID 
    not in 
    (select  house.houseinfo.houseID from house.houseinfo) ;
    
INSERT INTO house.hisprice
    SELECT * FROM house.`hispriceold` WHERE house.`hispriceold`.houseID 
    not in 
    (select  house.hisprice.houseID from house.hisprice) ;
    
INSERT INTO house.rentinfo
    SELECT * FROM house.`rentinfoold` WHERE house.`rentinfoold`.houseID 
    not in 
    (select  house.rentinfo.houseID from house.rentinfo) ;
    
INSERT INTO house.sellinfo
    SELECT * FROM house.`sellinfoold` WHERE house.`sellinfoold`.houseID 
    not in 
    (select  house.sellinfo.houseID from house.sellinfo) ;
#=============================================================================
create table house.monthSellinfo  as
select * from house.sellinfo where house.sellinfo.dealdate like '%30天%';

INSERT INTO house.monthSellinfo
	SELECT * FROM house.`monthSellinfoold` WHERE house.`monthSellinfoold`.houseID 
    not in 
    (select  house.monthSellinfo.houseID from house.monthSellinfo) ;

Delete FROM
    house.sellinfo
where
	house.sellinfo.dealdate like '%30天%';

#=============clean leatest 30 sellinfo if price info been updated==================================================================

Delete FROM
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
where house.houseinfo.houseID in (select house.sellinfo.houseID from house.sellinfo);



#=================delete old=====================================================================
DROP TABLE `house`.`communityold`;
DROP TABLE `house`.`hispriceold`;
DROP TABLE `house`.`houseinfoold`;
DROP TABLE `house`.`monthsellinfoold`;
DROP TABLE `house`.`rentinfoold`;
DROP TABLE `house`.`sellinfoold`;


#===============create ==========================
create table house.community
    SELECT * FROM house.`communityold` WHERE 1=2;

create table house.hisprice
    SELECT * FROM house.`hispriceold` WHERE 1=2;
create table house.houseinfo
    SELECT * FROM house.`houseinfoold` WHERE 1=2;
create table house.rentinfo
    SELECT * FROM house.`rentinfoold` WHERE 1=2;
create table house.sellinfo
    SELECT * FROM house.`sellinfoold` WHERE 1=2;
create table house.monthsellinfo
    SELECT * FROM house.`monthsellinfoold` WHERE 1=2;



