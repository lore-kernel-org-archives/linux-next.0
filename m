From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the net-next tree
Date: Thu, 19 Jul 2018 11:40:27 +1000
Message-ID: <20180719114027.2722d075@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/6IWCp4mbw_59ajOlpprefbY"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>
List-Id: linux-next.vger.kernel.org

--Sig_/6IWCp4mbw_59ajOlpprefbY
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the net-next tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

WARNING: modpost: missing MODULE_LICENSE() in drivers/net/dsa/realtek.o
see include/linux/module.h for more information

Introduced by commit

  d8652956cf37 ("net: dsa: realtek-smi: Add Realtek SMI driver")

--=20
Cheers,
Stephen Rothwell

--Sig_/6IWCp4mbw_59ajOlpprefbY
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAltP7AsACgkQAVBC80lX
0GxLKAf/SDcgIqF9K5hvpclc5LhLwbX09L7bVB3iDeq3p1lmlHaA0DU4UU6iqBoO
gmJ3KJXbsnYtDNkS6dyMuP+oPVRJXSLSEhdCnA9vTDNQCqHyMTVca8+IE2UuQobQ
Ei7Pw8BmmR+j5k3AGZiowh6evvUW+G79k+ItP6lrj/w5aPVtlTcTgVbxK1ciMCjJ
qflstXxDbOcd8v2vxsQFK2LQizyAhknnooY+zE6cG2LAKBlkK2AiYj+xygtXxDk8
ZWzTsDKt26yF62/gecMZuZk1KTVBbMAbomueT2tsG4Y8uCeOKWr4lanDHIT5FL9f
2h0yV2L3GHFkP3M8neNoOjE3FPoVIg==
=ajjv
-----END PGP SIGNATURE-----

--Sig_/6IWCp4mbw_59ajOlpprefbY--
