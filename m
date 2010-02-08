From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the trivial tree with the arm tree
Date: Mon, 8 Feb 2010 15:48:21 +1100
Message-ID: <20100208154821.0560fcca.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__8_Feb_2010_15_48_21_+1100_If.hxruF_jt3Rik2"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:42554 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756364Ab0BHEs1 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 7 Feb 2010 23:48:27 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jiri Kosina <jkosina@suse.cz>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Tony Lindgren <tony@atomide.com>, Russell King <rmk@arm.linux.org.uk>, Daniel Mack <daniel@caiaq.de>

--Signature=_Mon__8_Feb_2010_15_48_21_+1100_If.hxruF_jt3Rik2
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jiri,

Today's linux-next merge of the trivial tree got a conflict in
arch/arm/mach-u300/include/mach/debug-macro.S between commit
7f62dc4756eaf761570b96250630d48f80397d64 ("ARM: 5910/1: ARM: Add tmp
register for addruart and loadsp") from the arm tree and commit
ba5584a307a1166597fbbe970ffdf49c8b7ee42a ("tree-wide: Assorted spelling
fixes") from the trivial tree.

Just context changes.  I fixed it up (see below) and can carry the fix as
necessary.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc arch/arm/mach-u300/include/mach/debug-macro.S
index ca4a028,d591fe1..0000000
--- a/arch/arm/mach-u300/include/mach/debug-macro.S
+++ b/arch/arm/mach-u300/include/mach/debug-macro.S
@@@ -10,8 -10,8 +10,8 @@@
   */
  #include <mach/hardware.h>
 =20
 -	.macro	addruart,rx
 +	.macro	addruart, rx, tmp
- 	/* If we move the adress using MMU, use this. */
+ 	/* If we move the address using MMU, use this. */
  	mrc	p15, 0, \rx, c1, c0
  	tst	\rx, #1			@ MMU enabled?
  	ldreq	\rx,	  =3D U300_SLOW_PER_PHYS_BASE @ MMU off, physical address

--Signature=_Mon__8_Feb_2010_15_48_21_+1100_If.hxruF_jt3Rik2
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAktvl5UACgkQjjKRsyhoI8xD0wCfTufdy0K1gHmaCOq6jNKrJjLx
+NgAnjULZZ+pMlmOE+LW1wVGRFDTOUIo
=kDO4
-----END PGP SIGNATURE-----

--Signature=_Mon__8_Feb_2010_15_48_21_+1100_If.hxruF_jt3Rik2--
