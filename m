From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Fixes tags need some work in the net-next tree
Date: Thu, 21 Feb 2019 22:11:22 +1100
Message-ID: <20190221221122.7e0f13a5@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/ab1MvUwH6nCM2WdhBMI08n1"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Bodong Wang <bodong@mellanox.com>, Saeed Mahameed <saeedm@mellanox.com>
List-Id: linux-next.vger.kernel.org

--Sig_/ab1MvUwH6nCM2WdhBMI08n1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  1c50d369f560 ("net/mlx5: E-Switch, Disable esw manager vport correctly")

Fixes tag

  Fixes: de9e6a8136c5 ("net/mlx5: E-Switch, Properly refer to host PF vport=
 as other vport")

has these problem(s):

  - Target SHA1 does not exist

Did you mean

  Fixes: cbc44e76bfcd ("net/mlx5: E-Switch, Properly refer to host PF vport=
 as other vport")

In commit

  acad70731e63 ("net/mlx5: E-Switch, Fix the warning on vport index out of =
range")

Fixes tag

  Fixes: 22b8ddc86bf4 ("net/mlx5: E-Switch, Assign a different position for=
 uplink rep and vport")

has these problem(s):

  - Target SHA1 does not exist

Did you mean

  Fixes: 5ae5162066d8 ("net/mlx5: E-Switch, Assign a different position for=
 uplink rep and vport")

In commit

  e87636117e9a ("net/mlx5e: Remove unused variable =E2=80=98esw=E2=80=99")

Fixes tag

  Fixes: 1cd3ab86b713 ("net/mlx5e: Introduce mlx5e_flow_esw_attr_init() hel=
per")

has these problem(s):

  - Target SHA1 does not exist

Did you mean

  Fixes: 988ab9c7363a ("net/mlx5e: Introduce mlx5e_flow_esw_attr_init() hel=
per")

--=20
Cheers,
Stephen Rothwell

--Sig_/ab1MvUwH6nCM2WdhBMI08n1
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxuh1oACgkQAVBC80lX
0GwQ4wf/VKc7gJSMN5KAuJ5Wg5h+yW4R/nGjffsKTiMf0RQ4DkWKZEXmCuSyyGPO
CZUmN3bpymp60xL3RscyEu5Bt8/KcDspBocezmQ5OqOn5kqfJLpEDGZn6vt/goCc
Ukhcb3gc1nkjceWA2yba3oga53MBL+VgxAZelS+CKl+xPsG2wYW3Gfrkfp5AW1G4
0Q2nqGBHb9Z6WYghRse3/t92Rq/h4G1bgYceGBO8xakJsFhsvdZQ6ewDqqZ7un9l
b6iMrjWbq4aTkXkAMaSFXcqFBel+58T3I0BL70KRZuFbs3rIxrYDwCcgrTp6y0v1
8/KO7LbNXLVkfkPAoONBQo9HMcebWQ==
=zSYl
-----END PGP SIGNATURE-----

--Sig_/ab1MvUwH6nCM2WdhBMI08n1--
