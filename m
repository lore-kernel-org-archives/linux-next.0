From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the net tree
Date: Mon, 1 Dec 2008 14:16:58 +1100
Message-ID: <20081201141658.2a86da07.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__1_Dec_2008_14_16_58_+1100_BzncpFLpuBl1.594"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:38218 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752473AbYLADRX (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 30 Nov 2008 22:17:23 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>
Cc: linux-next@vger.kernel.org, Al Viro <viro@ftp.linux.org.uk>, Alexander Duyck <alexander.h.duyck@intel.com>

--Signature=_Mon__1_Dec_2008_14_16_58_+1100_BzncpFLpuBl1.594
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave,

Today's linux-next merge of the net tree got a conflict in drivers/net/ixgb=
e/ixgbe_main.c between commit 43ced651d1272ced02ed5f1c2abc79e3354187f6 ("ix=
gbe section fixes") from Linus' tree and commit ixgbe_init_interrupt_scheme=
 ("ixgbe: this patch adds support for DCB to the kernel and ixgbe driver") =
from the net tree.

I used the latter version (ixgbe_init_interrupt_scheme() is now not
static and both patches removed the __devinit annotation).  This could be
fixed up by merging Linus' tree into the net tree.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__1_Dec_2008_14_16_58_+1100_BzncpFLpuBl1.594
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkkzVyoACgkQjjKRsyhoI8w9kQCeMWvnCxnwzGCEOdIScZZKDpm7
CakAoKEsd44NrEFflwab2nYove7A2fZz
=Bm9p
-----END PGP SIGNATURE-----

--Signature=_Mon__1_Dec_2008_14_16_58_+1100_BzncpFLpuBl1.594--
