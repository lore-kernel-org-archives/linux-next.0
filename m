From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kmemcheck tree
Date: Mon, 28 Jul 2008 14:01:11 +1000
Message-ID: <20080728140111.832c3bc8.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__28_Jul_2008_14_01_11_+1000_83LYYogw5JutqRuL"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:40533 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750795AbYG1EBU (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 28 Jul 2008 00:01:20 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Vegard Nossum <vegard.nossum@gmail.com>, Pekka Enberg <penberg@cs.helsinki.fi>, Ingo Molnar <mingo@elte.hu>
Cc: linux-next@vger.kernel.org, Eduard - Gabriel Munteanu <eduard.munteanu@linux360.ro>

--Signature=_Mon__28_Jul_2008_14_01_11_+1000_83LYYogw5JutqRuL
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the kmemcheck tree got a conflict in
init/main.c between commits c2147a5092cfe13dbf3210e54e8a622015edeecc
("Better interface for hooking early initcalls") and
7babe8db99d305340cf4828ce1f5a1481d5622ef ("Full conversion to
early_initcall() interface, remove old interface") from Linus' tree and
commit 385e31b9eae0528bada07d16a189f3f40df23961 ("kmemcheck: add the
kmemcheck core") from the kmemcheck tree.

I used the upstream version and turned kmemcheck_init into an
early_initcall().

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__28_Jul_2008_14_01_11_+1000_83LYYogw5JutqRuL
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkiNRIcACgkQjjKRsyhoI8y7LACdEce/a1seR3pJXt9nBM9cFXRI
46cAmgJcXhdmaoUQIxCwGBdsUeoSBWvt
=XwB9
-----END PGP SIGNATURE-----

--Signature=_Mon__28_Jul_2008_14_01_11_+1000_83LYYogw5JutqRuL--
