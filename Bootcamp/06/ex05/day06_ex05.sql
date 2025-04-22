COMMENT ON TABLE person_discounts IS 'Info about discounts of clients';
COMMENT ON COLUMN person_discounts.id IS 'PRIMARY KEY of lines';
COMMENT ON COLUMN person_discounts.person_id IS 'identification of persons';
COMMENT ON COLUMN person_discounts.pizzeria_id IS 'identification of pizzerias';
COMMENT ON COLUMN person_discounts.discount IS 'The size of the client`s discount in the pizzeria';

-- \d+ airports;
-- SELECT description
-- FROM pg_catalog.pg_description
-- ;