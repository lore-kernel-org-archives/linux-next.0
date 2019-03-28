From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the rtc tree
Date: Thu, 28 Mar 2019 12:23:00 +1100
Message-ID: <20190328122300.02fc46c4@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/Mv6dydBiL6ncGbiEWL_5PUN"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Joel Stanley <joel@jms.id.au>
List-Id: linux-next.vger.kernel.org

--Sig_/Mv6dydBiL6ncGbiEWL_5PUN
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the rtc tree, today's linux-next build (x86_64 allmodconfig)
produced this warning:

drivers/rtc/rtc-aspeed.c: In function 'aspeed_rtc_read_time':
drivers/rtc/rtc-aspeed.c:26:16: warning: unused variable 'flags' [-Wunused-=
variable]
  unsigned long flags;
                ^~~~~
drivers/rtc/rtc-aspeed.c: In function 'aspeed_rtc_set_time':
drivers/rtc/rtc-aspeed.c:57:16: warning: unused variable 'flags' [-Wunused-=
variable]
  unsigned long flags;
                ^~~~~

Introduced by commit

  7f4d485413fb ("rtc: Add ASPEED RTC driver")

--=20
Cheers,
Stephen Rothwell

--Sig_/Mv6dydBiL6ncGbiEWL_5PUN
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlycIfQACgkQAVBC80lX
0Gzfigf+Ltz7iVBBQvWiWlOBKad6xVJ1NjAihM2+LdUvD8BBKpwhkHvGBzgdJ19t
p4XIJCW3XDtdAuAl0p4sadElC4dzdb2xe2XIzp12pvPu2H6qIWyXSTOKKllx8Ryh
nLakrlR02ixvC093Erxq6zD/FECMvOKYupsP3b6WY1wz6Ic9uY6DkKBWTR75jvTb
GvBJCQVB0D+WVQ/62zhTQ8r7r8gPwtVD+DtOCe4m1jvFXflWCYGqJQNL93yQJrjt
FBrwue/IcWopTw3DHVKrWvIzqZCN9DS0HcVSmCUYA/6fWdcLsd4HWIhzv8lVjWyh
rToG/emnGANouv967y99ZYTWf2AElQ==
=sp2f
-----END PGP SIGNATURE-----

--Sig_/Mv6dydBiL6ncGbiEWL_5PUN--
