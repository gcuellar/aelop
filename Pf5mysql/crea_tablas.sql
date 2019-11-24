CREATE TABLE autor (
  id_autor INT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(50) NOT NULL,
  PRIMARY KEY (id_autor)
) ENGINE = InnoDB;

CREATE TABLE persona (
  id_persona INT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(50) NOT NULL,
  PRIMARY KEY (id_persona)
) ENGINE = InnoDB;

CREATE TABLE disco (
  id_disco INT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(50) NOT NULL,
  id_autor INT NOT NULL,
  anyo INT,
  PRIMARY KEY (id_disco),
  CONSTRAINT autor_disco_FK FOREIGN KEY (id_autor)
    REFERENCES autor (id_autor)
    ON DELETE CASCADE
    ON UPDATE CASCADE
) ENGINE = InnoDB;

CREATE TABLE cancion (
  id_cancion INT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(50) NOT NULL,
  id_disco INT NOT NULL,
  numero INT NOT NULL,
  PRIMARY KEY (id_cancion),
  CONSTRAINT disco_cancion_FK FOREIGN KEY (id_disco)
    REFERENCES disco (id_disco)
    ON DELETE CASCADE
    ON UPDATE CASCADE
) ENGINE = InnoDB;

CREATE TABLE produccion (
  id_produccion INT NOT NULL AUTO_INCREMENT,
  id_persona INT NOT NULL,
  id_disco INT NOT NULL,
  PRIMARY KEY (id_produccion),
  CONSTRAINT persona_produccion_FK FOREIGN KEY (id_persona)
    REFERENCES persona (id_persona)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT disco_produccion_FK FOREIGN KEY (id_disco)
    REFERENCES disco (id_disco)
    ON DELETE CASCADE
    ON UPDATE CASCADE
) ENGINE = InnoDB;

CREATE TABLE colaboracion (
  id_colaboracion INT NOT NULL AUTO_INCREMENT,
  id_persona INT NOT NULL,
  id_disco INT NOT NULL,
  id_cancion INT,
  rol VARCHAR(50),
  PRIMARY KEY (id_colaboracion),
  CONSTRAINT persona_colaboracion_FK FOREIGN KEY (id_persona)
    REFERENCES persona (id_persona)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT disco_colaboracion_FK FOREIGN KEY (id_disco)
    REFERENCES disco (id_disco)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT cancion_colaboracion_FK FOREIGN KEY (id_cancion)
    REFERENCES cancion (id_cancion)
    ON DELETE CASCADE
    ON UPDATE CASCADE
) ENGINE = InnoDB;
