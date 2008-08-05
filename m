From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: mfd tree build failure
Date: Tue, 5 Aug 2008 15:09:47 +1000
Message-ID: <20080805150947.ee63424a.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__5_Aug_2008_15_09_47_+1000_uLx+ymYAk6YWrezy"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:34737 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753904AbYHEFJ7 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 5 Aug 2008 01:09:59 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Samuel Ortiz <sameo@openedhand.com>
Cc: linux-next@vger.kernel.org, Ian Molton <spyro@f2s.com>

--Signature=_Tue__5_Aug_2008_15_09_47_+1000_uLx+ymYAk6YWrezy
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Samuel,

Today's linux-next build (x86_64 allmodconfig) failed like this:

drivers/mtd/nand/tmio_nand.c: In function 'tmio_nand_write_buf':
drivers/mtd/nand/tmio_nand.c:251: error: implicit declaration of function '=
writesw'
drivers/mtd/nand/tmio_nand.c: In function 'tmio_nand_read_buf':
drivers/mtd/nand/tmio_nand.c:258: error: implicit declaration of function '=
readsw'

Most architectures don't implement readsw/writesw.

I reverted commit 4d6da2de1b09228989efb67a1f9e6d2ced075540 ("mfd: driver
for the TMIO NAND controller") until it has tighter controls in its
Kconfig patch. i.e. I have no idea what arches this should be built on.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__5_Aug_2008_15_09_47_+1000_uLx+ymYAk6YWrezy
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkiX4JwACgkQjjKRsyhoI8w3ZQCgi+CilX7B83m3rhkvAOdh/Xir
u8sAnRSZYbU5EsB9t5Culx1TvUz5y9lq
=GDzj
-----END PGP SIGNATURE-----

--Signature=_Tue__5_Aug_2008_15_09_47_+1000_uLx+ymYAk6YWrezy--
