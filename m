From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the gpio tree
Date: Mon, 17 Dec 2018 19:24:38 +1100
Message-ID: <20181217192438.1741a2b9@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_//=Es8H68pJaXDVtiirsyCdZ"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_//=Es8H68pJaXDVtiirsyCdZ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the gpio tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

drivers/memory/omap-gpmc.c: In function 'gpmc_probe_generic_child':
drivers/memory/omap-gpmc.c:2174:9: error: type of formal parameter 4 is inc=
omplete
         0);
         ^

Caused by commit

  21abf103818a ("gpio: Pass a flag to gpiochip_request_own_desc()")

I have used the gpio tree from next-20181214 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_//=Es8H68pJaXDVtiirsyCdZ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlwXXUYACgkQAVBC80lX
0GzZQgf/V6a3Y2VGXxA9uo2cGp9vr20/7HG4cJxiXTecU+XwNszgzpzFueAbLbM5
6mGuFeIxEbkS9dYk0RdRIaGJTCmDVm6Mk7UYifwpnPJllsSXxVxgJ3aa1tM86I7V
Sry4+jsduwBDFRB93yhCMF0jvt+DEE+oWaVpkbGZ7NnwBefSHLdrpregFybjlgvY
J/1C9/xUHSuMYbAQvbBOff+42aQ2opTgBQNtjGU/G/ksdC23vyKjsqRfZL//JE+6
xUQi46/bxM/TxnBYo8VRB14MxyoHFLzHGENvMbfozmP0Gdj5eFvq3BTjbg+v0qF7
HGqLm7eM6yU7WW9wM8WS8rvjYnuSyQ==
=IOXC
-----END PGP SIGNATURE-----

--Sig_//=Es8H68pJaXDVtiirsyCdZ--
