From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the generic-ipi tree
Date: Thu, 3 Jul 2008 16:44:09 +1000
Message-ID: <20080703164409.73459d30.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__3_Jul_2008_16_44_09_+1000_W9pn8c0.c4.ur7Bx"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:58546 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755383AbYGCGoT (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 3 Jul 2008 02:44:19 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>, Jens Axboe <jens.axboe@oracle.com>
Cc: linux-next@vger.kernel.org, Vegard Nossum <vegard.nossum@gmail.com>, Pekka Enberg <penberg@cs.helsinki.fi>

--Signature=_Thu__3_Jul_2008_16_44_09_+1000_W9pn8c0.c4.ur7Bx
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Ingo, Jens,

Today's linux-next merge of the generic-ipi tree got a conflict in
init/main.c between commit 385e31b9eae0528bada07d16a189f3f40df23961
("kmemcheck: add the kmemcheck core") from the kmemcheck tree and commit
3d4422332711ef48ef0f132f1fcbfcbd56c7f3d1 ("Add generic helpers for arch
IPI function calls") from the generic-ipi tree.

Just overlapping additions.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__3_Jul_2008_16_44_09_+1000_W9pn8c0.c4.ur7Bx
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhsdTkACgkQjjKRsyhoI8zazgCgtqgTFAQzoGTuuy0kfodRI4dJ
7ygAnjF/VpT5qPX/Ipd2+dBAA1O0a0bJ
=MN6B
-----END PGP SIGNATURE-----

--Signature=_Thu__3_Jul_2008_16_44_09_+1000_W9pn8c0.c4.ur7Bx--
