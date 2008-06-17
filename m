From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of sparc tree
Date: Tue, 17 Jun 2008 17:21:50 +1000
Message-ID: <20080617172150.9ef1ea69.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__17_Jun_2008_17_21_50_+1000_30jMYB/9hPxtbnzD"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:55545 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752893AbYFQHWA (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 17 Jun 2008 03:22:00 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>
Cc: linux-next@vger.kernel.org, Adrian Bunk <bunk@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>

--Signature=_Tue__17_Jun_2008_17_21_50_+1000_30jMYB/9hPxtbnzD
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave,

Today's linux-next merge of the sparc tree got a trivial contextual
conflict in include/asm-m68k/sbus.h between commit
69edc57f65f2d0bf63485cba4567876a1cfa3dae ("m68k/sun3/: possible
cleanups") from the m68k tree and commit
878e7a6e498bec55f10a163197c41554fb078416 ("sparc: remove CONFIG_SUN4")
from the sparc tree.

It was just close changes to the same file.  I fixed it up.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__17_Jun_2008_17_21_50_+1000_30jMYB/9hPxtbnzD
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhXZg4ACgkQTgG2atn1QN/OagCaAnWJqzwsFo1tkAC6pKRMs7ye
cKYAn2Y+Hxp8uElFJd0FO7w2VQvarmjk
=7oJH
-----END PGP SIGNATURE-----

--Signature=_Tue__17_Jun_2008_17_21_50_+1000_30jMYB/9hPxtbnzD--
