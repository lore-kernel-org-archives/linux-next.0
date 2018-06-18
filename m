From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build warning after merge of the random tree
Date: Mon, 18 Jun 2018 13:35:23 +1000
Message-ID: <20180618133523.30db3ba0@canb.auug.org.au>
References: <20180608133748.58a272d5@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/WvEGn6V4zyq42Awr/rh53y8"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180608133748.58a272d5@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Theodore Ts'o <tytso@mit.edu>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Tobin C. Harding" <me@tobin.cc>
List-Id: linux-next.vger.kernel.org

--Sig_/WvEGn6V4zyq42Awr/rh53y8
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 8 Jun 2018 13:37:48 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> After merging the random tree, today's linux-next build (arm
> multi_v7_defconfig) produced this warning:
>=20
> lib/vsprintf.c:1668:13: warning: 'have_filled_random_ptr_key' defined but=
 not used [-Wunused-variable]
>  static bool have_filled_random_ptr_key __read_mostly;
>              ^~~~~~~~~~~~~~~~~~~~~~~~~~
>=20
> Introduced by commit
>=20
>   bfe80ed3d7c7 ("vsprintf: add command line option debug_boot_weak_hash")

I am still getting this ...
--=20
Cheers,
Stephen Rothwell

--Sig_/WvEGn6V4zyq42Awr/rh53y8
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlsnKHsACgkQAVBC80lX
0Gyxdgf+JYXhDm2AqKh8ppqArOgpQqrN7f1zI1J0d4P0Jpg/la/xJV89DaR0Ngn8
8QdkOMmXgAS/Y+K9B0IP5Ml89x5Oaw7/bUjkz69uJ+9shZIoysr5w6qIX314imRj
k90yb8J77CYYg0oFa0zeipxF6aaMtNPBtSyDBH703nksKI4ImDiIvbWoB03QrKlC
cj4N5wiYssiH6Nv1CBZp4Fc+I1TxQz4RnRlSVqRO1IWgY7yKdAeUFpQAF2PeyJu4
zIfABCDHE1Aj0rAYzbYp0WMTuN3lWWxj6NX9dIDTfyrpIbt51fSCSBHig77CYTZR
bkYwtL4Zd5z794fsbruPd9URvjx88w==
=mUl2
-----END PGP SIGNATURE-----

--Sig_/WvEGn6V4zyq42Awr/rh53y8--
