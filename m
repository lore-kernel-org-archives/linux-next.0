From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: pcmcia tree build warnings
Date: Wed, 20 Aug 2008 16:24:10 +1000
Message-ID: <20080820162410.82615889.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__20_Aug_2008_16_24_10_+1000_zi3Q9=n9deOzETQ3"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:51117 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750801AbYHTGYU (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 20 Aug 2008 02:24:20 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dominik Brodowski <linux@dominikbrodowski.net>
Cc: linux-next@vger.kernel.org

--Signature=_Wed__20_Aug_2008_16_24_10_+1000_zi3Q9=n9deOzETQ3
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dominik,

These are worth fixing:

drivers/pcmcia/ds.c: In function 'pcmcia_devmatch':
drivers/pcmcia/ds.c:962: warning: passing argument 1 of 'dev_driver_string'=
 from incompatible pointer type
drivers/pcmcia/ds.c:962: warning: passing argument 1 of 'dev_name' from inc=
ompatible pointer type
drivers/pcmcia/ds.c:969: warning: passing argument 1 of 'dev_driver_string'=
 from incompatible pointer type
drivers/pcmcia/ds.c:969: warning: passing argument 1 of 'dev_name' from inc=
ompatible pointer type

You are passing a "struct pcmcia_device *" instead of a "struct device *"
to ds_dev_dbg().  (commit 5e42a2fcae73c08af2ae4d64b25f807708ff6193
"pcmcia: use dev_printk in module pcmcia")

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__20_Aug_2008_16_24_10_+1000_zi3Q9=n9deOzETQ3
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkiruIoACgkQjjKRsyhoI8wLoACdH90c3kDGjUbAa7ceBrmPG4bV
TIYAnjQyCiXvnr/Hhmai7CyvOQJqRwyo
=9tnx
-----END PGP SIGNATURE-----

--Signature=_Wed__20_Aug_2008_16_24_10_+1000_zi3Q9=n9deOzETQ3--
