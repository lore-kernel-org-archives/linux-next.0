From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the mfd tree
Date: Wed, 7 Apr 2010 15:02:42 +1000
Message-ID: <20100407150242.ebeb11fb.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__7_Apr_2010_15_02_42_+1000_D+5zpwYj82/HkMzC"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:57023 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751472Ab0DGFCv (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 7 Apr 2010 01:02:51 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Samuel Ortiz <sameo@linux.intel.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "Ira W. Snyder" <iws@ovro.caltech.edu>

--Signature=_Wed__7_Apr_2010_15_02_42_+1000_D+5zpwYj82/HkMzC
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Samuel,

After merging the mfd tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

drivers/mfd/janz-cmodio.c:270: error: 'PCI_VENDOR_ID_JANZ' undeclared here =
(not in a function)

Caused by commit d4a16922bc8ecece287becf3cc2c0333f77bdf9e ("mfd: Janz
CMOD-IO PCI MODULbus Carrier Board support").

I have used the version of the mfd tree from next-20100401 for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__7_Apr_2010_15_02_42_+1000_D+5zpwYj82/HkMzC
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAku8EfIACgkQjjKRsyhoI8xIPwCgwHaNYgREOMnawGxeM7iZf8kW
DsEAoLriolTlCm80SkikvpkuDcgKq39I
=CJl8
-----END PGP SIGNATURE-----

--Signature=_Wed__7_Apr_2010_15_02_42_+1000_D+5zpwYj82/HkMzC--
