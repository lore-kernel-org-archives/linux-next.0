From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the input-current tree
Date: Fri, 24 May 2019 08:24:46 +1000
Message-ID: <20190524082446.7d5bc21c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/WvNaPxBP.9jG1=fIdjJghOb"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Fabien Parent <fparent@baylibre.com>
List-Id: linux-next.vger.kernel.org

--Sig_/WvNaPxBP.9jG1=fIdjJghOb
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the input-current tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/input/keyboard/mtk-pmic-keys.c:21:10: fatal error: linux/mfd/mt6392=
/registers.h: No such file or directory
 #include <linux/mfd/mt6392/registers.h>
          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Caused by commit

  78094276ca6a ("Input: mtk-pmic-keys - add support for MT6392")

I have reverted that commit for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/WvNaPxBP.9jG1=fIdjJghOb
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlznHa4ACgkQAVBC80lX
0GyAAAf+ITPFpdEirtGjI/PW7tChV+qRMezXoxrPUc8tmETKVvPdt5mmm5ETsEZi
+/lxqsqyHbsEmiueUYUca7+yNWlnFEww/b63W+jiPooYCZYTx3Df4gAy1j/hTbOu
O0jtcPm1IWNDXqz5xXryBS1KqmURDWvQelcxbSjORjnAaCOtoQtWUQchIos94qbm
gKPajbOWk5wZrc5YnVzc2br0BmnOD75UekJqv2jK3Jjvz0jMvdJ/otfqAVeNaDfk
EfxM4q7WJeSCMkyycFTc8+5iZbjW63tbof9/7iIhYlwmIulnU0oE5URbuhzFlnTk
oqmguu/6TGPdPPb6rj1cQprAGCpEVw==
=hr3u
-----END PGP SIGNATURE-----

--Sig_/WvNaPxBP.9jG1=fIdjJghOb--
