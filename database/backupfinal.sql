PGDMP                      |            administrasikantor "   14.12 (Ubuntu 14.12-1.pgdg22.04+1)     16.3 (Ubuntu 16.3-1.pgdg22.04+1) �    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
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
                postgres    false            �            1259    27322    admin    TABLE     �  CREATE TABLE public.admin (
    id_admin character varying(255) NOT NULL,
    nama character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    no_hp character varying(255) NOT NULL,
    jenkel character varying(255),
    foto character varying(255),
    status character varying(255),
    remember_token character varying(100),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
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
       public          admin    false    4    221            �           0    0    failed_jobs_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.failed_jobs_id_seq OWNED BY public.failed_jobs.id;
          public          admin    false    220            �            1259    17295 
   inventaris    TABLE       CREATE TABLE public.inventaris (
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
    updated_at timestamp(0) without time zone,
    foto character varying(255)
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
       public          admin    false    4    218            �           0    0    jobs_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.jobs_id_seq OWNED BY public.jobs.id;
          public          admin    false    217            �            1259    26960    kategori    TABLE     �   CREATE TABLE public.kategori (
    id_kategori character varying(255) NOT NULL,
    nama_kategori character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
    DROP TABLE public.kategori;
       public         heap    admin    false    4            �            1259    17131 
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
       public          admin    false    210    4            �           0    0    migrations_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;
          public          admin    false    209            �            1259    27398    nomor_surat    TABLE     �   CREATE TABLE public.nomor_surat (
    id bigint NOT NULL,
    format character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
    DROP TABLE public.nomor_surat;
       public         heap    admin    false    4            �            1259    27397    nomor_surat_id_seq    SEQUENCE     {   CREATE SEQUENCE public.nomor_surat_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.nomor_surat_id_seq;
       public          admin    false    240    4            �           0    0    nomor_surat_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.nomor_surat_id_seq OWNED BY public.nomor_surat.id;
          public          admin    false    239            �            1259    17148    password_reset_tokens    TABLE     �   CREATE TABLE public.password_reset_tokens (
    email character varying(255) NOT NULL,
    token character varying(255) NOT NULL,
    created_at timestamp(0) without time zone
);
 )   DROP TABLE public.password_reset_tokens;
       public         heap    admin    false    4            �            1259    17240    pegawai    TABLE     �  CREATE TABLE public.pegawai (
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
    updated_at timestamp(0) without time zone,
    jenkel character varying(255),
    foto character varying(255),
    status character varying(255)
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
       public          admin    false    4    230                        0    0    personal_access_tokens_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.personal_access_tokens_id_seq OWNED BY public.personal_access_tokens.id;
          public          admin    false    229            �            1259    26967 
   perusahaan    TABLE     �   CREATE TABLE public.perusahaan (
    kode_perusahaan character varying(255) NOT NULL,
    nama_perusahaan character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
    DROP TABLE public.perusahaan;
       public         heap    admin    false    4            �            1259    17350    reservasi_ruang    TABLE       CREATE TABLE public.reservasi_ruang (
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
       public         heap    admin    false    4            �            1259    17228    ruang    TABLE     '  CREATE TABLE public.ruang (
    id_ruang character varying(255) NOT NULL,
    nama_ruang character varying(255) NOT NULL,
    cabang character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    foto character varying(255)
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
       public         heap    admin    false    4            �            1259    17221    surat    TABLE       CREATE TABLE public.surat (
    kode_surat character varying(255) NOT NULL,
    jenis_surat character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    prefix_surat character varying(255)
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
    tanggal_terima date NOT NULL,
    asal_surat character varying(255) NOT NULL,
    perihal character varying(255) NOT NULL,
    cabang character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    foto character varying(255)
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
       public          admin    false    4    212                       0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public          admin    false    211            �           2604    17199    failed_jobs id    DEFAULT     p   ALTER TABLE ONLY public.failed_jobs ALTER COLUMN id SET DEFAULT nextval('public.failed_jobs_id_seq'::regclass);
 =   ALTER TABLE public.failed_jobs ALTER COLUMN id DROP DEFAULT;
       public          admin    false    220    221    221            �           2604    17182    jobs id    DEFAULT     b   ALTER TABLE ONLY public.jobs ALTER COLUMN id SET DEFAULT nextval('public.jobs_id_seq'::regclass);
 6   ALTER TABLE public.jobs ALTER COLUMN id DROP DEFAULT;
       public          admin    false    218    217    218            �           2604    17134    migrations id    DEFAULT     n   ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);
 <   ALTER TABLE public.migrations ALTER COLUMN id DROP DEFAULT;
       public          admin    false    210    209    210            �           2604    27401    nomor_surat id    DEFAULT     p   ALTER TABLE ONLY public.nomor_surat ALTER COLUMN id SET DEFAULT nextval('public.nomor_surat_id_seq'::regclass);
 =   ALTER TABLE public.nomor_surat ALTER COLUMN id DROP DEFAULT;
       public          admin    false    240    239    240            �           2604    17320    personal_access_tokens id    DEFAULT     �   ALTER TABLE ONLY public.personal_access_tokens ALTER COLUMN id SET DEFAULT nextval('public.personal_access_tokens_id_seq'::regclass);
 H   ALTER TABLE public.personal_access_tokens ALTER COLUMN id DROP DEFAULT;
       public          admin    false    230    229    230            �           2604    17141    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          admin    false    212    211    212            �          0    27322    admin 
   TABLE DATA           �   COPY public.admin (id_admin, nama, email, password, no_hp, jenkel, foto, status, remember_token, created_at, updated_at) FROM stdin;
    public          admin    false    238   ^�       �          0    17207    cabang 
   TABLE DATA           P   COPY public.cabang (id_cabang, nama_cabang, created_at, updated_at) FROM stdin;
    public          admin    false    222   �       �          0    17164    cache 
   TABLE DATA           7   COPY public.cache (key, value, expiration) FROM stdin;
    public          admin    false    215   n�       �          0    17171    cache_locks 
   TABLE DATA           =   COPY public.cache_locks (key, owner, expiration) FROM stdin;
    public          admin    false    216   q�       �          0    17214    departement 
   TABLE DATA           _   COPY public.departement (id_departement, nama_departement, created_at, updated_at) FROM stdin;
    public          admin    false    223   ��       �          0    17196    failed_jobs 
   TABLE DATA           a   COPY public.failed_jobs (id, uuid, connection, queue, payload, exception, failed_at) FROM stdin;
    public          admin    false    221   �       �          0    17295 
   inventaris 
   TABLE DATA           �   COPY public.inventaris (id_inventaris, nopol, merek, kategori, tahun, pajak, masa_pajak, harga_beli, tanggal_beli, cabang, created_at, updated_at, foto) FROM stdin;
    public          admin    false    228   �       �          0    17261    jadwal 
   TABLE DATA           d   COPY public.jadwal (id_jadwal, tanggal, status, agenda, cabang, created_at, updated_at) FROM stdin;
    public          admin    false    227   �       �          0    17188    job_batches 
   TABLE DATA           �   COPY public.job_batches (id, name, total_jobs, pending_jobs, failed_jobs, failed_job_ids, options, cancelled_at, created_at, finished_at) FROM stdin;
    public          admin    false    219   ��       �          0    17179    jobs 
   TABLE DATA           c   COPY public.jobs (id, queue, payload, attempts, reserved_at, available_at, created_at) FROM stdin;
    public          admin    false    218   ν       �          0    26960    kategori 
   TABLE DATA           V   COPY public.kategori (id_kategori, nama_kategori, created_at, updated_at) FROM stdin;
    public          admin    false    236   �       �          0    17131 
   migrations 
   TABLE DATA           :   COPY public.migrations (id, migration, batch) FROM stdin;
    public          admin    false    210   $�       �          0    27398    nomor_surat 
   TABLE DATA           I   COPY public.nomor_surat (id, format, created_at, updated_at) FROM stdin;
    public          admin    false    240   p�       �          0    17148    password_reset_tokens 
   TABLE DATA           I   COPY public.password_reset_tokens (email, token, created_at) FROM stdin;
    public          admin    false    213   �       �          0    17240    pegawai 
   TABLE DATA           �   COPY public.pegawai (id_pegawai, nip, nama, email, password, departement, alamat, no_hp, cabang, remember_token, created_at, updated_at, jenkel, foto, status) FROM stdin;
    public          admin    false    226   �       �          0    17328    pemakaian_inventaris 
   TABLE DATA           �   COPY public.pemakaian_inventaris (id_pinjam, inventaris, tanggal_pinjam, tanggal_kembali, durasi_pinjam, pegawai, keterangan, cabang, created_at, updated_at) FROM stdin;
    public          admin    false    231   ��       �          0    17317    personal_access_tokens 
   TABLE DATA           �   COPY public.personal_access_tokens (id, tokenable_type, tokenable_id, name, token, abilities, last_used_at, expires_at, created_at, updated_at) FROM stdin;
    public          admin    false    230   ��       �          0    26967 
   perusahaan 
   TABLE DATA           ^   COPY public.perusahaan (kode_perusahaan, nama_perusahaan, created_at, updated_at) FROM stdin;
    public          admin    false    237   ��       �          0    17350    reservasi_ruang 
   TABLE DATA           �   COPY public.reservasi_ruang (id_reservasi, ruang, tanggal_reservasi, tanggal_selesai, durasi, pegawai, keterangan, cabang, created_at, updated_at) FROM stdin;
    public          admin    false    232   ��       �          0    17228    ruang 
   TABLE DATA           [   COPY public.ruang (id_ruang, nama_ruang, cabang, created_at, updated_at, foto) FROM stdin;
    public          admin    false    225   ��       �          0    17155    sessions 
   TABLE DATA           _   COPY public.sessions (id, user_id, ip_address, user_agent, payload, last_activity) FROM stdin;
    public          admin    false    214   &�       �          0    17221    surat 
   TABLE DATA           ^   COPY public.surat (kode_surat, jenis_surat, created_at, updated_at, prefix_surat) FROM stdin;
    public          admin    false    224   C�       �          0    17372    surat_keluar 
   TABLE DATA           �   COPY public.surat_keluar (id_surat_keluar, nomor_surat, tanggal_surat, tanggal_kirim, tujuan_surat, perihal, cabang, created_at, updated_at) FROM stdin;
    public          admin    false    233   ��       �          0    17384    surat_masuk 
   TABLE DATA           �   COPY public.surat_masuk (id_surat_masuk, nomor_surat, tanggal_terima, asal_surat, perihal, cabang, created_at, updated_at, foto) FROM stdin;
    public          admin    false    234   @�       �          0    26407    tamu 
   TABLE DATA           �   COPY public.tamu (id_tamu, tanggal_kunjungan, nama, jabatan, no_hp, departement_dikunjungi, org_dikunjungi, keperluan, cabang, created_at, updated_at) FROM stdin;
    public          admin    false    235   !�       �          0    17138    users 
   TABLE DATA           u   COPY public.users (id, name, email, email_verified_at, password, remember_token, created_at, updated_at) FROM stdin;
    public          admin    false    212   ��                  0    0    failed_jobs_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.failed_jobs_id_seq', 1, false);
          public          admin    false    220                       0    0    jobs_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.jobs_id_seq', 1, false);
          public          admin    false    217                       0    0    migrations_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.migrations_id_seq', 25, true);
          public          admin    false    209                       0    0    nomor_surat_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.nomor_surat_id_seq', 1, true);
          public          admin    false    239                       0    0    personal_access_tokens_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.personal_access_tokens_id_seq', 1, false);
          public          admin    false    229                       0    0    users_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.users_id_seq', 1, false);
          public          admin    false    211            6           2606    27330 #   admin admin_palingbaru_email_unique 
   CONSTRAINT     _   ALTER TABLE ONLY public.admin
    ADD CONSTRAINT admin_palingbaru_email_unique UNIQUE (email);
 M   ALTER TABLE ONLY public.admin DROP CONSTRAINT admin_palingbaru_email_unique;
       public            admin    false    238            8           2606    27328    admin admin_palingbaru_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.admin
    ADD CONSTRAINT admin_palingbaru_pkey PRIMARY KEY (id_admin);
 E   ALTER TABLE ONLY public.admin DROP CONSTRAINT admin_palingbaru_pkey;
       public            admin    false    238                       2606    17213    cabang cabang_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.cabang
    ADD CONSTRAINT cabang_pkey PRIMARY KEY (id_cabang);
 <   ALTER TABLE ONLY public.cabang DROP CONSTRAINT cabang_pkey;
       public            admin    false    222                       2606    17177    cache_locks cache_locks_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.cache_locks
    ADD CONSTRAINT cache_locks_pkey PRIMARY KEY (key);
 F   ALTER TABLE ONLY public.cache_locks DROP CONSTRAINT cache_locks_pkey;
       public            admin    false    216                       2606    17170    cache cache_pkey 
   CONSTRAINT     O   ALTER TABLE ONLY public.cache
    ADD CONSTRAINT cache_pkey PRIMARY KEY (key);
 :   ALTER TABLE ONLY public.cache DROP CONSTRAINT cache_pkey;
       public            admin    false    215                       2606    17220 -   departement departement_id_departement_unique 
   CONSTRAINT     r   ALTER TABLE ONLY public.departement
    ADD CONSTRAINT departement_id_departement_unique UNIQUE (id_departement);
 W   ALTER TABLE ONLY public.departement DROP CONSTRAINT departement_id_departement_unique;
       public            admin    false    223                       2606    17204    failed_jobs failed_jobs_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.failed_jobs DROP CONSTRAINT failed_jobs_pkey;
       public            admin    false    221                       2606    17206 #   failed_jobs failed_jobs_uuid_unique 
   CONSTRAINT     ^   ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_uuid_unique UNIQUE (uuid);
 M   ALTER TABLE ONLY public.failed_jobs DROP CONSTRAINT failed_jobs_uuid_unique;
       public            admin    false    221            !           2606    17306    inventaris inventaris_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.inventaris
    ADD CONSTRAINT inventaris_pkey PRIMARY KEY (id_inventaris);
 D   ALTER TABLE ONLY public.inventaris DROP CONSTRAINT inventaris_pkey;
       public            admin    false    228                       2606    17277    jadwal jadwal_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.jadwal
    ADD CONSTRAINT jadwal_pkey PRIMARY KEY (id_jadwal);
 <   ALTER TABLE ONLY public.jadwal DROP CONSTRAINT jadwal_pkey;
       public            admin    false    227                       2606    17194    job_batches job_batches_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.job_batches
    ADD CONSTRAINT job_batches_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.job_batches DROP CONSTRAINT job_batches_pkey;
       public            admin    false    219                       2606    17186    jobs jobs_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.jobs
    ADD CONSTRAINT jobs_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.jobs DROP CONSTRAINT jobs_pkey;
       public            admin    false    218            2           2606    26966    kategori kategori_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.kategori
    ADD CONSTRAINT kategori_pkey PRIMARY KEY (id_kategori);
 @   ALTER TABLE ONLY public.kategori DROP CONSTRAINT kategori_pkey;
       public            admin    false    236            �           2606    17136    migrations migrations_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.migrations DROP CONSTRAINT migrations_pkey;
       public            admin    false    210            :           2606    27403    nomor_surat nomor_surat_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.nomor_surat
    ADD CONSTRAINT nomor_surat_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.nomor_surat DROP CONSTRAINT nomor_surat_pkey;
       public            admin    false    240            �           2606    17154 0   password_reset_tokens password_reset_tokens_pkey 
   CONSTRAINT     q   ALTER TABLE ONLY public.password_reset_tokens
    ADD CONSTRAINT password_reset_tokens_pkey PRIMARY KEY (email);
 Z   ALTER TABLE ONLY public.password_reset_tokens DROP CONSTRAINT password_reset_tokens_pkey;
       public            admin    false    213                       2606    17260    pegawai pegawai_email_unique 
   CONSTRAINT     X   ALTER TABLE ONLY public.pegawai
    ADD CONSTRAINT pegawai_email_unique UNIQUE (email);
 F   ALTER TABLE ONLY public.pegawai DROP CONSTRAINT pegawai_email_unique;
       public            admin    false    226                       2606    17258    pegawai pegawai_nip_unique 
   CONSTRAINT     T   ALTER TABLE ONLY public.pegawai
    ADD CONSTRAINT pegawai_nip_unique UNIQUE (nip);
 D   ALTER TABLE ONLY public.pegawai DROP CONSTRAINT pegawai_nip_unique;
       public            admin    false    226                       2606    17256    pegawai pegawai_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.pegawai
    ADD CONSTRAINT pegawai_pkey PRIMARY KEY (id_pegawai);
 >   ALTER TABLE ONLY public.pegawai DROP CONSTRAINT pegawai_pkey;
       public            admin    false    226            (           2606    17349 .   pemakaian_inventaris pemakaian_inventaris_pkey 
   CONSTRAINT     s   ALTER TABLE ONLY public.pemakaian_inventaris
    ADD CONSTRAINT pemakaian_inventaris_pkey PRIMARY KEY (id_pinjam);
 X   ALTER TABLE ONLY public.pemakaian_inventaris DROP CONSTRAINT pemakaian_inventaris_pkey;
       public            admin    false    231            #           2606    17324 2   personal_access_tokens personal_access_tokens_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.personal_access_tokens DROP CONSTRAINT personal_access_tokens_pkey;
       public            admin    false    230            %           2606    17327 :   personal_access_tokens personal_access_tokens_token_unique 
   CONSTRAINT     v   ALTER TABLE ONLY public.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_token_unique UNIQUE (token);
 d   ALTER TABLE ONLY public.personal_access_tokens DROP CONSTRAINT personal_access_tokens_token_unique;
       public            admin    false    230            4           2606    26973    perusahaan perusahaan_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public.perusahaan
    ADD CONSTRAINT perusahaan_pkey PRIMARY KEY (kode_perusahaan);
 D   ALTER TABLE ONLY public.perusahaan DROP CONSTRAINT perusahaan_pkey;
       public            admin    false    237            *           2606    17371 $   reservasi_ruang reservasi_ruang_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.reservasi_ruang
    ADD CONSTRAINT reservasi_ruang_pkey PRIMARY KEY (id_reservasi);
 N   ALTER TABLE ONLY public.reservasi_ruang DROP CONSTRAINT reservasi_ruang_pkey;
       public            admin    false    232                       2606    17239    ruang ruang_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.ruang
    ADD CONSTRAINT ruang_pkey PRIMARY KEY (id_ruang);
 :   ALTER TABLE ONLY public.ruang DROP CONSTRAINT ruang_pkey;
       public            admin    false    225                       2606    17161    sessions sessions_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.sessions DROP CONSTRAINT sessions_pkey;
       public            admin    false    214            ,           2606    17383    surat_keluar surat_keluar_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.surat_keluar
    ADD CONSTRAINT surat_keluar_pkey PRIMARY KEY (id_surat_keluar);
 H   ALTER TABLE ONLY public.surat_keluar DROP CONSTRAINT surat_keluar_pkey;
       public            admin    false    233            .           2606    17395    surat_masuk surat_masuk_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.surat_masuk
    ADD CONSTRAINT surat_masuk_pkey PRIMARY KEY (id_surat_masuk);
 F   ALTER TABLE ONLY public.surat_masuk DROP CONSTRAINT surat_masuk_pkey;
       public            admin    false    234                       2606    17227    surat surat_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.surat
    ADD CONSTRAINT surat_pkey PRIMARY KEY (kode_surat);
 :   ALTER TABLE ONLY public.surat DROP CONSTRAINT surat_pkey;
       public            admin    false    224            0           2606    26423    tamu tamu_temp_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.tamu
    ADD CONSTRAINT tamu_temp_pkey PRIMARY KEY (id_tamu);
 =   ALTER TABLE ONLY public.tamu DROP CONSTRAINT tamu_temp_pkey;
       public            admin    false    235            �           2606    17147    users users_email_unique 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_unique UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_unique;
       public            admin    false    212            �           2606    17145    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            admin    false    212            	           1259    17187    jobs_queue_index    INDEX     B   CREATE INDEX jobs_queue_index ON public.jobs USING btree (queue);
 $   DROP INDEX public.jobs_queue_index;
       public            admin    false    218            &           1259    17325 8   personal_access_tokens_tokenable_type_tokenable_id_index    INDEX     �   CREATE INDEX personal_access_tokens_tokenable_type_tokenable_id_index ON public.personal_access_tokens USING btree (tokenable_type, tokenable_id);
 L   DROP INDEX public.personal_access_tokens_tokenable_type_tokenable_id_index;
       public            admin    false    230    230            �           1259    17163    sessions_last_activity_index    INDEX     Z   CREATE INDEX sessions_last_activity_index ON public.sessions USING btree (last_activity);
 0   DROP INDEX public.sessions_last_activity_index;
       public            admin    false    214                       1259    17162    sessions_user_id_index    INDEX     N   CREATE INDEX sessions_user_id_index ON public.sessions USING btree (user_id);
 *   DROP INDEX public.sessions_user_id_index;
       public            admin    false    214            @           2606    17300 $   inventaris inventaris_cabang_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.inventaris
    ADD CONSTRAINT inventaris_cabang_foreign FOREIGN KEY (cabang) REFERENCES public.cabang(id_cabang) ON DELETE CASCADE;
 N   ALTER TABLE ONLY public.inventaris DROP CONSTRAINT inventaris_cabang_foreign;
       public          admin    false    3345    222    228            >           2606    17271    jadwal jadwal_cabang_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.jadwal
    ADD CONSTRAINT jadwal_cabang_foreign FOREIGN KEY (cabang) REFERENCES public.cabang(id_cabang) ON DELETE CASCADE;
 F   ALTER TABLE ONLY public.jadwal DROP CONSTRAINT jadwal_cabang_foreign;
       public          admin    false    227    3345    222            ?           2606    17266    jadwal jadwal_status_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.jadwal
    ADD CONSTRAINT jadwal_status_foreign FOREIGN KEY (status) REFERENCES public.departement(id_departement) ON DELETE CASCADE;
 F   ALTER TABLE ONLY public.jadwal DROP CONSTRAINT jadwal_status_foreign;
       public          admin    false    227    223    3347            <           2606    17250    pegawai pegawai_cabang_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.pegawai
    ADD CONSTRAINT pegawai_cabang_foreign FOREIGN KEY (cabang) REFERENCES public.cabang(id_cabang) ON DELETE CASCADE;
 H   ALTER TABLE ONLY public.pegawai DROP CONSTRAINT pegawai_cabang_foreign;
       public          admin    false    3345    222    226            =           2606    17245 #   pegawai pegawai_departement_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.pegawai
    ADD CONSTRAINT pegawai_departement_foreign FOREIGN KEY (departement) REFERENCES public.departement(id_departement) ON DELETE CASCADE;
 M   ALTER TABLE ONLY public.pegawai DROP CONSTRAINT pegawai_departement_foreign;
       public          admin    false    226    3347    223            A           2606    17343 8   pemakaian_inventaris pemakaian_inventaris_cabang_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.pemakaian_inventaris
    ADD CONSTRAINT pemakaian_inventaris_cabang_foreign FOREIGN KEY (cabang) REFERENCES public.cabang(id_cabang) ON DELETE CASCADE;
 b   ALTER TABLE ONLY public.pemakaian_inventaris DROP CONSTRAINT pemakaian_inventaris_cabang_foreign;
       public          admin    false    3345    231    222            B           2606    17333 <   pemakaian_inventaris pemakaian_inventaris_inventaris_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.pemakaian_inventaris
    ADD CONSTRAINT pemakaian_inventaris_inventaris_foreign FOREIGN KEY (inventaris) REFERENCES public.inventaris(id_inventaris) ON DELETE CASCADE;
 f   ALTER TABLE ONLY public.pemakaian_inventaris DROP CONSTRAINT pemakaian_inventaris_inventaris_foreign;
       public          admin    false    228    231    3361            C           2606    17338 9   pemakaian_inventaris pemakaian_inventaris_pegawai_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.pemakaian_inventaris
    ADD CONSTRAINT pemakaian_inventaris_pegawai_foreign FOREIGN KEY (pegawai) REFERENCES public.pegawai(id_pegawai) ON DELETE CASCADE;
 c   ALTER TABLE ONLY public.pemakaian_inventaris DROP CONSTRAINT pemakaian_inventaris_pegawai_foreign;
       public          admin    false    231    3357    226            D           2606    17365 .   reservasi_ruang reservasi_ruang_cabang_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.reservasi_ruang
    ADD CONSTRAINT reservasi_ruang_cabang_foreign FOREIGN KEY (cabang) REFERENCES public.cabang(id_cabang) ON DELETE CASCADE;
 X   ALTER TABLE ONLY public.reservasi_ruang DROP CONSTRAINT reservasi_ruang_cabang_foreign;
       public          admin    false    232    3345    222            E           2606    17360 /   reservasi_ruang reservasi_ruang_pegawai_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.reservasi_ruang
    ADD CONSTRAINT reservasi_ruang_pegawai_foreign FOREIGN KEY (pegawai) REFERENCES public.pegawai(id_pegawai) ON DELETE CASCADE;
 Y   ALTER TABLE ONLY public.reservasi_ruang DROP CONSTRAINT reservasi_ruang_pegawai_foreign;
       public          admin    false    232    3357    226            F           2606    17355 -   reservasi_ruang reservasi_ruang_ruang_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.reservasi_ruang
    ADD CONSTRAINT reservasi_ruang_ruang_foreign FOREIGN KEY (ruang) REFERENCES public.ruang(id_ruang) ON DELETE CASCADE;
 W   ALTER TABLE ONLY public.reservasi_ruang DROP CONSTRAINT reservasi_ruang_ruang_foreign;
       public          admin    false    225    3351    232            ;           2606    17233    ruang ruang_cabang_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.ruang
    ADD CONSTRAINT ruang_cabang_foreign FOREIGN KEY (cabang) REFERENCES public.cabang(id_cabang) ON DELETE CASCADE;
 D   ALTER TABLE ONLY public.ruang DROP CONSTRAINT ruang_cabang_foreign;
       public          admin    false    222    3345    225            G           2606    17377 (   surat_keluar surat_keluar_cabang_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.surat_keluar
    ADD CONSTRAINT surat_keluar_cabang_foreign FOREIGN KEY (cabang) REFERENCES public.cabang(id_cabang) ON DELETE CASCADE;
 R   ALTER TABLE ONLY public.surat_keluar DROP CONSTRAINT surat_keluar_cabang_foreign;
       public          admin    false    3345    222    233            H           2606    17389 &   surat_masuk surat_masuk_cabang_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.surat_masuk
    ADD CONSTRAINT surat_masuk_cabang_foreign FOREIGN KEY (cabang) REFERENCES public.cabang(id_cabang) ON DELETE CASCADE;
 P   ALTER TABLE ONLY public.surat_masuk DROP CONSTRAINT surat_masuk_cabang_foreign;
       public          admin    false    234    222    3345            I           2606    26417    tamu tamu_temp_cabang_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.tamu
    ADD CONSTRAINT tamu_temp_cabang_foreign FOREIGN KEY (cabang) REFERENCES public.cabang(id_cabang) ON DELETE CASCADE;
 G   ALTER TABLE ONLY public.tamu DROP CONSTRAINT tamu_temp_cabang_foreign;
       public          admin    false    222    3345    235            J           2606    26412 -   tamu tamu_temp_departement_dikunjungi_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.tamu
    ADD CONSTRAINT tamu_temp_departement_dikunjungi_foreign FOREIGN KEY (departement_dikunjungi) REFERENCES public.departement(id_departement) ON DELETE CASCADE;
 W   ALTER TABLE ONLY public.tamu DROP CONSTRAINT tamu_temp_departement_dikunjungi_foreign;
       public          admin    false    235    3347    223            �   �  x�m�Is�@ �s�+<x��f=�%"���t��(H�E��C���T��{U���STB�Y�֯$�3^20����N���cG�[�NK#�P�l���*x�S��P1��m��KV<�ߪ�,�xA��98�� fs4h@��]��k�V��<��5ˤI���i�.�"O@p���, ����8��J2�d����!췁�A�#�[^-dO��H����f�,)����7���h拈_��=XTʆN9�GK�F�nT�����BY8��p��s�9e�4��;�pm�c�!�	'��!$2e�?��]#�ޭ��[�G�}��6���#}WJ��n���Z'����}�G��o���s�**����hV�`��������˧V�����ۮC��cQ�ZP�� IF�+ʘ^��`����[      �   O   x�svt200��NM�,��4202�50�50V00�21�25�&���e�����X��������L�������ؒ+F��� ��
      �   �  x�u���H�s�c�LԾ��P7PA���**↨O?�����P���g��턅��8?��_��?W��|��������!ԛ�����7{�9P00�2L��aNĻM{0QA���W�_��o.�۪2= W
J�ܖ��)������=m�S(��:�����zƑ��RD1�ݲ|�gzg�.�
��8��o��c����Mz#��A��!��ׂ����;3E�p�V�Y���hF���h/�a�.�՟ ���L�"���)�{)�th��c�

�S��G���u�_E�0�@صMB��!�^kqZ�)�P�;�"&�%V����J ��K��s9e/'~�����c6x�x����/J!����vf��w�(��傃O3��q�/�_���/���a������؟��B���f�x�WE�F�s3S�{�x,�/^�mR���['�YO�JN(�x�9�O3�����:�$z�ɢ�E	�`c�'���G����L��`L7���x�����g�j���٢�C���OSd�K9�}�F-�-E�wf��pJ��谥�q��(�e\ OO9I�tk%3�] A�r��3�z��~P�(hW�I��P��F#�4Ru��p��fQ�}v�&5S�0���ﭚe�sa��A�'J��$���ɋUe�*].E;��6}���/2S�'���'������n̔R	��Z,6���o"Lt*p�EQ<ӕ�m�p��"��㤰�n���XOccB�~�~�����>�W���IEA�ټ�RYA���x�	"������d�{�c�رX�+ӕe��MVy��r1�-�9����ۚ��}z�F��j���X�\���G����X�z��Y|��Ю��te�7S�8��ur3�.��o�e�XM�q�qs'T�&��6�A��rW���Y9��84R����4u.�g_zU�7f*�����l*�}��3:��'��p6m�髟�N���D���Ag[������$/e��Tw�3�U8����I���L���_T8�/2��889�c��f��v#����b}����w �ty	weE'���������Ԯy���{��}��J�SCϊzպ�w��4�nR/z�F�,�����X�Fʐ�9�lD}� �r?Ŧ�H�9��q��N����yk
"���:2*_��|j��˳�ϳ�b�c =8��ή�fU���?(b
�����H}��z[Ži'�C9S�VO�?���m���4�5�N�[U�>�RI
3SoiJ���p�ų�;��7����b%��>'}�0��u00�M�R �c��q4���~jZ�$V����~W�M����=��H��E�9�WV���5u�T��s�B�k�����n*�?���5<W�%O��=#�7<���� ���l�����|�r�d�Z��q?C5�?���ϟ<Yb�bkڵ��,��ä�y�\w����R���[RΤ^���pn��5��yf�B�̒`��g"m�
WM����R\2���� �?h���      �      x������ � �      �   Q   x�sq100�t+��+Qp�KQpI-K��/H-�4202�50�50V00�21�2��&��6È�)19��V���ĸb���� �v �      �      x������ � �      �   �   x��л
�0����)��sK��Z�Q�.E� }L��P+�)��|9Ymw�{��j�,�۱6�naӴ���sAİ��ĩ��+4�ڼ(�e�h�y�b���4U�/���*��y���?�5�yHY'Y���$v�z^�8w��3�=\���e�g@,j�0�3�Ƴ��m����1�e���Cq�M�>���$I� �e
      �   �   x���=�0@��Wdr�\�����"T*�(]2�R����)qP��@���ruu`	.S�R`��N��Fߴ������MQ��8���G5�V3�����4�c^��hel�B�{o,-�!(VS�rB<*#!������g�]���no�X$�
1o^��	)�,�|H�_�%:��,E!�H�$��d���      �      x������ � �      �      x������ � �      �   )   x��v100���O����".o��P�$�*���� �-
�      �   <  x�uQ[�� �6�Ya�ٻ����JhRAh���MZ��E�xf��1���v��^x��`V����C����~�����.<-���0ܱ�lϫ]\�+����~�Yܚ�5`iBLu7�����S-`m.2��mF s�����M?��?Q<��7�m�[��q�.� M���#�u��1\R��K���%�D�I�;,Sk�<�e���
����+��}��hKk�sd��P���!N9۾�}�UKu�v��)<@��fX��B����b���A��K�>B���5Ԋ��rr�FQ������d�6n������u��      �   i   x�3���OI�/.-J,�ի����/���p�pԫ�L�OI-H,*I�M�+�կ.(JMˬ�*֯N*�I��%��y��1~�FF&���&
�V&fV��\1z\\\ �|"�      �      x������ � �      �   �  x���Ϗ�0������U(m�ӂ���"��\PP�A������D��{M�Ҥ��~m�!�2���w���؟���>����S�BeK@�Sf�j��y�&}Χ�s�I�Cvw���v�x�󹲗�x|��=���<�{Ys�E�,>��� >�����Ԇ�	E�ҩ��G�aW50�7�T~�X=j��5��8�ٔ��b:ُs��B'Q�[�t���[a���t�G����� �����7���;?wt���࿽��hċv�\��«#���6׻����fQ�d}�g}c;Z�o��$�|�@�@�6��/ �>B�����{���cJ
)vcw�b�6¥E���uxқ��r���n<�3����{���I��5D���W&�Մ�e!�xqԮ�5�L����q���s�N�:�E�4�sޥ�{��y�k|p�F��c�      �   �   x���A�0����)���{kʻeDHBЩ��H%v���&�����Ɵ��X�(���vC@C��0صj��5���h�eu��.uՖ/��e��tĄ�&�d1��'b�p�a�Q����wMمt͐0���tu�S'_G_J�jN7�N�r:l�:9̯���]����y�Fj�R~ �e�      �      x������ � �      �   $   x�s�	�t,�I�S(-)J��"�=... �`      �   �   x����
�0����}�I���m*� ŋ�2ғ���a#�J(?����
�M�A@�¶����k�G�;����h�)��l�ה��]��^u8�w�k�D��H�RB��_�`�"q"q��KnEB�_}@�Z��H�Rº�*�ĳyl�1�~v�      �   x   x�u̱
�0���<E^�cv7Q�N��"�bc!bc��'�+r��a� P���l����ݶx�ݝ�J�%Ăԓ�d�<� p�t���-2�0cd���l��K����5���(���/c�M.?�      �      x������ � �      �   r   x�30�.-J,Q�N-(-)-N��4202�50�50V00�21�21��Y��([�M8����8������3����!
M�Ḽ�-��,��8}��܁6gs��qqq - �      �   k   x��600�40�R����a���FF&� B��\���4��Sp�q�S	rTp�/*��.-J,Q�N-(-)-N��tvt��0B���������W� �/      �   �   x���͎�0�sy
^ ��Eh{+kк&��/�!%�kLo��ɘ=x��d2�e	 A�\���ٗL�B)� >z���>�MuҺ��Z�u���y���� ~�@&��:���u�)��Ϻ"f��L��5Ӱ���_Lb�6gme�����,���;��0����/2��h��TG6�]ۮ�s�ē�}�T�p~�����Ovp-˺H�P<      �   �   x�}��
�0 �s�}G�*���t�Q��q�2�t?q�c�?{��d����� �iy�q��z�:tg?��5xd���� eU7���{�0���c���;�S��a��x�NVaK��������\i�V�2y쥊6�g��g��W����W��vC��
0�)_ h)�qC)}ZQ�      �      x������ � �     