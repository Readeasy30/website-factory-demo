-- Website Factory Production Schema

create table customers (
  id uuid primary key default gen_random_uuid(),
  business text not null,
  city text,
  created_at timestamp default now()
);

create table orders (
  id uuid primary key default gen_random_uuid(),
  customer_id uuid references customers(id),
  status text default 'NEW',
  created_at timestamp default now()
);

create table websites (
  id uuid primary key default gen_random_uuid(),
  customer_id uuid references customers(id),
  url text,
  status text default 'BUILDING'
);

create table deployments (
  id uuid primary key default gen_random_uuid(),
  website_id uuid references websites(id),
  platform text default 'cloudflare',
  status text default 'PENDING',
  created_at timestamp default now()
);
