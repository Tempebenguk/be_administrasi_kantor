PGDMP  7        	            |            administrasikantor "   14.12 (Ubuntu 14.12-1.pgdg22.04+1)     16.3 (Ubuntu 16.3-1.pgdg22.04+1) y    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    17129    administrasikantor    DATABASE     ~   CREATE DATABASE administrasikantor WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'id_ID.UTF-8';
 "   DROP DATABASE administrasikantor;
                admin    false                        2615    2200    public    SCHEMA     2   -- *not* creating schema, since initdb creates it
 2   -- *not* dropping schema, since initdb creates it
                postgres    false            �           0    0    SCHEMA public    ACL     Q   REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;
                   postgres    false    4            �            1259    17307    admin    TABLE     z  CREATE TABLE public.admin (
    id_admin character varying(255) NOT NULL,
    nama character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    remember_token character varying(100),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    no_hp character varying(255)
);
    DROP TABLE public.admin;
       public         heap    admin    false    4            �            1259    17207    cabang    TABLE     �   CREATE TABLE public.cabang (
    id_cabang character varying(255) NOT NULL,
    nama_cabang character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
    DROP TABLE public.cabang;
       public         heap    admin    false    4            �            1259    17164    cache    TABLE     �   CREATE TABLE public.cache (
    key character varying(255) NOT NULL,
    value text NOT NULL,
    expiration integer NOT NULL
);
    DROP TABLE public.cache;
       public         heap    admin    false    4            �            1259    17171    cache_locks    TABLE     �   CREATE TABLE public.cache_locks (
    key character varying(255) NOT NULL,
    owner character varying(255) NOT NULL,
    expiration integer NOT NULL
);
    DROP TABLE public.cache_locks;
       public         heap    admin    false    4            �            1259    17214    departement    TABLE     �   CREATE TABLE public.departement (
    id_departement character varying(255) NOT NULL,
    nama_departement character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
    DROP TABLE public.departement;
       public         heap    admin    false    4            �            1259    17196    failed_jobs    TABLE     &  CREATE TABLE public.failed_jobs (
    id bigint NOT NULL,
    uuid character varying(255) NOT NULL,
    connection text NOT NULL,
    queue text NOT NULL,
    payload text NOT NULL,
    exception text NOT NULL,
    failed_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);
    DROP TABLE public.failed_jobs;
       public         heap    admin    false    4            �            1259    17195    failed_jobs_id_seq    SEQUENCE     {   CREATE SEQUENCE public.failed_jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.failed_jobs_id_seq;
       public          admin    false    221    4            �           0    0    failed_jobs_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.failed_jobs_id_seq OWNED BY public.failed_jobs.id;
          public          admin    false    220            �            1259    17295 
   inventaris    TABLE     �  CREATE TABLE public.inventaris (
    id_inventaris character varying(255) NOT NULL,
    nopol character varying(255) NOT NULL,
    merek character varying(255) NOT NULL,
    kategori character varying(255) NOT NULL,
    tahun integer NOT NULL,
    pajak integer NOT NULL,
    masa_pajak date NOT NULL,
    harga_beli integer NOT NULL,
    tanggal_beli date NOT NULL,
    cabang character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
    DROP TABLE public.inventaris;
       public         heap    admin    false    4            �            1259    17261    jadwal    TABLE     \  CREATE TABLE public.jadwal (
    id_jadwal character varying(255) NOT NULL,
    tanggal timestamp(0) without time zone NOT NULL,
    status character varying(255),
    agenda character varying(255) NOT NULL,
    cabang character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
    DROP TABLE public.jadwal;
       public         heap    admin    false    4            �            1259    17188    job_batches    TABLE     d  CREATE TABLE public.job_batches (
    id character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    total_jobs integer NOT NULL,
    pending_jobs integer NOT NULL,
    failed_jobs integer NOT NULL,
    failed_job_ids text NOT NULL,
    options text,
    cancelled_at integer,
    created_at integer NOT NULL,
    finished_at integer
);
    DROP TABLE public.job_batches;
       public         heap    admin    false    4            �            1259    17179    jobs    TABLE     �   CREATE TABLE public.jobs (
    id bigint NOT NULL,
    queue character varying(255) NOT NULL,
    payload text NOT NULL,
    attempts smallint NOT NULL,
    reserved_at integer,
    available_at integer NOT NULL,
    created_at integer NOT NULL
);
    DROP TABLE public.jobs;
       public         heap    admin    false    4            �            1259    17178    jobs_id_seq    SEQUENCE     t   CREATE SEQUENCE public.jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.jobs_id_seq;
       public          admin    false    218    4            �           0    0    jobs_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.jobs_id_seq OWNED BY public.jobs.id;
          public          admin    false    217            �            1259    17131 
   migrations    TABLE     �   CREATE TABLE public.migrations (
    id integer NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);
    DROP TABLE public.migrations;
       public         heap    admin    false    4            �            1259    17130    migrations_id_seq    SEQUENCE     �   CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.migrations_id_seq;
       public          admin    false    4    210            �           0    0    migrations_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;
          public          admin    false    209            �            1259    17148    password_reset_tokens    TABLE     �   CREATE TABLE public.password_reset_tokens (
    email character varying(255) NOT NULL,
    token character varying(255) NOT NULL,
    created_at timestamp(0) without time zone
);
 )   DROP TABLE public.password_reset_tokens;
       public         heap    admin    false    4            �            1259    17240    pegawai    TABLE     9  CREATE TABLE public.pegawai (
    id_pegawai character varying(255) NOT NULL,
    nip character varying(255) NOT NULL,
    nama character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    departement character varying(255) NOT NULL,
    alamat character varying(255) NOT NULL,
    no_hp character varying(255) NOT NULL,
    cabang character varying(255) NOT NULL,
    remember_token character varying(100),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
    DROP TABLE public.pegawai;
       public         heap    admin    false    4            �            1259    17328    pemakaian_inventaris    TABLE       CREATE TABLE public.pemakaian_inventaris (
    id_pinjam character varying(255) NOT NULL,
    inventaris character varying(255) NOT NULL,
    tanggal_pinjam timestamp(0) without time zone NOT NULL,
    tanggal_kembali timestamp(0) without time zone NOT NULL,
    durasi_pinjam time without time zone NOT NULL,
    pegawai character varying(255) NOT NULL,
    keterangan character varying(255) NOT NULL,
    cabang character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
 (   DROP TABLE public.pemakaian_inventaris;
       public         heap    admin    false    4            �            1259    17317    personal_access_tokens    TABLE     �  CREATE TABLE public.personal_access_tokens (
    id bigint NOT NULL,
    tokenable_type character varying(255) NOT NULL,
    tokenable_id bigint NOT NULL,
    name character varying(255) NOT NULL,
    token character varying(64) NOT NULL,
    abilities text,
    last_used_at timestamp(0) without time zone,
    expires_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
 *   DROP TABLE public.personal_access_tokens;
       public         heap    admin    false    4            �            1259    17316    personal_access_tokens_id_seq    SEQUENCE     �   CREATE SEQUENCE public.personal_access_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.personal_access_tokens_id_seq;
       public          admin    false    4    231            �           0    0    personal_access_tokens_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.personal_access_tokens_id_seq OWNED BY public.personal_access_tokens.id;
          public          admin    false    230            �            1259    17350    reservasi_ruang    TABLE       CREATE TABLE public.reservasi_ruang (
    id_reservasi character varying(255) NOT NULL,
    ruang character varying(255) NOT NULL,
    tanggal_reservasi timestamp without time zone NOT NULL,
    tanggal_selesai timestamp without time zone NOT NULL,
    durasi time without time zone NOT NULL,
    pegawai character varying(255) NOT NULL,
    keterangan character varying(255) NOT NULL,
    cabang character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
 #   DROP TABLE public.reservasi_ruang;
       public         heap    admin    false    4            �            1259    17228    ruang    TABLE       CREATE TABLE public.ruang (
    id_ruang character varying(255) NOT NULL,
    nama_ruang character varying(255) NOT NULL,
    cabang character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
    DROP TABLE public.ruang;
       public         heap    admin    false    4            �            1259    17155    sessions    TABLE     �   CREATE TABLE public.sessions (
    id character varying(255) NOT NULL,
    user_id bigint,
    ip_address character varying(45),
    user_agent text,
    payload text NOT NULL,
    last_activity integer NOT NULL
);
    DROP TABLE public.sessions;
       public         heap    admin    false    4            �            1259    17221    surat    TABLE     �   CREATE TABLE public.surat (
    kode_surat character varying(255) NOT NULL,
    jenis_surat character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
    DROP TABLE public.surat;
       public         heap    admin    false    4            �            1259    17372    surat_keluar    TABLE     �  CREATE TABLE public.surat_keluar (
    id_surat_keluar character varying(255) NOT NULL,
    nomor_surat character varying(255) NOT NULL,
    tanggal_surat date NOT NULL,
    tanggal_kirim date NOT NULL,
    tujuan_surat character varying(255) NOT NULL,
    perihal character varying(255) NOT NULL,
    cabang character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
     DROP TABLE public.surat_keluar;
       public         heap    admin    false    4            �            1259    17384    surat_masuk    TABLE     �  CREATE TABLE public.surat_masuk (
    id_surat_masuk character varying(255) NOT NULL,
    nomor_surat character varying(255) NOT NULL,
    tanggal_surat date NOT NULL,
    tanggal_terima date NOT NULL,
    asal_surat character varying(255) NOT NULL,
    perihal character varying(255) NOT NULL,
    cabang character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
    DROP TABLE public.surat_masuk;
       public         heap    admin    false    4            �            1259    26407    tamu    TABLE     +  CREATE TABLE public.tamu (
    id_tamu character varying(255) NOT NULL,
    tanggal_kunjungan timestamp(0) without time zone NOT NULL,
    nama character varying(255) NOT NULL,
    jabatan character varying(255) NOT NULL,
    no_hp character varying(255) NOT NULL,
    departement_dikunjungi character varying(255) NOT NULL,
    org_dikunjungi character varying(255),
    keperluan character varying(255) NOT NULL,
    cabang character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
    DROP TABLE public.tamu;
       public         heap    admin    false    4            �            1259    17138    users    TABLE     x  CREATE TABLE public.users (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    email_verified_at timestamp(0) without time zone,
    password character varying(255) NOT NULL,
    remember_token character varying(100),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
    DROP TABLE public.users;
       public         heap    admin    false    4            �            1259    17137    users_id_seq    SEQUENCE     u   CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public          admin    false    4    212            �           0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public          admin    false    211            �           2604    17199    failed_jobs id    DEFAULT     p   ALTER TABLE ONLY public.failed_jobs ALTER COLUMN id SET DEFAULT nextval('public.failed_jobs_id_seq'::regclass);
 =   ALTER TABLE public.failed_jobs ALTER COLUMN id DROP DEFAULT;
       public          admin    false    220    221    221            �           2604    17182    jobs id    DEFAULT     b   ALTER TABLE ONLY public.jobs ALTER COLUMN id SET DEFAULT nextval('public.jobs_id_seq'::regclass);
 6   ALTER TABLE public.jobs ALTER COLUMN id DROP DEFAULT;
       public          admin    false    217    218    218            �           2604    17134    migrations id    DEFAULT     n   ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);
 <   ALTER TABLE public.migrations ALTER COLUMN id DROP DEFAULT;
       public          admin    false    209    210    210            �           2604    17320    personal_access_tokens id    DEFAULT     �   ALTER TABLE ONLY public.personal_access_tokens ALTER COLUMN id SET DEFAULT nextval('public.personal_access_tokens_id_seq'::regclass);
 H   ALTER TABLE public.personal_access_tokens ALTER COLUMN id DROP DEFAULT;
       public          admin    false    230    231    231            �           2604    17141    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          admin    false    211    212    212            �          0    17307    admin 
   TABLE DATA           o   COPY public.admin (id_admin, nama, email, password, remember_token, created_at, updated_at, no_hp) FROM stdin;
    public          admin    false    229   J�       �          0    17207    cabang 
   TABLE DATA           P   COPY public.cabang (id_cabang, nama_cabang, created_at, updated_at) FROM stdin;
    public          admin    false    222   �       �          0    17164    cache 
   TABLE DATA           7   COPY public.cache (key, value, expiration) FROM stdin;
    public          admin    false    215   ?�       �          0    17171    cache_locks 
   TABLE DATA           =   COPY public.cache_locks (key, owner, expiration) FROM stdin;
    public          admin    false    216   ��       �          0    17214    departement 
   TABLE DATA           _   COPY public.departement (id_departement, nama_departement, created_at, updated_at) FROM stdin;
    public          admin    false    223   ��       �          0    17196    failed_jobs 
   TABLE DATA           a   COPY public.failed_jobs (id, uuid, connection, queue, payload, exception, failed_at) FROM stdin;
    public          admin    false    221   �       �          0    17295 
   inventaris 
   TABLE DATA           �   COPY public.inventaris (id_inventaris, nopol, merek, kategori, tahun, pajak, masa_pajak, harga_beli, tanggal_beli, cabang, created_at, updated_at) FROM stdin;
    public          admin    false    228    �       �          0    17261    jadwal 
   TABLE DATA           d   COPY public.jadwal (id_jadwal, tanggal, status, agenda, cabang, created_at, updated_at) FROM stdin;
    public          admin    false    227   ��       �          0    17188    job_batches 
   TABLE DATA           �   COPY public.job_batches (id, name, total_jobs, pending_jobs, failed_jobs, failed_job_ids, options, cancelled_at, created_at, finished_at) FROM stdin;
    public          admin    false    219   ��       �          0    17179    jobs 
   TABLE DATA           c   COPY public.jobs (id, queue, payload, attempts, reserved_at, available_at, created_at) FROM stdin;
    public          admin    false    218   ��       �          0    17131 
   migrations 
   TABLE DATA           :   COPY public.migrations (id, migration, batch) FROM stdin;
    public          admin    false    210   ��       �          0    17148    password_reset_tokens 
   TABLE DATA           I   COPY public.password_reset_tokens (email, token, created_at) FROM stdin;
    public          admin    false    213   ϧ       �          0    17240    pegawai 
   TABLE DATA           �   COPY public.pegawai (id_pegawai, nip, nama, email, password, departement, alamat, no_hp, cabang, remember_token, created_at, updated_at) FROM stdin;
    public          admin    false    226   �       �          0    17328    pemakaian_inventaris 
   TABLE DATA           �   COPY public.pemakaian_inventaris (id_pinjam, inventaris, tanggal_pinjam, tanggal_kembali, durasi_pinjam, pegawai, keterangan, cabang, created_at, updated_at) FROM stdin;
    public          admin    false    232   ~�       �          0    17317    personal_access_tokens 
   TABLE DATA           �   COPY public.personal_access_tokens (id, tokenable_type, tokenable_id, name, token, abilities, last_used_at, expires_at, created_at, updated_at) FROM stdin;
    public          admin    false    231   �       �          0    17350    reservasi_ruang 
   TABLE DATA           �   COPY public.reservasi_ruang (id_reservasi, ruang, tanggal_reservasi, tanggal_selesai, durasi, pegawai, keterangan, cabang, created_at, updated_at) FROM stdin;
    public          admin    false    233   <�       �          0    17228    ruang 
   TABLE DATA           U   COPY public.ruang (id_ruang, nama_ruang, cabang, created_at, updated_at) FROM stdin;
    public          admin    false    225   �       �          0    17155    sessions 
   TABLE DATA           _   COPY public.sessions (id, user_id, ip_address, user_agent, payload, last_activity) FROM stdin;
    public          admin    false    214   f�       �          0    17221    surat 
   TABLE DATA           P   COPY public.surat (kode_surat, jenis_surat, created_at, updated_at) FROM stdin;
    public          admin    false    224   ��       �          0    17372    surat_keluar 
   TABLE DATA           �   COPY public.surat_keluar (id_surat_keluar, nomor_surat, tanggal_surat, tanggal_kirim, tujuan_surat, perihal, cabang, created_at, updated_at) FROM stdin;
    public          admin    false    234   ɫ       �          0    17384    surat_masuk 
   TABLE DATA           �   COPY public.surat_masuk (id_surat_masuk, nomor_surat, tanggal_surat, tanggal_terima, asal_surat, perihal, cabang, created_at, updated_at) FROM stdin;
    public          admin    false    235   �       �          0    26407    tamu 
   TABLE DATA           �   COPY public.tamu (id_tamu, tanggal_kunjungan, nama, jabatan, no_hp, departement_dikunjungi, org_dikunjungi, keperluan, cabang, created_at, updated_at) FROM stdin;
    public          admin    false    236   �       �          0    17138    users 
   TABLE DATA           u   COPY public.users (id, name, email, email_verified_at, password, remember_token, created_at, updated_at) FROM stdin;
    public          admin    false    212   ��       �           0    0    failed_jobs_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.failed_jobs_id_seq', 1, false);
          public          admin    false    220            �           0    0    jobs_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.jobs_id_seq', 1, false);
          public          admin    false    217            �           0    0    migrations_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.migrations_id_seq', 18, true);
          public          admin    false    209            �           0    0    personal_access_tokens_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.personal_access_tokens_id_seq', 1, false);
          public          admin    false    230            �           0    0    users_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.users_id_seq', 1, false);
          public          admin    false    211                       2606    17315    admin admin_email_unique 
   CONSTRAINT     T   ALTER TABLE ONLY public.admin
    ADD CONSTRAINT admin_email_unique UNIQUE (email);
 B   ALTER TABLE ONLY public.admin DROP CONSTRAINT admin_email_unique;
       public            admin    false    229                       2606    17313    admin admin_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.admin
    ADD CONSTRAINT admin_pkey PRIMARY KEY (id_admin);
 :   ALTER TABLE ONLY public.admin DROP CONSTRAINT admin_pkey;
       public            admin    false    229                       2606    17213    cabang cabang_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.cabang
    ADD CONSTRAINT cabang_pkey PRIMARY KEY (id_cabang);
 <   ALTER TABLE ONLY public.cabang DROP CONSTRAINT cabang_pkey;
       public            admin    false    222            �           2606    17177    cache_locks cache_locks_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.cache_locks
    ADD CONSTRAINT cache_locks_pkey PRIMARY KEY (key);
 F   ALTER TABLE ONLY public.cache_locks DROP CONSTRAINT cache_locks_pkey;
       public            admin    false    216            �           2606    17170    cache cache_pkey 
   CONSTRAINT     O   ALTER TABLE ONLY public.cache
    ADD CONSTRAINT cache_pkey PRIMARY KEY (key);
 :   ALTER TABLE ONLY public.cache DROP CONSTRAINT cache_pkey;
       public            admin    false    215                       2606    17220 -   departement departement_id_departement_unique 
   CONSTRAINT     r   ALTER TABLE ONLY public.departement
    ADD CONSTRAINT departement_id_departement_unique UNIQUE (id_departement);
 W   ALTER TABLE ONLY public.departement DROP CONSTRAINT departement_id_departement_unique;
       public            admin    false    223            �           2606    17204    failed_jobs failed_jobs_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.failed_jobs DROP CONSTRAINT failed_jobs_pkey;
       public            admin    false    221                       2606    17206 #   failed_jobs failed_jobs_uuid_unique 
   CONSTRAINT     ^   ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_uuid_unique UNIQUE (uuid);
 M   ALTER TABLE ONLY public.failed_jobs DROP CONSTRAINT failed_jobs_uuid_unique;
       public            admin    false    221                       2606    17306    inventaris inventaris_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.inventaris
    ADD CONSTRAINT inventaris_pkey PRIMARY KEY (id_inventaris);
 D   ALTER TABLE ONLY public.inventaris DROP CONSTRAINT inventaris_pkey;
       public            admin    false    228                       2606    17277    jadwal jadwal_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.jadwal
    ADD CONSTRAINT jadwal_pkey PRIMARY KEY (id_jadwal);
 <   ALTER TABLE ONLY public.jadwal DROP CONSTRAINT jadwal_pkey;
       public            admin    false    227            �           2606    17194    job_batches job_batches_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.job_batches
    ADD CONSTRAINT job_batches_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.job_batches DROP CONSTRAINT job_batches_pkey;
       public            admin    false    219            �           2606    17186    jobs jobs_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.jobs
    ADD CONSTRAINT jobs_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.jobs DROP CONSTRAINT jobs_pkey;
       public            admin    false    218            �           2606    17136    migrations migrations_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.migrations DROP CONSTRAINT migrations_pkey;
       public            admin    false    210            �           2606    17154 0   password_reset_tokens password_reset_tokens_pkey 
   CONSTRAINT     q   ALTER TABLE ONLY public.password_reset_tokens
    ADD CONSTRAINT password_reset_tokens_pkey PRIMARY KEY (email);
 Z   ALTER TABLE ONLY public.password_reset_tokens DROP CONSTRAINT password_reset_tokens_pkey;
       public            admin    false    213                       2606    17260    pegawai pegawai_email_unique 
   CONSTRAINT     X   ALTER TABLE ONLY public.pegawai
    ADD CONSTRAINT pegawai_email_unique UNIQUE (email);
 F   ALTER TABLE ONLY public.pegawai DROP CONSTRAINT pegawai_email_unique;
       public            admin    false    226                       2606    17258    pegawai pegawai_nip_unique 
   CONSTRAINT     T   ALTER TABLE ONLY public.pegawai
    ADD CONSTRAINT pegawai_nip_unique UNIQUE (nip);
 D   ALTER TABLE ONLY public.pegawai DROP CONSTRAINT pegawai_nip_unique;
       public            admin    false    226                       2606    17256    pegawai pegawai_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.pegawai
    ADD CONSTRAINT pegawai_pkey PRIMARY KEY (id_pegawai);
 >   ALTER TABLE ONLY public.pegawai DROP CONSTRAINT pegawai_pkey;
       public            admin    false    226                       2606    17349 .   pemakaian_inventaris pemakaian_inventaris_pkey 
   CONSTRAINT     s   ALTER TABLE ONLY public.pemakaian_inventaris
    ADD CONSTRAINT pemakaian_inventaris_pkey PRIMARY KEY (id_pinjam);
 X   ALTER TABLE ONLY public.pemakaian_inventaris DROP CONSTRAINT pemakaian_inventaris_pkey;
       public            admin    false    232                       2606    17324 2   personal_access_tokens personal_access_tokens_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.personal_access_tokens DROP CONSTRAINT personal_access_tokens_pkey;
       public            admin    false    231                       2606    17327 :   personal_access_tokens personal_access_tokens_token_unique 
   CONSTRAINT     v   ALTER TABLE ONLY public.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_token_unique UNIQUE (token);
 d   ALTER TABLE ONLY public.personal_access_tokens DROP CONSTRAINT personal_access_tokens_token_unique;
       public            admin    false    231                        2606    17371 $   reservasi_ruang reservasi_ruang_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.reservasi_ruang
    ADD CONSTRAINT reservasi_ruang_pkey PRIMARY KEY (id_reservasi);
 N   ALTER TABLE ONLY public.reservasi_ruang DROP CONSTRAINT reservasi_ruang_pkey;
       public            admin    false    233            	           2606    17239    ruang ruang_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.ruang
    ADD CONSTRAINT ruang_pkey PRIMARY KEY (id_ruang);
 :   ALTER TABLE ONLY public.ruang DROP CONSTRAINT ruang_pkey;
       public            admin    false    225            �           2606    17161    sessions sessions_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.sessions DROP CONSTRAINT sessions_pkey;
       public            admin    false    214            "           2606    17383    surat_keluar surat_keluar_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.surat_keluar
    ADD CONSTRAINT surat_keluar_pkey PRIMARY KEY (id_surat_keluar);
 H   ALTER TABLE ONLY public.surat_keluar DROP CONSTRAINT surat_keluar_pkey;
       public            admin    false    234            $           2606    17395    surat_masuk surat_masuk_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.surat_masuk
    ADD CONSTRAINT surat_masuk_pkey PRIMARY KEY (id_surat_masuk);
 F   ALTER TABLE ONLY public.surat_masuk DROP CONSTRAINT surat_masuk_pkey;
       public            admin    false    235                       2606    17227    surat surat_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.surat
    ADD CONSTRAINT surat_pkey PRIMARY KEY (kode_surat);
 :   ALTER TABLE ONLY public.surat DROP CONSTRAINT surat_pkey;
       public            admin    false    224            &           2606    26423    tamu tamu_temp_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.tamu
    ADD CONSTRAINT tamu_temp_pkey PRIMARY KEY (id_tamu);
 =   ALTER TABLE ONLY public.tamu DROP CONSTRAINT tamu_temp_pkey;
       public            admin    false    236            �           2606    17147    users users_email_unique 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_unique UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_unique;
       public            admin    false    212            �           2606    17145    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            admin    false    212            �           1259    17187    jobs_queue_index    INDEX     B   CREATE INDEX jobs_queue_index ON public.jobs USING btree (queue);
 $   DROP INDEX public.jobs_queue_index;
       public            admin    false    218                       1259    17325 8   personal_access_tokens_tokenable_type_tokenable_id_index    INDEX     �   CREATE INDEX personal_access_tokens_tokenable_type_tokenable_id_index ON public.personal_access_tokens USING btree (tokenable_type, tokenable_id);
 L   DROP INDEX public.personal_access_tokens_tokenable_type_tokenable_id_index;
       public            admin    false    231    231            �           1259    17163    sessions_last_activity_index    INDEX     Z   CREATE INDEX sessions_last_activity_index ON public.sessions USING btree (last_activity);
 0   DROP INDEX public.sessions_last_activity_index;
       public            admin    false    214            �           1259    17162    sessions_user_id_index    INDEX     N   CREATE INDEX sessions_user_id_index ON public.sessions USING btree (user_id);
 *   DROP INDEX public.sessions_user_id_index;
       public            admin    false    214            ,           2606    17300 $   inventaris inventaris_cabang_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.inventaris
    ADD CONSTRAINT inventaris_cabang_foreign FOREIGN KEY (cabang) REFERENCES public.cabang(id_cabang) ON DELETE CASCADE;
 N   ALTER TABLE ONLY public.inventaris DROP CONSTRAINT inventaris_cabang_foreign;
       public          admin    false    3331    222    228            *           2606    17271    jadwal jadwal_cabang_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.jadwal
    ADD CONSTRAINT jadwal_cabang_foreign FOREIGN KEY (cabang) REFERENCES public.cabang(id_cabang) ON DELETE CASCADE;
 F   ALTER TABLE ONLY public.jadwal DROP CONSTRAINT jadwal_cabang_foreign;
       public          admin    false    227    222    3331            +           2606    17266    jadwal jadwal_status_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.jadwal
    ADD CONSTRAINT jadwal_status_foreign FOREIGN KEY (status) REFERENCES public.departement(id_departement) ON DELETE CASCADE;
 F   ALTER TABLE ONLY public.jadwal DROP CONSTRAINT jadwal_status_foreign;
       public          admin    false    227    223    3333            (           2606    17250    pegawai pegawai_cabang_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.pegawai
    ADD CONSTRAINT pegawai_cabang_foreign FOREIGN KEY (cabang) REFERENCES public.cabang(id_cabang) ON DELETE CASCADE;
 H   ALTER TABLE ONLY public.pegawai DROP CONSTRAINT pegawai_cabang_foreign;
       public          admin    false    226    222    3331            )           2606    17245 #   pegawai pegawai_departement_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.pegawai
    ADD CONSTRAINT pegawai_departement_foreign FOREIGN KEY (departement) REFERENCES public.departement(id_departement) ON DELETE CASCADE;
 M   ALTER TABLE ONLY public.pegawai DROP CONSTRAINT pegawai_departement_foreign;
       public          admin    false    223    226    3333            -           2606    17343 8   pemakaian_inventaris pemakaian_inventaris_cabang_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.pemakaian_inventaris
    ADD CONSTRAINT pemakaian_inventaris_cabang_foreign FOREIGN KEY (cabang) REFERENCES public.cabang(id_cabang) ON DELETE CASCADE;
 b   ALTER TABLE ONLY public.pemakaian_inventaris DROP CONSTRAINT pemakaian_inventaris_cabang_foreign;
       public          admin    false    222    3331    232            .           2606    17333 <   pemakaian_inventaris pemakaian_inventaris_inventaris_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.pemakaian_inventaris
    ADD CONSTRAINT pemakaian_inventaris_inventaris_foreign FOREIGN KEY (inventaris) REFERENCES public.inventaris(id_inventaris) ON DELETE CASCADE;
 f   ALTER TABLE ONLY public.pemakaian_inventaris DROP CONSTRAINT pemakaian_inventaris_inventaris_foreign;
       public          admin    false    232    228    3347            /           2606    17338 9   pemakaian_inventaris pemakaian_inventaris_pegawai_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.pemakaian_inventaris
    ADD CONSTRAINT pemakaian_inventaris_pegawai_foreign FOREIGN KEY (pegawai) REFERENCES public.pegawai(id_pegawai) ON DELETE CASCADE;
 c   ALTER TABLE ONLY public.pemakaian_inventaris DROP CONSTRAINT pemakaian_inventaris_pegawai_foreign;
       public          admin    false    226    232    3343            0           2606    17365 .   reservasi_ruang reservasi_ruang_cabang_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.reservasi_ruang
    ADD CONSTRAINT reservasi_ruang_cabang_foreign FOREIGN KEY (cabang) REFERENCES public.cabang(id_cabang) ON DELETE CASCADE;
 X   ALTER TABLE ONLY public.reservasi_ruang DROP CONSTRAINT reservasi_ruang_cabang_foreign;
       public          admin    false    3331    233    222            1           2606    17360 /   reservasi_ruang reservasi_ruang_pegawai_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.reservasi_ruang
    ADD CONSTRAINT reservasi_ruang_pegawai_foreign FOREIGN KEY (pegawai) REFERENCES public.pegawai(id_pegawai) ON DELETE CASCADE;
 Y   ALTER TABLE ONLY public.reservasi_ruang DROP CONSTRAINT reservasi_ruang_pegawai_foreign;
       public          admin    false    3343    233    226            2           2606    17355 -   reservasi_ruang reservasi_ruang_ruang_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.reservasi_ruang
    ADD CONSTRAINT reservasi_ruang_ruang_foreign FOREIGN KEY (ruang) REFERENCES public.ruang(id_ruang) ON DELETE CASCADE;
 W   ALTER TABLE ONLY public.reservasi_ruang DROP CONSTRAINT reservasi_ruang_ruang_foreign;
       public          admin    false    233    225    3337            '           2606    17233    ruang ruang_cabang_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.ruang
    ADD CONSTRAINT ruang_cabang_foreign FOREIGN KEY (cabang) REFERENCES public.cabang(id_cabang) ON DELETE CASCADE;
 D   ALTER TABLE ONLY public.ruang DROP CONSTRAINT ruang_cabang_foreign;
       public          admin    false    222    3331    225            3           2606    17377 (   surat_keluar surat_keluar_cabang_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.surat_keluar
    ADD CONSTRAINT surat_keluar_cabang_foreign FOREIGN KEY (cabang) REFERENCES public.cabang(id_cabang) ON DELETE CASCADE;
 R   ALTER TABLE ONLY public.surat_keluar DROP CONSTRAINT surat_keluar_cabang_foreign;
       public          admin    false    3331    222    234            4           2606    17389 &   surat_masuk surat_masuk_cabang_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.surat_masuk
    ADD CONSTRAINT surat_masuk_cabang_foreign FOREIGN KEY (cabang) REFERENCES public.cabang(id_cabang) ON DELETE CASCADE;
 P   ALTER TABLE ONLY public.surat_masuk DROP CONSTRAINT surat_masuk_cabang_foreign;
       public          admin    false    235    3331    222            5           2606    26417    tamu tamu_temp_cabang_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.tamu
    ADD CONSTRAINT tamu_temp_cabang_foreign FOREIGN KEY (cabang) REFERENCES public.cabang(id_cabang) ON DELETE CASCADE;
 G   ALTER TABLE ONLY public.tamu DROP CONSTRAINT tamu_temp_cabang_foreign;
       public          admin    false    222    3331    236            6           2606    26412 -   tamu tamu_temp_departement_dikunjungi_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.tamu
    ADD CONSTRAINT tamu_temp_departement_dikunjungi_foreign FOREIGN KEY (departement_dikunjungi) REFERENCES public.departement(id_departement) ON DELETE CASCADE;
 W   ALTER TABLE ONLY public.tamu DROP CONSTRAINT tamu_temp_departement_dikunjungi_foreign;
       public          admin    false    236    223    3333            �   �   x�EȻ�  ���kɅ� ��W��&�Mb��Hk0��;8���L��!W���܃�Oz�"| ��Rl�*��q8���m�aG�U����9F���C{�{G�˾���@�HA��%���F��Ʉ�e��f<r�4��b��6�()      �   E   x�svt200��L�/J���4202�50�50V00�21"lb\� }F�ީ)�E��*L��25����� ��      �   6   x�M6�pM����Hα��,�2�RJ�/J-K-R��4206Bcc�=... h��      �      x������ � �      �   Q   x�sq100�t+��+Qp�KQpI-K��/H-�4202�50�50V00�21�2��&��6È�)19��V���ĸb���� �v �      �      x������ � �      �   �   x�u�1�0���>E.d?Z���FXX*�J$���1TUy�����UD�`���_�1��q�s��  �1�wє���j�_;t}}V�Gi�X$�d�h�	��(����}f�Wl��X:�d����3 ��3�      �   �   x���=�0@��Wdr�\�����"T*�(]2�R����)qP��@���ruu`	.S�R`��N��Fߴ������MQ��8���G5�V3�����4�c^��hel�B�{o,-�!(VS�rB<*#!������g�]���no�X$�
1o^��	)�,�|H�_�%:��,E!�H�$��d���      �      x������ � �      �      x������ � �      �     x�uQ�n�0}63����d�X
����:h�u���s�o�J)�#�:'�	/����$��~�)����0�Sx]�W�0ܲh6���,6�%`N���6��n	Y�C�'pX��K5��2��MB\ k�r�)�Q6q�9���2v�Ӱ3>Mр��ll
砕.H�Te}ڰF_[s׉��,�ؗ1X��(�yd����%h$'�J;{���X�և[�L�]Jנ��L�aL�� ~��lt������G�ew2�9      �      x������ � �      �   �  x���Oo�0�s��J�8�F'��KUPjE�觟��rؒ>I����8.�2�V� �艦�ۏ��r�f�b��.:we�-�d+?�[�K+�sT��&�ꤤ^���,�{��CL����p{�C�z��UE���*PW���U�go A�<A�	��U3n�R����:޺���}�H���a�g�?�ɡ��8��p�������×�y��_����Eْ����k�nz��^�F?��Ϗzt�E:��p[Yy��03�?D���'���%��^$���~O_m�66ja?�u7��b�NÞ�ٗG6A��Z8�҇�q�%�cb<.J�ψ�痀�RV���G�p���(h�N�,��Pk넙(����      �   �   x��400���QFF&���
�V �"fhe3�1\�A��Rs2�S�r�9��P�2Q00�26�22�&� ����0+�Ō� �7��.��*�KO��f�������61���ۍȴ��v#t�,��W�  N"      �      x������ � �      �   �   x����
�0����}�I���m*� ŋ�2ғ���a#�J(?����
�M�A@�¶����k�G�;����h�)��l�ה��]��^u8�w�k�D��H�RB��_�`�"q"q��KnEB�_}@�Z��H�Rº�*�ĳyl�1�~v�      �   k   x�200�*M�KW�MM-�Ҏ�ΎN a##]s]cC+SC+cclb\AFhf8�0������c43"!fa�7��&2�͌(f[�b����� H�=%      �      x������ � �      �   6   x�30�.-J,Q�N-(-)-N��4202�50�50V00�21�21�&����� vz      �      x������ � �      �      x������ � �      �   �   x�}�M
�0�ur�\�2I*-�56��B�,�J��J��7A��a`��c>�p"@�Tp�AAZ�_C �Cw�3;ރG����!��mj��N��pd���a<O7/�{�yȮ�?�$�x��lFmԉ��4�N�t�+:�.�\���e�����eN/      �      x������ � �     