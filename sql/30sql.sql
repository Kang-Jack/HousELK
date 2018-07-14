UPDATE
  sellinfo 
SET
  sellinfo.dealdate = DATE_FORMAT(updatedate,'%Y-%m-%d') 
WHERE
  dealdate = "近30天内成交"