From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the init tree with the arm tree
Date: Wed, 3 Jun 2015 19:20:51 +1000
Message-ID: <20150603192051.42a4c95b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/WRdZ7iwxEaBk+7zimHwHo5F"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Gortmaker <paul.gortmaker@windriver.com>, Russell King <linux@arm.linux.org.uk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

--Sig_/WRdZ7iwxEaBk+7zimHwHo5F
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Paul,

Today's linux-next merge of the init tree got a conflict in
arch/arm/mach-hisi/headsmp.S between commit 02b4e2756e01 ("ARM: v7
setup function should invalidate L1 cache") from the arm tree and
commit 43e92446f1d2 ("arm/mach-hisi: remove legacy __CPUINIT section
that crept in") from the init tree.

I fixed it up (the former removed the file) and can carry the fix as
necessary (no action is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/WRdZ7iwxEaBk+7zimHwHo5F
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVbsb9AAoJEMDTa8Ir7ZwV4ZkP/A8VzneLilFeIBoyjFqJ4Yw7
dUwJELRrus3T2ghNdkKUmvEdtOkZ5R2q3QTKHs4wRBB+dkuLAS2uspYWbvxc/Pcd
5tTIArhWmHuE1FvG8mTU9NloazIXa6BekT7LevhDfTx3N+OqSV20o0xPmeZ3fwsJ
lO4bxXPaQjAf0tHhaYW8gCgq0P1D+U4Xzxs6wryCR+VoycJ4RoxKdWrWM1WuK243
QsU9bqstm9H3MWEQTQou69XmTZGeMxU/jz1Ai3egC9tby+1wPnUIUQl6YipPe/Io
gf1JP6gTpuqdJPODBX3HxxyqU/ebw6pEbCAXFGdPC7eWXrLfX/857CrLiOXYlFrJ
2mM48+tn5pVsIee0fGf009rOpZJ79ptm2uNs+hEyxIu+1bT9hwWxDOnx0LwKL4d+
4dIHc8SrrZmU6mW0SNGGLINKHdNUW7iW8D60Ap3TQJi8n9yvIsx2AOv6mTo3OYjv
QlXQLlZtPf3tfrcq1APOLoPJ5zC79Hl/SqnoK4sIpQq4oAUR9VvvzK9mK4SlZxut
jx7dRnIgAATiimsbbGprU6igbRRKTBJhXqT3wOh56HxMacVQ7RofP6sviLnXI9x4
NkKmshFtEdJa1WT55hIvjhPwBlLyDI1CDHfzRNbJHY96bddH4XrNYbT23/ZZSYvE
oBDP9KwtOLUeFc4y7biE
=B5g1
-----END PGP SIGNATURE-----

--Sig_/WRdZ7iwxEaBk+7zimHwHo5F--
