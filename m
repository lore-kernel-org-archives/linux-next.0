From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the net-next tree
Date: Thu, 19 Jul 2018 12:04:47 +1000
Message-ID: <20180719120447.6e7ba23d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/XvlZXxxCXQ8aWEMxZC.Hr6V"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Andrew Lunn <andrew@lunn.ch>, Guenter Roeck <linux@roeck-us.net>
List-Id: linux-next.vger.kernel.org

--Sig_/XvlZXxxCXQ8aWEMxZC.Hr6V
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the net-next tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

*
* Restart config...
*
....

This is output by my "make allmodconfig" and only started after merging
the net-next tree today.  It has continued for further merges/builds.

I suspect commit

  1323061a018a ("net: phy: sfp: Add HWMON support for module sensors")

which added an "imply" clause.

--=20
Cheers,
Stephen Rothwell

--Sig_/XvlZXxxCXQ8aWEMxZC.Hr6V
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAltP8b8ACgkQAVBC80lX
0GxYdAf+P0Em8KecENiUi4Z5IVmYro5pvYQIENjFbQhfjQzVwDd/W5gWogovXjwY
miy2aw7W6M3+2sarrJggq3jeXCrTBe225PgU28YoRehf/Qj8k//HQqtxMEIsqfsc
Yie8/mbppFA7p+xVJs81zqj4h7eW8pP3QGZwco30w0xksJwxWnh/qM1BbSEt8BT1
01ISuqORnG2l6m2AN6TdRvIP8EaJcAjnhPm/6dyPSyEhEjCItoloXTQq9/6gfjoO
mx9oC6lVnhx/fi8DdKGIxdSoI69qy4pkHeQsjd+lulu4nxHdJ/exoOF1ew6m3vQY
hRRb1qgzLqysVgn3knauPC/FBu7PbA==
=E/kj
-----END PGP SIGNATURE-----

--Sig_/XvlZXxxCXQ8aWEMxZC.Hr6V--
