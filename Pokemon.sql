CREATE TABLE Pokemon
(
    Id INT IDENTITY PRIMARY KEY,
    Name VARCHAR(250),
    Height VARCHAR(100),
    Weight VARCHAR(100)

)
CREATE TABLE Type(

    Id INT IDENTITY PRIMARY KEY,
    Name VARCHAR(250) UNIQUE,
)

CREATE TABLE PokemonType
(
    ID INT IDENTITY PRIMARY KEY,
    PokemonID INT,
    TypeID INT,
)

ALTER TABLE PokemonType ADD FOREIGN KEY (PokemonID) REFERENCES Pokemon(Id);
ALTER TABLE PokemonType ADD FOREIGN KEY (TypeID) REFERENCES Type(Id);


INSERT INTO Pokemon (Name, Height, Weight) VALUES ('Bulbasaur', '7', '70');
INSERT INTO Pokemon (Name, Height, Weight) VALUES ('Ditto', '3', '40');

INSERT INTO Type (Name) VALUES ('Normal');
INSERT INTO Type (Name) VALUES ('Grass');

INSERT INTO PokemonType (PokemonID, TypeID) VALUES (1,2);
INSERT INTO PokemonType (PokemonID, TypeID) VALUES (2,1);

--INSERT INTO PokemonType (PokemonID, TypeID) Values (OBJECT_ID("Pokemon.Name"), OBJECT_ID()))

SELECT PokemonType.PokemonId, Pokemon.Name, Type.Id, Type.Name, PokemonType.ID
FROM Pokemon JOIN PokemonType
ON Pokemon.Id = PokemonType.PokemonId
JOIN "Type" ON "Type".Id = PokemonType.TypeId;

