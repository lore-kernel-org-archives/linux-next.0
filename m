From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Fixes tags need some work in the mtd tree
Date: Tue, 7 May 2019 06:40:08 +1000
Message-ID: <20190507064008.1ecba58b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/EkRbAt_MV4yq25aod_a9qSo"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Richard Weinberger <richard.weinberger@gmail.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Chris Packham <chris.packham@alliedtelesis.co.nz>
List-Id: linux-next.vger.kernel.org

--Sig_/EkRbAt_MV4yq25aod_a9qSo
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  d41970097f10 ("mtd: maps: Allow MTD_PHYSMAP with MTD_RAM")

Fixes tag

  Fixes: commit 642b1e8dbed7 ("mtd: maps: Merge physmap_of.c into physmap-c=
ore.c")

has these problem(s):

  - leading word 'commit' unexpected

In commit

  64d14c6fe040 ("mtd: maps: physmap: Store gpio_values correctly")

Fixes tag

  Fixes: commit ba32ce95cbd9 ("mtd: maps: Merge gpio-addr-flash.c into phys=
map-core.c")

has these problem(s):

  - leading word 'commit' unexpected

--=20
Cheers,
Stephen Rothwell

--Sig_/EkRbAt_MV4yq25aod_a9qSo
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlzQm6gACgkQAVBC80lX
0GyXhAgAjY0Dgi71yc8VrVFDZS+yiHBMuzyv3q/eJFXapTNgzlrjVdrA31kNYFwV
XSHEcf/YLXNTlYXY9DUbTRrBSuO0c76E86Pq3h5T7yzfV5aVWrVoseLKTv85Rfhx
PzqYcQZdNMpausx2RxiRvrvgZjbOHgTuiiKeuIERa72IXG2HAC2scaXKnz9suCss
EWFtGMj4uEmG2yi34aeAFMcljR7ROlo4BeniAU/DEeDfLOzPRgkxkTgebwBWK3rv
FUHpaTAM78Ue+BrbUTtN14npWIcPKwwtEPwtOGUiTnYWNXMyNC15O8IZViK4y4bQ
U2qjRC46JkPpZND4OubDOeKNOT7Gkw==
=cSHZ
-----END PGP SIGNATURE-----

--Sig_/EkRbAt_MV4yq25aod_a9qSo--
