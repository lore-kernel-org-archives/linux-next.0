From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: pxa tree build failure
Date: Thu, 28 May 2009 02:54:06 +1000
Message-ID: <20090528025406.781cfc0b.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__28_May_2009_02_54_06_+1000_tLODcILJeSdM.TU8"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:35231 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753691AbZE0QyY (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 27 May 2009 12:54:24 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Eric Miao <eric.y.miao@gmail.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Tomas 'Sleep_Walker' Cech <sleep_walker@suse.cz>, Russell King <rmk@arm.linux.org.uk>

--Signature=_Thu__28_May_2009_02_54_06_+1000_tLODcILJeSdM.TU8
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Eric,

Today's linux-next build (most of the arm configs) failed like this:

arch/arm/mm/mmu.c:839: error: implicit declaration of function 'machine_is_=
treo680'

Caused by commit c81fe1207795c71a6933f84d62ded0946a6af8a4 ("[ARM]
pxa/treo680: initial support").

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__28_May_2009_02_54_06_+1000_tLODcILJeSdM.TU8
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkodcDAACgkQjjKRsyhoI8xmxgCfctFG2kvy3pZRxIP2sWK6RgOG
tesAoLKopMPigoMXPh/3MnVNAPZotobl
=hdF5
-----END PGP SIGNATURE-----

--Signature=_Thu__28_May_2009_02_54_06_+1000_tLODcILJeSdM.TU8--
