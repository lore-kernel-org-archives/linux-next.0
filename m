From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: hdlc tree build failure
Date: Tue, 8 Jul 2008 18:37:00 +1000
Message-ID: <20080708183700.44465c76.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__8_Jul_2008_18_37_00_+1000_=L6pkUFJjv0NG1eN"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:44862 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750717AbYGHIhH (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 8 Jul 2008 04:37:07 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Pierre Ossman <drzeus@drzeus.cx>
Cc: linux-next@vger.kernel.org

--Signature=_Tue__8_Jul_2008_18_37_00_+1000_=L6pkUFJjv0NG1eN
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Pierre,

Today's linux-next build (powerpc allyesconfig) failed like this:

drivers/mmc/host/sdhci.c: In function 'sdhci_adma_table_pre':
drivers/mmc/host/sdhci.c:363: error: 'bad_dma_address' undeclared (first us=
e in this function)

Caused by commit b13668f718fa98b07b4ea23417fa495ccd922eca ("sdhci:
graceful handling of bad addresses") which added references to
bad_dma_address which only exists in x86.

I have reverted that commit and 02680df80583c1d266827fe0307292450cd49384
("mmc: fix spares errors of sdhci.c") which depended on it.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__8_Jul_2008_18_37_00_+1000_=L6pkUFJjv0NG1eN
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhzJywACgkQjjKRsyhoI8yPewCbBf2aY4+GrKPQduaOTOGHUEuF
1H4Anjs7NF5m5D4X0X2GRhtNodJpl2WB
=fTB2
-----END PGP SIGNATURE-----

--Signature=_Tue__8_Jul_2008_18_37_00_+1000_=L6pkUFJjv0NG1eN--
