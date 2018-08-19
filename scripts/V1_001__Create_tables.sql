-- auto-generated definition
create table $schema.cart
(
  cart_id integer not null
    constraint cart_pkey
    primary key,
  total   double precision
);

alter table $schema.cart
  owner to sample;

