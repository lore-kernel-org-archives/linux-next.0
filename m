From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the rtc tree
Date: Mon, 11 Feb 2019 16:24:38 +1100
Message-ID: <20190211162438.1112c0ee@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/WzvQmp36pyL4..zvstGkkAV"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Ben Dooks <ben.dooks@codethink.co.uk>
List-Id: linux-next.vger.kernel.org

--Sig_/WzvQmp36pyL4..zvstGkkAV
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the rtc tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

ERROR: "rtc_nvmem_unregister" [drivers/rtc/rtc-meson.ko] undefined!

Caused by commit

  21358403bb29 ("rtc: support for the Amlogic Meson RTC")

I have reverted that commit for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/WzvQmp36pyL4..zvstGkkAV
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxhBxYACgkQAVBC80lX
0Gw8xgf9HGjTc5BrkVt73NlhX5cAxTYyvHS4J6dt4f4pcgF8jzNaePNcCfEmaKtB
kXB/xajWMt6TPO12okQgSRwbhVzF/uUVtBGyU12+q2BvoLvvl0hmxO/wv2JUiQ+8
7AToNkkJhHLiMAFKd78gO8GxLXU/KBBKsabwiHgPJk8GhLy1/9l9RNWL/khbBa3E
Lcush/ZLHPhaf8bC3SgOoo1R4eU8f/m5xsxO0hzCe/7Ji6PPvSBJ+soqneJhJ862
Xb2SV+E8i9YKJhAameBAtAKGRiRkqWBTLQCkmqqax+7s8lJF0oObtPa30nhL3CcI
sc6Fpx4tYIGAJURMOS4yoaOsOrwJqw==
=xrwp
-----END PGP SIGNATURE-----

--Sig_/WzvQmp36pyL4..zvstGkkAV--
