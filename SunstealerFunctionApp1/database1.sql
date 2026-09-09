/* alter database [database1] 
set change_tracking = on 
(change_retention = 2 days, auto_cleanup = on);

alter table [table1] 
enable change_tracking;
*/

use master
go

if not exists (select name from sys.databases where name = N'database1')
  create database database1
go

use database1
go

-- az account get-access-token --resource https://sunstealer.vault.azure.net/
-- Portal Key Vault: Create a key: Always RSA 2048
-- SMSS DBAdmin

/* if not exists (select * from sys.column_master_keys where name = 'CMK')
    create column master key [CMK] with (
        key_store_provider_name = 'AZURE_KEY_VAULT',
        key_path = 'https://sunstealer.vault.azure.net/keys/AlwaysEncrypted/REDACTED'
    )*/


if object_id('database1..table1', 'U') is not null
    drop table database1..table1
go

create table [dbo].[table1](
	[UUID] [int] identity(1,1) not null,
	[Number1] [int] not null,
	[Text1] [nvarchar](max) not null,
	[Encrypted1] [nvarchar](max) collate Latin1_General_BIN2 encrypted with (column_encryption_key = [CEK], encryption_type = Deterministic, algorithm = 'AEAD_AES_256_CBC_HMAC_SHA_256') not null,
	[Date1] [date] NULL,
 constraint [PK_table1] primary key clustered
(
	[UUID] asc
) with (pad_index = off, statistics_norecompute = off, ignore_dup_key = off, allow_row_locks = on, allow_page_locks = on, optimize_for_sequential_key = off) on [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

delete from database1..table1;
go

declare @Encrypted1 as nvarchar(max) = N'Encrypted';
insert into database1..table1 ([Number1], [Text1], [Encrypted1], [Date1]) values (1, N'ClearText', @Encrypted1, '01/01/2025')
go

update table1 set [Number1] = 1, [Text1] = N'ClearText' where UUID = 1
go

select * from database1..table1
go

if exists (select * from sys.views join sys.schemas on sys.views.schema_id = sys.schemas.schema_id and sys.views.name = N'View1')
  drop view View1
go
create view View1 as select [UUID], [Number1], [Text1], [Encrypted1], [Date1] from database1..table1
go

select * from database1..View1
go

/* ajm: disbale delete trigger 
create trigger trg_FilterDelete
on dbo.table1
after insert, update
AS*/

/* create procedure [dbo].[sp_curses] as

set nocount on;

declare @UUID as int;
declare @Number1 as int;
declare @Text1 as varchar(max);
declare @Date1 as datetime;

create table #Temp1 (
    [UUID]     int           not null,
    [Number1]  int           not null,
    [Text1]    nvarchar(max) not null,
    [Date1]    date          null,
);

declare @message as varchar(max);

declare curses cursor for select UUID, Number1, Text1, Date1 from [table1]; 
open curses;
fetch next from curses into @UUID, @Number1, @Text1, @Date1;

while @@FETCH_STATUS = 0
begin
    select @message = '-----: ' + @Text1
    print @message
	  insert into #Temp1 (UUID, Number1, Text1, Date1) values (@UUID, @Number1, @Text1, (select Text1 from table1 where UUID = @UUID), @Date1);
    fetch next from curses into @UUID, @Number1, @Text1, @Date1;
END

select * from #Temp1;

close curses;
deallocate curses;

drop table #Temp1;*/