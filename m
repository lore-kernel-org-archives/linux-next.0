From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kmemcheck tree
Date: Tue, 22 Jul 2008 16:16:19 +1000
Message-ID: <20080722161619.5b8bd082.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__22_Jul_2008_16_16_19_+1000_7+My8gA7DjlLDoEI"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:35291 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751329AbYGVGQ0 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 22 Jul 2008 02:16:26 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Vegard Nossum <vegard.nossum@gmail.com>, Pekka Enberg <penberg@cs.helsinki.fi>, Ingo Molnar <mingo@elte.hu>
Cc: linux-next@vger.kernel.org, Jaswinder Singh <jaswinder@infradead.org>

--Signature=_Tue__22_Jul_2008_16_16_19_+1000_7+My8gA7DjlLDoEI
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the kmemcheck tree got a trivial conflict in
arch/x86/kernel/traps_32.c between commit
6ac8d51f01d345af5ea4209004a9ea29b2f20891 ("x86: introducing
asm-x86/traps.h") from Linus' tree and commit
787ecfaa503dc63ff1831ddc74b15dad49bace1d ("x86: add hooks for kmemcheck")
from the kmemcheck tree.

Just overlapping additions of includes.  I can carry it.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__22_Jul_2008_16_16_19_+1000_7+My8gA7DjlLDoEI
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkiFezMACgkQjjKRsyhoI8ywiwCePQXKERMKmsUbPsSUu5Yhhf1T
KS4An3m5/lyPOI4WHurAyJTAWxwdRQ7h
=6wLK
-----END PGP SIGNATURE-----

--Signature=_Tue__22_Jul_2008_16_16_19_+1000_7+My8gA7DjlLDoEI--
