CREATE DATABASE IF NOT EXISTS synapsedb;

USE synapsedb;
--
-- Dumping data for table 'drugs'
--
-- Table: drugs
CREATE TABLE drugs (
  id int primary key,
  name varchar(50),
  description text
);

-- Table: categories
CREATE TABLE categories (
  id int primary key,
  name varchar(50)
);

-- Table: drug_categories
CREATE TABLE drug_categories (
  drug_id int,
  category_id int,

  PRIMARY KEY(drug_id, category_id),

  FOREIGN KEY(drug_id) REFERENCES drugs(id),
  FOREIGN KEY(category_id) REFERENCES categories(id)
);

INSERT INTO drugs (id, name, description) VALUES
(1, 'Morphine', 'Narcotic pain medication extracted from opium'),
(2, 'Oxycodone', 'Semisynthetic opioid pain medication'),
(3, 'Hydrocodone', 'Semi-synthetic opioid pain medication'),
(4, 'Loratadine', 'Non-drowsy antihistamine'),
(5, 'Ibuprofen', 'Non-steroidal anti-inflammatory drug (NSAID)'),
(6, 'Acetaminophen', 'Over-the-counter analgesic and antipyretic'),
(7, 'Caffeine', 'Mild stimulant found in coffee, tea, soft drinks'),
(8, 'Methamphetamine', 'Powerful, highly addictive stimulant'),
(9, 'Marijuana', 'Psychoactive compound extracted from cannabis plants'),
(10, 'Heroin', 'Powerful opioid synthesized from morphine');

--
-- Dumping data for table 'categories'
--

INSERT INTO categories (id, name) VALUES
(1, 'Narcotic Analgesic'),
(2, 'Opioid Analgesic'),
(3, 'Non-Narcotic Analgesic'),
(4, 'Antihistamine'),
(5, 'NSAID'),
(6, 'Stimulant'),
(7, 'Hallucinogen'),
(8, 'Sedative');

--
-- Dumping data for table 'drug_categories'
--

INSERT INTO drug_categories (drug_id, category_id) VALUES
(1, 1), (1, 2),
(2, 1), (2, 2),
(3, 1), (3, 2),
(4, 4),
(5, 5),
(6, 3),
(7, 6),
(8, 6),
(9, 7),
(10, 1), (10, 2);