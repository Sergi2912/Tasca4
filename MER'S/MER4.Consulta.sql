Use MER4; 
SELECT Client.Nom, Client.Cognom, Venedor.Nom, Venedor.Cognom, Polissa.NUM_polissa, Tipus_Polissa.Nom
FROM client, Venedor, Polissa, Tipus_Polissa
WHERE client.DNI = Polissa.Client_DNI and Venedor.DNI=Polissa.Venedors_DNI and Tipus_Polissa.ID = Polissa.Tipus_Polissa_ID;