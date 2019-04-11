

CREATE TABLE Service(
        id_service Int  Auto_increment  NOT NULL ,
        name       Varchar (50) NOT NULL
	,CONSTRAINT Service_PK PRIMARY KEY (id_service)
);


CREATE TABLE Role(
        id_role    Int  Auto_increment  NOT NULL ,
        name       Varchar (50) NOT NULL ,
        id_service Int NOT NULL
	,CONSTRAINT Role_PK PRIMARY KEY (id_role)

	,CONSTRAINT Role_Service_FK FOREIGN KEY (id_service) REFERENCES Service(id_service)
);


CREATE TABLE Employe(
        id_employe Int  Auto_increment  NOT NULL ,
        name       Varchar (50) NOT NULL ,
        surname    Varchar (50) NOT NULL ,
        birthday   Date ,
        salary     Int NOT NULL ,
        id_role    Int NOT NULL
	,CONSTRAINT Employe_PK PRIMARY KEY (id_employe)

	,CONSTRAINT Employe_Role_FK FOREIGN KEY (id_role) REFERENCES Role(id_role)
);


CREATE TABLE User(
        id_user    Int  Auto_increment  NOT NULL ,
        email      Varchar (50) NOT NULL ,
        username   Varchar (50) NOT NULL ,
        password   Varchar (50) NOT NULL ,
        id_employe Int NOT NULL
	,CONSTRAINT User_PK PRIMARY KEY (id_user)

	,CONSTRAINT User_Employe_FK FOREIGN KEY (id_employe) REFERENCES Employe(id_employe)
	,CONSTRAINT User_Employe_AK UNIQUE (id_employe)
);


CREATE TABLE Room(
        id_room Int  Auto_increment  NOT NULL ,
        number  Int NOT NULL ,
        floor   Varchar (50) NOT NULL ,
        price   Int NOT NULL ,
        type    Varchar (50) NOT NULL
	,CONSTRAINT Room_PK PRIMARY KEY (id_room)
);


CREATE TABLE Client(
        id_client Int  Auto_increment  NOT NULL ,
        name      Varchar (50) NOT NULL ,
        surname   Varchar (50) NOT NULL ,
        email     Varchar (50) NOT NULL ,
        number    Varchar (50) NOT NULL
	,CONSTRAINT Client_PK PRIMARY KEY (id_client)
);


CREATE TABLE Room_Reservation(
        id_room_reservation Int  Auto_increment  NOT NULL ,
        date_arrival        Date NOT NULL ,
        date_depart         Date NOT NULL ,
        payment_type        Varchar (50) NOT NULL ,
        payment_amount      Int NOT NULL ,
        id_room             Int NOT NULL ,
        id_client           Int NOT NULL
	,CONSTRAINT Room_Reservation_PK PRIMARY KEY (id_room_reservation)

	,CONSTRAINT Room_Reservation_Room_FK FOREIGN KEY (id_room) REFERENCES Room(id_room)
	,CONSTRAINT Room_Reservation_Client0_FK FOREIGN KEY (id_client) REFERENCES Client(id_client)
);


CREATE TABLE Type_Food(
        id_type_food Int  Auto_increment  NOT NULL ,
        name         Varchar (5) NOT NULL
	,CONSTRAINT Type_Food_PK PRIMARY KEY (id_type_food)
);


CREATE TABLE Food_Item(
        id_food_item Int  Auto_increment  NOT NULL ,
        name         Varchar (50) NOT NULL ,
        id_type_food Int NOT NULL
	,CONSTRAINT Food_Item_PK PRIMARY KEY (id_food_item)

	,CONSTRAINT Food_Item_Type_Food_FK FOREIGN KEY (id_type_food) REFERENCES Type_Food(id_type_food)
);


CREATE TABLE Stock(
        id_stock        Int  Auto_increment  NOT NULL ,
        date_arrival    Date NOT NULL ,
        date_expiration Date NOT NULL ,
        quantity        Int NOT NULL ,
        id_food_item    Int NOT NULL
	,CONSTRAINT Stock_PK PRIMARY KEY (id_stock)

	,CONSTRAINT Stock_Food_Item_FK FOREIGN KEY (id_food_item) REFERENCES Food_Item(id_food_item)
);


CREATE TABLE Appetizers(
        id_appetizer Int  Auto_increment  NOT NULL ,
        name         Varchar (50) NOT NULL
	,CONSTRAINT Appetizers_PK PRIMARY KEY (id_appetizer)
);




