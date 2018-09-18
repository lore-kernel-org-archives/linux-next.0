From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the input-current tree
Date: Wed, 19 Sep 2018 08:25:00 +1000
Message-ID: <20180919082500.74401754@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/xRaItE2eXFCUdrRJ.vQJFjz"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Daniel Drake <drake@endlessm.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
List-Id: linux-next.vger.kernel.org

--Sig_/xRaItE2eXFCUdrRJ.vQJFjz
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Dmitry,

After merging the input-current tree, today's linux-next build (x86_64
allmodconfig) failed like this:

ERROR: "mem_sleep_current" [drivers/input/serio/i8042.ko] undefined!

Caused by commit

  1685830e59d4 ("Input: i8042 - enable keyboard wakeups by default when s2i=
dle is used")

I have used the version of input-current from next-20180918 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/xRaItE2eXFCUdrRJ.vQJFjz
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAluhezwACgkQAVBC80lX
0Gy9IQf+LCFuj/N2zs1WCqHj0SfLR2b11CueYF3Q2r3o8x3sEf+D+cfmqxWTfNWZ
z2M0mQQTChh+PDvKzSotSFyvGlgMTff0OUj56aYimUjWsH5UGgRmJ+q5Yo+arRqm
l32ODxs1ivoWaw+Ja5QlV+A6Cri5ZZt4HySfDVZJdUfRObGCNfLNJTAn2Zcgc3tR
+I9ybvg/gXp3or6aGvN0c9ZH4NSEE5dlrkPmSTRdIkotm+5P9+oU4MOn8+twrwox
Wq/xD+BGSu4UozipeqgvYKsQh34SJI1C6fv9VY9Ati0ZQVKqzZP/qJTXV7NDkx7P
ih0dN92qf/BOs5Buq+1mKwQPeE9r7A==
=Jqy3
-----END PGP SIGNATURE-----

--Sig_/xRaItE2eXFCUdrRJ.vQJFjz--
