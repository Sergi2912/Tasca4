Use MER4;
SELECT client.Nom as "Nom client", client.cognom as "Cognom del client" , Polissa.NUM_polissa as "Numero de la pòlissa"
FROM client, Polissa
where client.Dni = Polissa.Client_DNI and client.Nom="Pere" and client.cognom="Pons";
