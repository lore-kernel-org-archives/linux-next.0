From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the driver-core.current tree
Date: Thu, 24 Jul 2008 10:57:53 +1000
Message-ID: <20080724105753.3eb6ed07.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__24_Jul_2008_10_57_53_+1000_Xg9i+05NOcs/qas."
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:56721 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750850AbYGXA57 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 23 Jul 2008 20:57:59 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, Maciej Sosnowski <maciej.sosnowski@intel.com>

--Signature=_Thu__24_Jul_2008_10_57_53_+1000_Xg9i+05NOcs/qas.
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Greg,

Today's linux-next merge of the driver-core.current tree got a conflict
in drivers/dca/dca-sysfs.c between commit
7f1b358a236ee9c19657a619ac6f2dcabcaa0924 ("I/OAT: I/OAT version 3.0
support") from Linus' tree and commit
25070eca3d7d3a04e45ceeb37c15ef73800817b0 ("device create: misc: convert
device_create_drvdata to device_create") from the driver-core.current
tree.

The former changed the last parameter to device_create_drvdata().  I did
the obvious fixup.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__24_Jul_2008_10_57_53_+1000_Xg9i+05NOcs/qas.
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkiH05EACgkQjjKRsyhoI8wJSgCgg27NGCVWpkGT532YMUPoOvRG
tYkAn0cwp0oxyI5Wa0DgGiFldw5ewRs/
=IU2l
-----END PGP SIGNATURE-----

--Signature=_Thu__24_Jul_2008_10_57_53_+1000_Xg9i+05NOcs/qas.--
