% Autor: Carlos Juárez
% Fecha: 25/03/2025
% Descripción respuesta de diferentes sistemas con el fin de ver polos
% dominantes.

T = zpk([-1.99],[-2,-12],10)
step(T)