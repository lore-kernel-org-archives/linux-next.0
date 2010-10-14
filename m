From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the spi tree
Date: Thu, 14 Oct 2010 12:55:53 +1100
Message-ID: <20101014125553.dc4ea7be.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__14_Oct_2010_12_55_53_+1100_4D=H=19eIRnkiBWa"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Mingkai Hu <Mingkai.hu@freescale.com>
List-Id: linux-next.vger.kernel.org

--Signature=_Thu__14_Oct_2010_12_55_53_+1100_4D=H=19eIRnkiBWa
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Grant,

After merging the spi tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

drivers/mtd/devices/m25p80.c: In function 'm25p_probe':
drivers/mtd/devices/m25p80.c:927: error: 'struct device' has no member name=
d 'of_node'
drivers/mtd/devices/m25p80.c:929: error: 'struct device' has no member name=
d 'of_node'

Caused by commit 2bf990280d6074228f6e4c18ad01c0674c5c11c8 ("mtd/m25p80:
add support to parse the partitions by OF node"). CONFIG_OF is not set
for this build.

I have used the spi tree form next-20101013 for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__14_Oct_2010_12_55_53_+1100_4D=H=19eIRnkiBWa
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iQEcBAEBAgAGBQJMtmMpAAoJEDMEi1NhKgbssxMH/1xLNYuQ8dqjDBW0Ww8716K+
PVx44XZV5lltUfqHuz0xJQSX/hqwIIBIWepm2zLZuXNZpFtIrR2DBdBYJLtt6Qpr
7+8pKikVFNfiPlB3rRtAIq5H6dn/mK7ED29ZXi0QrX/uiSbwAKo2XcOrBf2Fn3HI
Bu+o8jc053mlgCACooZ9kVXN3q3anl5ogn57uq/YI/hdgpTV7MReXmBKnpuCsl/F
RjBnbff5zPa6r/bLx+g45EfjGNdurp2yoLPaVVk1q74+u5Ie4eO5pt5tBeFVq3X8
wQRX+eT8mWwLTDDLZKCQvEYTqvtr+DyY3r3i7K79DFtstTnYNIS8wDjAV/GVrEE=
=16Vt
-----END PGP SIGNATURE-----

--Signature=_Thu__14_Oct_2010_12_55_53_+1100_4D=H=19eIRnkiBWa--
