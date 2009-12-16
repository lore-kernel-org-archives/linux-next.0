From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: origin tree build warning
Date: Wed, 16 Dec 2009 14:52:41 +1100
Message-ID: <20091216145241.0d5ef378.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__16_Dec_2009_14_52_41_+1100_wIq=V.CjyYoWA4h9"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:54581 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752108AbZLPDwr (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 15 Dec 2009 22:52:47 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Bernhard Walle <bernhard@bwalle.de>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Linus <torvalds@linux-foundation.org>

--Signature=_Wed__16_Dec_2009_14_52_41_+1100_wIq=V.CjyYoWA4h9
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next build (x86_64 allmodconfig) produced this warning:

usr/include/linux/vt.h:89: userspace cannot call function or variable defin=
ed in the kernel

Introduced by commit 5ada918b82399eef3afd6a71e3637697d6bd719f ("vt:
introduce and use vt_kmsg_redirect() function").

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__16_Dec_2009_14_52_41_+1100_wIq=V.CjyYoWA4h9
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAksoWYkACgkQjjKRsyhoI8yahACfSiCgTAi11obOm2PrAdackgI2
fdgAoJeN+uVRJTGSVXfUS+IVFafEAt/b
=QEG3
-----END PGP SIGNATURE-----

--Signature=_Wed__16_Dec_2009_14_52_41_+1100_wIq=V.CjyYoWA4h9--
