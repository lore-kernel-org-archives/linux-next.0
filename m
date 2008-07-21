From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kmemcheck tree
Date: Mon, 21 Jul 2008 16:47:00 +1000
Message-ID: <20080721164700.905a94d3.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__21_Jul_2008_16_47_00_+1000_jQP6u6IN1r7pfZ9T"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:47382 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752286AbYGUGrN (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 21 Jul 2008 02:47:13 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Vegard Nossum <vegard.nossum@gmail.com>, Pekka Enberg <penberg@cs.helsinki.fi>, Ingo Molnar <mingo@elte.hu>
Cc: linux-next@vger.kernel.org, Rusty Russell <rusty@rustcorp.com.au>

--Signature=_Mon__21_Jul_2008_16_47_00_+1000_jQP6u6IN1r7pfZ9T
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the kmemcheck tree got a conflict in
kernel/sysctl.c between commit 46dd972f573f3b697c1c2de6a0ca73a2cde7d3c0
("stop_machine:add_stopmachine_timeout") from the rr tree and commit
385e31b9eae0528bada07d16a189f3f40df23961 ("kmemcheck: add the kmemcheck
core") from the kmemcheck tree.

Just overlapping additions/removal.  I can carry the fixup.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__21_Jul_2008_16_47_00_+1000_jQP6u6IN1r7pfZ9T
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkiEMOQACgkQjjKRsyhoI8xxiACfYDB2MEMHpdvH1d4CtSWikdMk
ZbkAoLhCFo9eaB36xpgDoJaaF/agFoPh
=DpjD
-----END PGP SIGNATURE-----

--Signature=_Mon__21_Jul_2008_16_47_00_+1000_jQP6u6IN1r7pfZ9T--
