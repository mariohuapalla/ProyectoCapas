use sistemaventas
go

-- procedimientos almacanedos
-- Tabla Accion
-- Registrar
if exists(select * from sys.procedures where name='SP_RegistrarAccion')
drop procedure SP_RegistrarAccion
go
create procedure SP_RegistrarAccion
@nom varchar(20),
@est bit
as begin
begin tran SP_RegistrarAccion
begin try
insert into T_Accion values(@nom,@est)
commit tran SP_RegistrarAccion
end try
begin catch
rollback tran SP_RegistrarAccion
end catch
end
go
-- Actualizar
if exists(select * from sys.procedures where name='SP_ActualizarAccion')
drop procedure SP_ActualizarAccion
go
create procedure SP_ActualizarAccion
@cod int,
@nom varchar(20),
@est bit
as begin
begin tran SP_ActualizarAccion
begin try
update t_Accion set nomacc=@nom, estacc=@est where codacc=@cod
commit tran SP_ActualizarAccion
end try
begin catch
rollback tran SP_ActualizarAccion
end catch
end
-- Eliminar
if exists(select * from sys.procedures where name='SP_EliminarAccion')
drop procedure SP_EliminarAccion
go
create procedure SP_EliminarAccion
@cod int
as begin
begin tran SP_EliminarAccion
begin try
update t_Accion set estacc=0 where codacc=@cod
commit tran SP_EliminarAccion
end try
begin catch
rollback tran SP_EliminarAccion
end catch
end
go
-- Mostrar
if exists(select * from sys.procedures where name='SP_MostrarAccion')
drop procedure SP_MostrarAccion
go
create procedure SP_MostrarAccion
as
select * from T_Accion where estacc=1
go
-- Mostrar todo
if exists(select * from sys.procedures where name='SP_MostrarAccionTodo')
drop procedure SP_MostrarAccionTodo
go
create procedure SP_MostrarAccionTodo
as
select * from T_Accion
go
-- Buscar por codigo
if exists(select * from sys.procedures where name='SP_BuscarAccion')
drop procedure SP_BuscarAccion
go
create procedure SP_BuscarAccion
@cod int
as
select * from T_Accion where codacc=@cod
go