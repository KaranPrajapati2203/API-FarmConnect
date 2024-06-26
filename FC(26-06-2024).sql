toc.dat                                                                                             0000600 0004000 0002000 00000103112 14637013424 0014441 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        PGDMP   ,    8                |            FarmConnect    16.2    16.2 l    C           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false         D           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false         E           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false         F           1262    51311    FarmConnect    DATABASE     �   CREATE DATABASE "FarmConnect" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_India.1252';
    DROP DATABASE "FarmConnect";
                postgres    false         �            1259    51400    cart    TABLE     �   CREATE TABLE public.cart (
    cartid bigint NOT NULL,
    userid bigint NOT NULL,
    productid bigint NOT NULL,
    quantity integer NOT NULL,
    createdat timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.cart;
       public         heap    postgres    false         �            1259    51399    cart_cartid_seq    SEQUENCE     x   CREATE SEQUENCE public.cart_cartid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.cart_cartid_seq;
       public          postgres    false    228         G           0    0    cart_cartid_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.cart_cartid_seq OWNED BY public.cart.cartid;
          public          postgres    false    227         �            1259    51365    marketplaces    TABLE     �  CREATE TABLE public.marketplaces (
    marketid bigint NOT NULL,
    marketname character varying(100) NOT NULL,
    marketdescription text,
    marketlatitude numeric(10,8) NOT NULL,
    marketlongitude numeric(11,8) NOT NULL,
    marketaddress character varying(255) NOT NULL,
    createdat timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    isdeleted boolean DEFAULT false
);
     DROP TABLE public.marketplaces;
       public         heap    postgres    false         �            1259    51364    marketplaces_marketid_seq    SEQUENCE     �   CREATE SEQUENCE public.marketplaces_marketid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.marketplaces_marketid_seq;
       public          postgres    false    224         H           0    0    marketplaces_marketid_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.marketplaces_marketid_seq OWNED BY public.marketplaces.marketid;
          public          postgres    false    223         �            1259    51477    orderhistory    TABLE     �   CREATE TABLE public.orderhistory (
    orderhistoryid bigint NOT NULL,
    orderid bigint NOT NULL,
    statuschangedat timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    previousstatusid bigint NOT NULL,
    newstatusid bigint NOT NULL
);
     DROP TABLE public.orderhistory;
       public         heap    postgres    false         �            1259    51476    orderhistory_orderhistoryid_seq    SEQUENCE     �   CREATE SEQUENCE public.orderhistory_orderhistoryid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.orderhistory_orderhistoryid_seq;
       public          postgres    false    236         I           0    0    orderhistory_orderhistoryid_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.orderhistory_orderhistoryid_seq OWNED BY public.orderhistory.orderhistoryid;
          public          postgres    false    235         �            1259    51460 
   orderitems    TABLE     �   CREATE TABLE public.orderitems (
    orderitemid bigint NOT NULL,
    orderid bigint NOT NULL,
    productid bigint NOT NULL,
    quantity integer NOT NULL,
    itemprice numeric(10,2) NOT NULL
);
    DROP TABLE public.orderitems;
       public         heap    postgres    false         �            1259    51459    orderitems_orderitemid_seq    SEQUENCE     �   CREATE SEQUENCE public.orderitems_orderitemid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.orderitems_orderitemid_seq;
       public          postgres    false    234         J           0    0    orderitems_orderitemid_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.orderitems_orderitemid_seq OWNED BY public.orderitems.orderitemid;
          public          postgres    false    233         �            1259    51441    orders    TABLE     �   CREATE TABLE public.orders (
    orderid bigint NOT NULL,
    userid bigint NOT NULL,
    orderdate timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    totalamount numeric(10,2) NOT NULL,
    orderstatusid bigint DEFAULT 1
);
    DROP TABLE public.orders;
       public         heap    postgres    false         �            1259    51440    orders_orderid_seq    SEQUENCE     {   CREATE SEQUENCE public.orders_orderid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.orders_orderid_seq;
       public          postgres    false    232         K           0    0    orders_orderid_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.orders_orderid_seq OWNED BY public.orders.orderid;
          public          postgres    false    231         �            1259    51432    orderstatuses    TABLE     x   CREATE TABLE public.orderstatuses (
    orderstatusid bigint NOT NULL,
    statusname character varying(20) NOT NULL
);
 !   DROP TABLE public.orderstatuses;
       public         heap    postgres    false         �            1259    51431    orderstatuses_orderstatusid_seq    SEQUENCE     �   CREATE SEQUENCE public.orderstatuses_orderstatusid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.orderstatuses_orderstatusid_seq;
       public          postgres    false    230         L           0    0    orderstatuses_orderstatusid_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.orderstatuses_orderstatusid_seq OWNED BY public.orderstatuses.orderstatusid;
          public          postgres    false    229         �            1259    51500    orderstatushistory    TABLE     �   CREATE TABLE public.orderstatushistory (
    statushistoryid bigint NOT NULL,
    orderid bigint NOT NULL,
    statusid bigint NOT NULL,
    changedat timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
 &   DROP TABLE public.orderstatushistory;
       public         heap    postgres    false         �            1259    51499 &   orderstatushistory_statushistoryid_seq    SEQUENCE     �   CREATE SEQUENCE public.orderstatushistory_statushistoryid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 =   DROP SEQUENCE public.orderstatushistory_statushistoryid_seq;
       public          postgres    false    238         M           0    0 &   orderstatushistory_statushistoryid_seq    SEQUENCE OWNED BY     q   ALTER SEQUENCE public.orderstatushistory_statushistoryid_seq OWNED BY public.orderstatushistory.statushistoryid;
          public          postgres    false    237         �            1259    51376    productlistings    TABLE     [  CREATE TABLE public.productlistings (
    listingid bigint NOT NULL,
    sellerid bigint NOT NULL,
    productid bigint NOT NULL,
    marketid bigint NOT NULL,
    listingprice numeric(10,2) NOT NULL,
    listingquantity integer NOT NULL,
    createdat timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    isdeleted boolean DEFAULT false
);
 #   DROP TABLE public.productlistings;
       public         heap    postgres    false         �            1259    51375    productlistings_listingid_seq    SEQUENCE     �   CREATE SEQUENCE public.productlistings_listingid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.productlistings_listingid_seq;
       public          postgres    false    226         N           0    0    productlistings_listingid_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.productlistings_listingid_seq OWNED BY public.productlistings.listingid;
          public          postgres    false    225         �            1259    51349    products    TABLE     �  CREATE TABLE public.products (
    productid bigint NOT NULL,
    productname character varying(100) NOT NULL,
    productdescription text,
    productprice numeric(10,2) NOT NULL,
    producttypeid bigint NOT NULL,
    productmeasuretype character varying(10) NOT NULL,
    productimage character varying(255),
    maxquantity integer NOT NULL,
    createdat timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    isdeleted boolean DEFAULT false
);
    DROP TABLE public.products;
       public         heap    postgres    false         �            1259    51348    products_productid_seq    SEQUENCE        CREATE SEQUENCE public.products_productid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.products_productid_seq;
       public          postgres    false    222         O           0    0    products_productid_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.products_productid_seq OWNED BY public.products.productid;
          public          postgres    false    221         �            1259    51340    producttypes    TABLE     |   CREATE TABLE public.producttypes (
    producttypeid bigint NOT NULL,
    producttypename character varying(20) NOT NULL
);
     DROP TABLE public.producttypes;
       public         heap    postgres    false         �            1259    51339    producttypes_producttypeid_seq    SEQUENCE     �   CREATE SEQUENCE public.producttypes_producttypeid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.producttypes_producttypeid_seq;
       public          postgres    false    220         P           0    0    producttypes_producttypeid_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.producttypes_producttypeid_seq OWNED BY public.producttypes.producttypeid;
          public          postgres    false    219         �            1259    51313    roles    TABLE     g   CREATE TABLE public.roles (
    roleid bigint NOT NULL,
    rolename character varying(10) NOT NULL
);
    DROP TABLE public.roles;
       public         heap    postgres    false         �            1259    51312    roles_roleid_seq    SEQUENCE     y   CREATE SEQUENCE public.roles_roleid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.roles_roleid_seq;
       public          postgres    false    216         Q           0    0    roles_roleid_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.roles_roleid_seq OWNED BY public.roles.roleid;
          public          postgres    false    215         �            1259    51322    users    TABLE     t  CREATE TABLE public.users (
    userid bigint NOT NULL,
    firstname character varying(50) NOT NULL,
    lastname character varying(50) NOT NULL,
    email character varying(100) NOT NULL,
    password character varying(255) NOT NULL,
    roleid bigint NOT NULL,
    createdat timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    isdeleted boolean DEFAULT false
);
    DROP TABLE public.users;
       public         heap    postgres    false         �            1259    51321    users_userid_seq    SEQUENCE     y   CREATE SEQUENCE public.users_userid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.users_userid_seq;
       public          postgres    false    218         R           0    0    users_userid_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.users_userid_seq OWNED BY public.users.userid;
          public          postgres    false    217         _           2604    51403    cart cartid    DEFAULT     j   ALTER TABLE ONLY public.cart ALTER COLUMN cartid SET DEFAULT nextval('public.cart_cartid_seq'::regclass);
 :   ALTER TABLE public.cart ALTER COLUMN cartid DROP DEFAULT;
       public          postgres    false    228    227    228         Y           2604    51368    marketplaces marketid    DEFAULT     ~   ALTER TABLE ONLY public.marketplaces ALTER COLUMN marketid SET DEFAULT nextval('public.marketplaces_marketid_seq'::regclass);
 D   ALTER TABLE public.marketplaces ALTER COLUMN marketid DROP DEFAULT;
       public          postgres    false    223    224    224         f           2604    51480    orderhistory orderhistoryid    DEFAULT     �   ALTER TABLE ONLY public.orderhistory ALTER COLUMN orderhistoryid SET DEFAULT nextval('public.orderhistory_orderhistoryid_seq'::regclass);
 J   ALTER TABLE public.orderhistory ALTER COLUMN orderhistoryid DROP DEFAULT;
       public          postgres    false    235    236    236         e           2604    51463    orderitems orderitemid    DEFAULT     �   ALTER TABLE ONLY public.orderitems ALTER COLUMN orderitemid SET DEFAULT nextval('public.orderitems_orderitemid_seq'::regclass);
 E   ALTER TABLE public.orderitems ALTER COLUMN orderitemid DROP DEFAULT;
       public          postgres    false    234    233    234         b           2604    51444    orders orderid    DEFAULT     p   ALTER TABLE ONLY public.orders ALTER COLUMN orderid SET DEFAULT nextval('public.orders_orderid_seq'::regclass);
 =   ALTER TABLE public.orders ALTER COLUMN orderid DROP DEFAULT;
       public          postgres    false    232    231    232         a           2604    51435    orderstatuses orderstatusid    DEFAULT     �   ALTER TABLE ONLY public.orderstatuses ALTER COLUMN orderstatusid SET DEFAULT nextval('public.orderstatuses_orderstatusid_seq'::regclass);
 J   ALTER TABLE public.orderstatuses ALTER COLUMN orderstatusid DROP DEFAULT;
       public          postgres    false    230    229    230         h           2604    51503 "   orderstatushistory statushistoryid    DEFAULT     �   ALTER TABLE ONLY public.orderstatushistory ALTER COLUMN statushistoryid SET DEFAULT nextval('public.orderstatushistory_statushistoryid_seq'::regclass);
 Q   ALTER TABLE public.orderstatushistory ALTER COLUMN statushistoryid DROP DEFAULT;
       public          postgres    false    238    237    238         \           2604    51379    productlistings listingid    DEFAULT     �   ALTER TABLE ONLY public.productlistings ALTER COLUMN listingid SET DEFAULT nextval('public.productlistings_listingid_seq'::regclass);
 H   ALTER TABLE public.productlistings ALTER COLUMN listingid DROP DEFAULT;
       public          postgres    false    225    226    226         V           2604    51352    products productid    DEFAULT     x   ALTER TABLE ONLY public.products ALTER COLUMN productid SET DEFAULT nextval('public.products_productid_seq'::regclass);
 A   ALTER TABLE public.products ALTER COLUMN productid DROP DEFAULT;
       public          postgres    false    222    221    222         U           2604    51343    producttypes producttypeid    DEFAULT     �   ALTER TABLE ONLY public.producttypes ALTER COLUMN producttypeid SET DEFAULT nextval('public.producttypes_producttypeid_seq'::regclass);
 I   ALTER TABLE public.producttypes ALTER COLUMN producttypeid DROP DEFAULT;
       public          postgres    false    219    220    220         Q           2604    51316    roles roleid    DEFAULT     l   ALTER TABLE ONLY public.roles ALTER COLUMN roleid SET DEFAULT nextval('public.roles_roleid_seq'::regclass);
 ;   ALTER TABLE public.roles ALTER COLUMN roleid DROP DEFAULT;
       public          postgres    false    216    215    216         R           2604    51325    users userid    DEFAULT     l   ALTER TABLE ONLY public.users ALTER COLUMN userid SET DEFAULT nextval('public.users_userid_seq'::regclass);
 ;   ALTER TABLE public.users ALTER COLUMN userid DROP DEFAULT;
       public          postgres    false    217    218    218         6          0    51400    cart 
   TABLE DATA           N   COPY public.cart (cartid, userid, productid, quantity, createdat) FROM stdin;
    public          postgres    false    228       4918.dat 2          0    51365    marketplaces 
   TABLE DATA           �   COPY public.marketplaces (marketid, marketname, marketdescription, marketlatitude, marketlongitude, marketaddress, createdat, isdeleted) FROM stdin;
    public          postgres    false    224       4914.dat >          0    51477    orderhistory 
   TABLE DATA           o   COPY public.orderhistory (orderhistoryid, orderid, statuschangedat, previousstatusid, newstatusid) FROM stdin;
    public          postgres    false    236       4926.dat <          0    51460 
   orderitems 
   TABLE DATA           Z   COPY public.orderitems (orderitemid, orderid, productid, quantity, itemprice) FROM stdin;
    public          postgres    false    234       4924.dat :          0    51441    orders 
   TABLE DATA           X   COPY public.orders (orderid, userid, orderdate, totalamount, orderstatusid) FROM stdin;
    public          postgres    false    232       4922.dat 8          0    51432    orderstatuses 
   TABLE DATA           B   COPY public.orderstatuses (orderstatusid, statusname) FROM stdin;
    public          postgres    false    230       4920.dat @          0    51500    orderstatushistory 
   TABLE DATA           [   COPY public.orderstatushistory (statushistoryid, orderid, statusid, changedat) FROM stdin;
    public          postgres    false    238       4928.dat 4          0    51376    productlistings 
   TABLE DATA           �   COPY public.productlistings (listingid, sellerid, productid, marketid, listingprice, listingquantity, createdat, isdeleted) FROM stdin;
    public          postgres    false    226       4916.dat 0          0    51349    products 
   TABLE DATA           �   COPY public.products (productid, productname, productdescription, productprice, producttypeid, productmeasuretype, productimage, maxquantity, createdat, isdeleted) FROM stdin;
    public          postgres    false    222       4912.dat .          0    51340    producttypes 
   TABLE DATA           F   COPY public.producttypes (producttypeid, producttypename) FROM stdin;
    public          postgres    false    220       4910.dat *          0    51313    roles 
   TABLE DATA           1   COPY public.roles (roleid, rolename) FROM stdin;
    public          postgres    false    216       4906.dat ,          0    51322    users 
   TABLE DATA           k   COPY public.users (userid, firstname, lastname, email, password, roleid, createdat, isdeleted) FROM stdin;
    public          postgres    false    218       4908.dat S           0    0    cart_cartid_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.cart_cartid_seq', 1, false);
          public          postgres    false    227         T           0    0    marketplaces_marketid_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.marketplaces_marketid_seq', 1, false);
          public          postgres    false    223         U           0    0    orderhistory_orderhistoryid_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.orderhistory_orderhistoryid_seq', 1, false);
          public          postgres    false    235         V           0    0    orderitems_orderitemid_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.orderitems_orderitemid_seq', 1, false);
          public          postgres    false    233         W           0    0    orders_orderid_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.orders_orderid_seq', 1, false);
          public          postgres    false    231         X           0    0    orderstatuses_orderstatusid_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.orderstatuses_orderstatusid_seq', 3, true);
          public          postgres    false    229         Y           0    0 &   orderstatushistory_statushistoryid_seq    SEQUENCE SET     U   SELECT pg_catalog.setval('public.orderstatushistory_statushistoryid_seq', 1, false);
          public          postgres    false    237         Z           0    0    productlistings_listingid_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.productlistings_listingid_seq', 1, false);
          public          postgres    false    225         [           0    0    products_productid_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.products_productid_seq', 1, false);
          public          postgres    false    221         \           0    0    producttypes_producttypeid_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.producttypes_producttypeid_seq', 3, true);
          public          postgres    false    219         ]           0    0    roles_roleid_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.roles_roleid_seq', 3, true);
          public          postgres    false    215         ^           0    0    users_userid_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.users_userid_seq', 10, true);
          public          postgres    false    217         }           2606    51406    cart cart_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.cart
    ADD CONSTRAINT cart_pkey PRIMARY KEY (cartid);
 8   ALTER TABLE ONLY public.cart DROP CONSTRAINT cart_pkey;
       public            postgres    false    228         y           2606    51374    marketplaces marketplaces_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.marketplaces
    ADD CONSTRAINT marketplaces_pkey PRIMARY KEY (marketid);
 H   ALTER TABLE ONLY public.marketplaces DROP CONSTRAINT marketplaces_pkey;
       public            postgres    false    224         �           2606    51483    orderhistory orderhistory_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.orderhistory
    ADD CONSTRAINT orderhistory_pkey PRIMARY KEY (orderhistoryid);
 H   ALTER TABLE ONLY public.orderhistory DROP CONSTRAINT orderhistory_pkey;
       public            postgres    false    236         �           2606    51465    orderitems orderitems_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY public.orderitems
    ADD CONSTRAINT orderitems_pkey PRIMARY KEY (orderitemid);
 D   ALTER TABLE ONLY public.orderitems DROP CONSTRAINT orderitems_pkey;
       public            postgres    false    234         �           2606    51448    orders orders_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (orderid);
 <   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_pkey;
       public            postgres    false    232                    2606    51437     orderstatuses orderstatuses_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.orderstatuses
    ADD CONSTRAINT orderstatuses_pkey PRIMARY KEY (orderstatusid);
 J   ALTER TABLE ONLY public.orderstatuses DROP CONSTRAINT orderstatuses_pkey;
       public            postgres    false    230         �           2606    51439 *   orderstatuses orderstatuses_statusname_key 
   CONSTRAINT     k   ALTER TABLE ONLY public.orderstatuses
    ADD CONSTRAINT orderstatuses_statusname_key UNIQUE (statusname);
 T   ALTER TABLE ONLY public.orderstatuses DROP CONSTRAINT orderstatuses_statusname_key;
       public            postgres    false    230         �           2606    51506 *   orderstatushistory orderstatushistory_pkey 
   CONSTRAINT     u   ALTER TABLE ONLY public.orderstatushistory
    ADD CONSTRAINT orderstatushistory_pkey PRIMARY KEY (statushistoryid);
 T   ALTER TABLE ONLY public.orderstatushistory DROP CONSTRAINT orderstatushistory_pkey;
       public            postgres    false    238         {           2606    51383 $   productlistings productlistings_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.productlistings
    ADD CONSTRAINT productlistings_pkey PRIMARY KEY (listingid);
 N   ALTER TABLE ONLY public.productlistings DROP CONSTRAINT productlistings_pkey;
       public            postgres    false    226         w           2606    51358    products products_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (productid);
 @   ALTER TABLE ONLY public.products DROP CONSTRAINT products_pkey;
       public            postgres    false    222         s           2606    51345    producttypes producttypes_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY public.producttypes
    ADD CONSTRAINT producttypes_pkey PRIMARY KEY (producttypeid);
 H   ALTER TABLE ONLY public.producttypes DROP CONSTRAINT producttypes_pkey;
       public            postgres    false    220         u           2606    51347 -   producttypes producttypes_producttypename_key 
   CONSTRAINT     s   ALTER TABLE ONLY public.producttypes
    ADD CONSTRAINT producttypes_producttypename_key UNIQUE (producttypename);
 W   ALTER TABLE ONLY public.producttypes DROP CONSTRAINT producttypes_producttypename_key;
       public            postgres    false    220         k           2606    51318    roles roles_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (roleid);
 :   ALTER TABLE ONLY public.roles DROP CONSTRAINT roles_pkey;
       public            postgres    false    216         m           2606    51320    roles roles_rolename_key 
   CONSTRAINT     W   ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_rolename_key UNIQUE (rolename);
 B   ALTER TABLE ONLY public.roles DROP CONSTRAINT roles_rolename_key;
       public            postgres    false    216         o           2606    51333    users users_email_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);
 ?   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key;
       public            postgres    false    218         q           2606    51331    users users_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (userid);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    218         �           2606    51412    cart cart_productid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.cart
    ADD CONSTRAINT cart_productid_fkey FOREIGN KEY (productid) REFERENCES public.products(productid);
 B   ALTER TABLE ONLY public.cart DROP CONSTRAINT cart_productid_fkey;
       public          postgres    false    228    222    4727         �           2606    51407    cart cart_userid_fkey    FK CONSTRAINT     w   ALTER TABLE ONLY public.cart
    ADD CONSTRAINT cart_userid_fkey FOREIGN KEY (userid) REFERENCES public.users(userid);
 ?   ALTER TABLE ONLY public.cart DROP CONSTRAINT cart_userid_fkey;
       public          postgres    false    228    218    4721         �           2606    51494 *   orderhistory orderhistory_newstatusid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.orderhistory
    ADD CONSTRAINT orderhistory_newstatusid_fkey FOREIGN KEY (newstatusid) REFERENCES public.orderstatuses(orderstatusid);
 T   ALTER TABLE ONLY public.orderhistory DROP CONSTRAINT orderhistory_newstatusid_fkey;
       public          postgres    false    230    4735    236         �           2606    51484 &   orderhistory orderhistory_orderid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.orderhistory
    ADD CONSTRAINT orderhistory_orderid_fkey FOREIGN KEY (orderid) REFERENCES public.orders(orderid);
 P   ALTER TABLE ONLY public.orderhistory DROP CONSTRAINT orderhistory_orderid_fkey;
       public          postgres    false    232    4739    236         �           2606    51489 /   orderhistory orderhistory_previousstatusid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.orderhistory
    ADD CONSTRAINT orderhistory_previousstatusid_fkey FOREIGN KEY (previousstatusid) REFERENCES public.orderstatuses(orderstatusid);
 Y   ALTER TABLE ONLY public.orderhistory DROP CONSTRAINT orderhistory_previousstatusid_fkey;
       public          postgres    false    4735    230    236         �           2606    51466 "   orderitems orderitems_orderid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.orderitems
    ADD CONSTRAINT orderitems_orderid_fkey FOREIGN KEY (orderid) REFERENCES public.orders(orderid);
 L   ALTER TABLE ONLY public.orderitems DROP CONSTRAINT orderitems_orderid_fkey;
       public          postgres    false    232    4739    234         �           2606    51471 $   orderitems orderitems_productid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.orderitems
    ADD CONSTRAINT orderitems_productid_fkey FOREIGN KEY (productid) REFERENCES public.products(productid);
 N   ALTER TABLE ONLY public.orderitems DROP CONSTRAINT orderitems_productid_fkey;
       public          postgres    false    234    222    4727         �           2606    51454     orders orders_orderstatusid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_orderstatusid_fkey FOREIGN KEY (orderstatusid) REFERENCES public.orderstatuses(orderstatusid);
 J   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_orderstatusid_fkey;
       public          postgres    false    230    4735    232         �           2606    51449    orders orders_userid_fkey    FK CONSTRAINT     {   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_userid_fkey FOREIGN KEY (userid) REFERENCES public.users(userid);
 C   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_userid_fkey;
       public          postgres    false    4721    218    232         �           2606    51507 2   orderstatushistory orderstatushistory_orderid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.orderstatushistory
    ADD CONSTRAINT orderstatushistory_orderid_fkey FOREIGN KEY (orderid) REFERENCES public.orders(orderid);
 \   ALTER TABLE ONLY public.orderstatushistory DROP CONSTRAINT orderstatushistory_orderid_fkey;
       public          postgres    false    4739    232    238         �           2606    51512 3   orderstatushistory orderstatushistory_statusid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.orderstatushistory
    ADD CONSTRAINT orderstatushistory_statusid_fkey FOREIGN KEY (statusid) REFERENCES public.orderstatuses(orderstatusid);
 ]   ALTER TABLE ONLY public.orderstatushistory DROP CONSTRAINT orderstatushistory_statusid_fkey;
       public          postgres    false    4735    238    230         �           2606    51394 -   productlistings productlistings_marketid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.productlistings
    ADD CONSTRAINT productlistings_marketid_fkey FOREIGN KEY (marketid) REFERENCES public.marketplaces(marketid);
 W   ALTER TABLE ONLY public.productlistings DROP CONSTRAINT productlistings_marketid_fkey;
       public          postgres    false    226    224    4729         �           2606    51389 .   productlistings productlistings_productid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.productlistings
    ADD CONSTRAINT productlistings_productid_fkey FOREIGN KEY (productid) REFERENCES public.products(productid);
 X   ALTER TABLE ONLY public.productlistings DROP CONSTRAINT productlistings_productid_fkey;
       public          postgres    false    4727    226    222         �           2606    51384 -   productlistings productlistings_sellerid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.productlistings
    ADD CONSTRAINT productlistings_sellerid_fkey FOREIGN KEY (sellerid) REFERENCES public.users(userid);
 W   ALTER TABLE ONLY public.productlistings DROP CONSTRAINT productlistings_sellerid_fkey;
       public          postgres    false    218    226    4721         �           2606    51359 $   products products_producttypeid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_producttypeid_fkey FOREIGN KEY (producttypeid) REFERENCES public.producttypes(producttypeid);
 N   ALTER TABLE ONLY public.products DROP CONSTRAINT products_producttypeid_fkey;
       public          postgres    false    222    220    4723         �           2606    51334    users users_roleid_fkey    FK CONSTRAINT     y   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_roleid_fkey FOREIGN KEY (roleid) REFERENCES public.roles(roleid);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_roleid_fkey;
       public          postgres    false    4715    218    216                                                                                                                                                                                                                                                                                                                                                                                                                                                              4918.dat                                                                                            0000600 0004000 0002000 00000000005 14637013424 0014256 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           4914.dat                                                                                            0000600 0004000 0002000 00000000005 14637013424 0014252 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           4926.dat                                                                                            0000600 0004000 0002000 00000000005 14637013424 0014255 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           4924.dat                                                                                            0000600 0004000 0002000 00000000005 14637013424 0014253 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           4922.dat                                                                                            0000600 0004000 0002000 00000000005 14637013424 0014251 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           4920.dat                                                                                            0000600 0004000 0002000 00000000047 14637013424 0014255 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	pending
2	completed
3	cancelled
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         4928.dat                                                                                            0000600 0004000 0002000 00000000005 14637013424 0014257 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           4916.dat                                                                                            0000600 0004000 0002000 00000000005 14637013424 0014254 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           4912.dat                                                                                            0000600 0004000 0002000 00000000005 14637013424 0014250 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           4910.dat                                                                                            0000600 0004000 0002000 00000000043 14637013424 0014250 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	fruits
2	vegetables
3	dairy
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             4906.dat                                                                                            0000600 0004000 0002000 00000000036 14637013424 0014257 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	admin
2	buyer
3	seller
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  4908.dat                                                                                            0000600 0004000 0002000 00000001144 14637013424 0014262 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	Karan	Prajapati	admin@gmail.com	admin123	1	2024-06-25 00:01:05.154676	f
3	John	Doe	john.doe@example.com	12345678	2	2024-06-25 00:43:05.961642	f
4	User	1	user1@gmail.com	12345678	2	2024-06-25 00:47:28.964899	f
5	User	2	user2@gmail.com	12345678	2	2024-06-25 00:50:25.399585	f
6	User	3	user3@gmail.com	12345678	2	2024-06-25 02:19:01.066005	f
7	User	4	user4@gmail.com	12345678	2	2024-06-25 02:23:18.561352	f
8	buyer	1	buyer1@gmail.com	buyer1	2	2024-06-26 02:39:06.867154	f
9	seller	1	seller1@gmail.com	seller1	3	2024-06-26 02:39:41.634285	f
10	demo	user	demo@gmail.com	12345678	2	2024-06-26 06:06:50.232887	f
\.


                                                                                                                                                                                                                                                                                                                                                                                                                            restore.sql                                                                                         0000600 0004000 0002000 00000064660 14637013424 0015404 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        --
-- NOTE:
--
-- File paths need to be edited. Search for $$PATH$$ and
-- replace it with the path to the directory containing
-- the extracted data files.
--
--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2
-- Dumped by pg_dump version 16.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE "FarmConnect";
--
-- Name: FarmConnect; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE "FarmConnect" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_India.1252';


ALTER DATABASE "FarmConnect" OWNER TO postgres;

\connect "FarmConnect"

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: cart; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cart (
    cartid bigint NOT NULL,
    userid bigint NOT NULL,
    productid bigint NOT NULL,
    quantity integer NOT NULL,
    createdat timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.cart OWNER TO postgres;

--
-- Name: cart_cartid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cart_cartid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cart_cartid_seq OWNER TO postgres;

--
-- Name: cart_cartid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cart_cartid_seq OWNED BY public.cart.cartid;


--
-- Name: marketplaces; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.marketplaces (
    marketid bigint NOT NULL,
    marketname character varying(100) NOT NULL,
    marketdescription text,
    marketlatitude numeric(10,8) NOT NULL,
    marketlongitude numeric(11,8) NOT NULL,
    marketaddress character varying(255) NOT NULL,
    createdat timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    isdeleted boolean DEFAULT false
);


ALTER TABLE public.marketplaces OWNER TO postgres;

--
-- Name: marketplaces_marketid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.marketplaces_marketid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.marketplaces_marketid_seq OWNER TO postgres;

--
-- Name: marketplaces_marketid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.marketplaces_marketid_seq OWNED BY public.marketplaces.marketid;


--
-- Name: orderhistory; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orderhistory (
    orderhistoryid bigint NOT NULL,
    orderid bigint NOT NULL,
    statuschangedat timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    previousstatusid bigint NOT NULL,
    newstatusid bigint NOT NULL
);


ALTER TABLE public.orderhistory OWNER TO postgres;

--
-- Name: orderhistory_orderhistoryid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orderhistory_orderhistoryid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.orderhistory_orderhistoryid_seq OWNER TO postgres;

--
-- Name: orderhistory_orderhistoryid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orderhistory_orderhistoryid_seq OWNED BY public.orderhistory.orderhistoryid;


--
-- Name: orderitems; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orderitems (
    orderitemid bigint NOT NULL,
    orderid bigint NOT NULL,
    productid bigint NOT NULL,
    quantity integer NOT NULL,
    itemprice numeric(10,2) NOT NULL
);


ALTER TABLE public.orderitems OWNER TO postgres;

--
-- Name: orderitems_orderitemid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orderitems_orderitemid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.orderitems_orderitemid_seq OWNER TO postgres;

--
-- Name: orderitems_orderitemid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orderitems_orderitemid_seq OWNED BY public.orderitems.orderitemid;


--
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    orderid bigint NOT NULL,
    userid bigint NOT NULL,
    orderdate timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    totalamount numeric(10,2) NOT NULL,
    orderstatusid bigint DEFAULT 1
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- Name: orders_orderid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_orderid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.orders_orderid_seq OWNER TO postgres;

--
-- Name: orders_orderid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_orderid_seq OWNED BY public.orders.orderid;


--
-- Name: orderstatuses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orderstatuses (
    orderstatusid bigint NOT NULL,
    statusname character varying(20) NOT NULL
);


ALTER TABLE public.orderstatuses OWNER TO postgres;

--
-- Name: orderstatuses_orderstatusid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orderstatuses_orderstatusid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.orderstatuses_orderstatusid_seq OWNER TO postgres;

--
-- Name: orderstatuses_orderstatusid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orderstatuses_orderstatusid_seq OWNED BY public.orderstatuses.orderstatusid;


--
-- Name: orderstatushistory; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orderstatushistory (
    statushistoryid bigint NOT NULL,
    orderid bigint NOT NULL,
    statusid bigint NOT NULL,
    changedat timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.orderstatushistory OWNER TO postgres;

--
-- Name: orderstatushistory_statushistoryid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orderstatushistory_statushistoryid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.orderstatushistory_statushistoryid_seq OWNER TO postgres;

--
-- Name: orderstatushistory_statushistoryid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orderstatushistory_statushistoryid_seq OWNED BY public.orderstatushistory.statushistoryid;


--
-- Name: productlistings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.productlistings (
    listingid bigint NOT NULL,
    sellerid bigint NOT NULL,
    productid bigint NOT NULL,
    marketid bigint NOT NULL,
    listingprice numeric(10,2) NOT NULL,
    listingquantity integer NOT NULL,
    createdat timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    isdeleted boolean DEFAULT false
);


ALTER TABLE public.productlistings OWNER TO postgres;

--
-- Name: productlistings_listingid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.productlistings_listingid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.productlistings_listingid_seq OWNER TO postgres;

--
-- Name: productlistings_listingid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.productlistings_listingid_seq OWNED BY public.productlistings.listingid;


--
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    productid bigint NOT NULL,
    productname character varying(100) NOT NULL,
    productdescription text,
    productprice numeric(10,2) NOT NULL,
    producttypeid bigint NOT NULL,
    productmeasuretype character varying(10) NOT NULL,
    productimage character varying(255),
    maxquantity integer NOT NULL,
    createdat timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    isdeleted boolean DEFAULT false
);


ALTER TABLE public.products OWNER TO postgres;

--
-- Name: products_productid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.products_productid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.products_productid_seq OWNER TO postgres;

--
-- Name: products_productid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.products_productid_seq OWNED BY public.products.productid;


--
-- Name: producttypes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.producttypes (
    producttypeid bigint NOT NULL,
    producttypename character varying(20) NOT NULL
);


ALTER TABLE public.producttypes OWNER TO postgres;

--
-- Name: producttypes_producttypeid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.producttypes_producttypeid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.producttypes_producttypeid_seq OWNER TO postgres;

--
-- Name: producttypes_producttypeid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.producttypes_producttypeid_seq OWNED BY public.producttypes.producttypeid;


--
-- Name: roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roles (
    roleid bigint NOT NULL,
    rolename character varying(10) NOT NULL
);


ALTER TABLE public.roles OWNER TO postgres;

--
-- Name: roles_roleid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.roles_roleid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.roles_roleid_seq OWNER TO postgres;

--
-- Name: roles_roleid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.roles_roleid_seq OWNED BY public.roles.roleid;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    userid bigint NOT NULL,
    firstname character varying(50) NOT NULL,
    lastname character varying(50) NOT NULL,
    email character varying(100) NOT NULL,
    password character varying(255) NOT NULL,
    roleid bigint NOT NULL,
    createdat timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    isdeleted boolean DEFAULT false
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_userid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_userid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_userid_seq OWNER TO postgres;

--
-- Name: users_userid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_userid_seq OWNED BY public.users.userid;


--
-- Name: cart cartid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart ALTER COLUMN cartid SET DEFAULT nextval('public.cart_cartid_seq'::regclass);


--
-- Name: marketplaces marketid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.marketplaces ALTER COLUMN marketid SET DEFAULT nextval('public.marketplaces_marketid_seq'::regclass);


--
-- Name: orderhistory orderhistoryid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orderhistory ALTER COLUMN orderhistoryid SET DEFAULT nextval('public.orderhistory_orderhistoryid_seq'::regclass);


--
-- Name: orderitems orderitemid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orderitems ALTER COLUMN orderitemid SET DEFAULT nextval('public.orderitems_orderitemid_seq'::regclass);


--
-- Name: orders orderid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders ALTER COLUMN orderid SET DEFAULT nextval('public.orders_orderid_seq'::regclass);


--
-- Name: orderstatuses orderstatusid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orderstatuses ALTER COLUMN orderstatusid SET DEFAULT nextval('public.orderstatuses_orderstatusid_seq'::regclass);


--
-- Name: orderstatushistory statushistoryid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orderstatushistory ALTER COLUMN statushistoryid SET DEFAULT nextval('public.orderstatushistory_statushistoryid_seq'::regclass);


--
-- Name: productlistings listingid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productlistings ALTER COLUMN listingid SET DEFAULT nextval('public.productlistings_listingid_seq'::regclass);


--
-- Name: products productid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products ALTER COLUMN productid SET DEFAULT nextval('public.products_productid_seq'::regclass);


--
-- Name: producttypes producttypeid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.producttypes ALTER COLUMN producttypeid SET DEFAULT nextval('public.producttypes_producttypeid_seq'::regclass);


--
-- Name: roles roleid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles ALTER COLUMN roleid SET DEFAULT nextval('public.roles_roleid_seq'::regclass);


--
-- Name: users userid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN userid SET DEFAULT nextval('public.users_userid_seq'::regclass);


--
-- Data for Name: cart; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cart (cartid, userid, productid, quantity, createdat) FROM stdin;
\.
COPY public.cart (cartid, userid, productid, quantity, createdat) FROM '$$PATH$$/4918.dat';

--
-- Data for Name: marketplaces; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.marketplaces (marketid, marketname, marketdescription, marketlatitude, marketlongitude, marketaddress, createdat, isdeleted) FROM stdin;
\.
COPY public.marketplaces (marketid, marketname, marketdescription, marketlatitude, marketlongitude, marketaddress, createdat, isdeleted) FROM '$$PATH$$/4914.dat';

--
-- Data for Name: orderhistory; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orderhistory (orderhistoryid, orderid, statuschangedat, previousstatusid, newstatusid) FROM stdin;
\.
COPY public.orderhistory (orderhistoryid, orderid, statuschangedat, previousstatusid, newstatusid) FROM '$$PATH$$/4926.dat';

--
-- Data for Name: orderitems; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orderitems (orderitemid, orderid, productid, quantity, itemprice) FROM stdin;
\.
COPY public.orderitems (orderitemid, orderid, productid, quantity, itemprice) FROM '$$PATH$$/4924.dat';

--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders (orderid, userid, orderdate, totalamount, orderstatusid) FROM stdin;
\.
COPY public.orders (orderid, userid, orderdate, totalamount, orderstatusid) FROM '$$PATH$$/4922.dat';

--
-- Data for Name: orderstatuses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orderstatuses (orderstatusid, statusname) FROM stdin;
\.
COPY public.orderstatuses (orderstatusid, statusname) FROM '$$PATH$$/4920.dat';

--
-- Data for Name: orderstatushistory; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orderstatushistory (statushistoryid, orderid, statusid, changedat) FROM stdin;
\.
COPY public.orderstatushistory (statushistoryid, orderid, statusid, changedat) FROM '$$PATH$$/4928.dat';

--
-- Data for Name: productlistings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.productlistings (listingid, sellerid, productid, marketid, listingprice, listingquantity, createdat, isdeleted) FROM stdin;
\.
COPY public.productlistings (listingid, sellerid, productid, marketid, listingprice, listingquantity, createdat, isdeleted) FROM '$$PATH$$/4916.dat';

--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products (productid, productname, productdescription, productprice, producttypeid, productmeasuretype, productimage, maxquantity, createdat, isdeleted) FROM stdin;
\.
COPY public.products (productid, productname, productdescription, productprice, producttypeid, productmeasuretype, productimage, maxquantity, createdat, isdeleted) FROM '$$PATH$$/4912.dat';

--
-- Data for Name: producttypes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.producttypes (producttypeid, producttypename) FROM stdin;
\.
COPY public.producttypes (producttypeid, producttypename) FROM '$$PATH$$/4910.dat';

--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.roles (roleid, rolename) FROM stdin;
\.
COPY public.roles (roleid, rolename) FROM '$$PATH$$/4906.dat';

--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (userid, firstname, lastname, email, password, roleid, createdat, isdeleted) FROM stdin;
\.
COPY public.users (userid, firstname, lastname, email, password, roleid, createdat, isdeleted) FROM '$$PATH$$/4908.dat';

--
-- Name: cart_cartid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cart_cartid_seq', 1, false);


--
-- Name: marketplaces_marketid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.marketplaces_marketid_seq', 1, false);


--
-- Name: orderhistory_orderhistoryid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orderhistory_orderhistoryid_seq', 1, false);


--
-- Name: orderitems_orderitemid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orderitems_orderitemid_seq', 1, false);


--
-- Name: orders_orderid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_orderid_seq', 1, false);


--
-- Name: orderstatuses_orderstatusid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orderstatuses_orderstatusid_seq', 3, true);


--
-- Name: orderstatushistory_statushistoryid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orderstatushistory_statushistoryid_seq', 1, false);


--
-- Name: productlistings_listingid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.productlistings_listingid_seq', 1, false);


--
-- Name: products_productid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_productid_seq', 1, false);


--
-- Name: producttypes_producttypeid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.producttypes_producttypeid_seq', 3, true);


--
-- Name: roles_roleid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.roles_roleid_seq', 3, true);


--
-- Name: users_userid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_userid_seq', 10, true);


--
-- Name: cart cart_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart
    ADD CONSTRAINT cart_pkey PRIMARY KEY (cartid);


--
-- Name: marketplaces marketplaces_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.marketplaces
    ADD CONSTRAINT marketplaces_pkey PRIMARY KEY (marketid);


--
-- Name: orderhistory orderhistory_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orderhistory
    ADD CONSTRAINT orderhistory_pkey PRIMARY KEY (orderhistoryid);


--
-- Name: orderitems orderitems_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orderitems
    ADD CONSTRAINT orderitems_pkey PRIMARY KEY (orderitemid);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (orderid);


--
-- Name: orderstatuses orderstatuses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orderstatuses
    ADD CONSTRAINT orderstatuses_pkey PRIMARY KEY (orderstatusid);


--
-- Name: orderstatuses orderstatuses_statusname_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orderstatuses
    ADD CONSTRAINT orderstatuses_statusname_key UNIQUE (statusname);


--
-- Name: orderstatushistory orderstatushistory_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orderstatushistory
    ADD CONSTRAINT orderstatushistory_pkey PRIMARY KEY (statushistoryid);


--
-- Name: productlistings productlistings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productlistings
    ADD CONSTRAINT productlistings_pkey PRIMARY KEY (listingid);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (productid);


--
-- Name: producttypes producttypes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.producttypes
    ADD CONSTRAINT producttypes_pkey PRIMARY KEY (producttypeid);


--
-- Name: producttypes producttypes_producttypename_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.producttypes
    ADD CONSTRAINT producttypes_producttypename_key UNIQUE (producttypename);


--
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (roleid);


--
-- Name: roles roles_rolename_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_rolename_key UNIQUE (rolename);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (userid);


--
-- Name: cart cart_productid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart
    ADD CONSTRAINT cart_productid_fkey FOREIGN KEY (productid) REFERENCES public.products(productid);


--
-- Name: cart cart_userid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart
    ADD CONSTRAINT cart_userid_fkey FOREIGN KEY (userid) REFERENCES public.users(userid);


--
-- Name: orderhistory orderhistory_newstatusid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orderhistory
    ADD CONSTRAINT orderhistory_newstatusid_fkey FOREIGN KEY (newstatusid) REFERENCES public.orderstatuses(orderstatusid);


--
-- Name: orderhistory orderhistory_orderid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orderhistory
    ADD CONSTRAINT orderhistory_orderid_fkey FOREIGN KEY (orderid) REFERENCES public.orders(orderid);


--
-- Name: orderhistory orderhistory_previousstatusid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orderhistory
    ADD CONSTRAINT orderhistory_previousstatusid_fkey FOREIGN KEY (previousstatusid) REFERENCES public.orderstatuses(orderstatusid);


--
-- Name: orderitems orderitems_orderid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orderitems
    ADD CONSTRAINT orderitems_orderid_fkey FOREIGN KEY (orderid) REFERENCES public.orders(orderid);


--
-- Name: orderitems orderitems_productid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orderitems
    ADD CONSTRAINT orderitems_productid_fkey FOREIGN KEY (productid) REFERENCES public.products(productid);


--
-- Name: orders orders_orderstatusid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_orderstatusid_fkey FOREIGN KEY (orderstatusid) REFERENCES public.orderstatuses(orderstatusid);


--
-- Name: orders orders_userid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_userid_fkey FOREIGN KEY (userid) REFERENCES public.users(userid);


--
-- Name: orderstatushistory orderstatushistory_orderid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orderstatushistory
    ADD CONSTRAINT orderstatushistory_orderid_fkey FOREIGN KEY (orderid) REFERENCES public.orders(orderid);


--
-- Name: orderstatushistory orderstatushistory_statusid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orderstatushistory
    ADD CONSTRAINT orderstatushistory_statusid_fkey FOREIGN KEY (statusid) REFERENCES public.orderstatuses(orderstatusid);


--
-- Name: productlistings productlistings_marketid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productlistings
    ADD CONSTRAINT productlistings_marketid_fkey FOREIGN KEY (marketid) REFERENCES public.marketplaces(marketid);


--
-- Name: productlistings productlistings_productid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productlistings
    ADD CONSTRAINT productlistings_productid_fkey FOREIGN KEY (productid) REFERENCES public.products(productid);


--
-- Name: productlistings productlistings_sellerid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productlistings
    ADD CONSTRAINT productlistings_sellerid_fkey FOREIGN KEY (sellerid) REFERENCES public.users(userid);


--
-- Name: products products_producttypeid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_producttypeid_fkey FOREIGN KEY (producttypeid) REFERENCES public.producttypes(producttypeid);


--
-- Name: users users_roleid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_roleid_fkey FOREIGN KEY (roleid) REFERENCES public.roles(roleid);


--
-- PostgreSQL database dump complete
--

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                