From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kmemcheck tree
Date: Mon, 28 Jul 2008 14:09:17 +1000
Message-ID: <20080728140917.fd7769c3.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__28_Jul_2008_14_09_17_+1000_ok5GSC_Ob_zD4Xp1"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:36043 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750891AbYG1EJX (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 28 Jul 2008 00:09:23 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Vegard Nossum <vegard.nossum@gmail.com>, Pekka Enberg <penberg@cs.helsinki.fi>, Ingo Molnar <mingo@elte.hu>
Cc: linux-next@vger.kernel.org, Alexey Dobriyan <adobriyan@gmail.com>

--Signature=_Mon__28_Jul_2008_14_09_17_+1000_ok5GSC_Ob_zD4Xp1
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the kmemcheck tree got a conflict in
mm/slab.c between commit 51cc50685a4275c6a02653670af9f108a64e01cf ("SL*B:
drop kmem cache argument from constructor") from Linus' tree and commit
c9506812f317bca0edcbc717c8fdabdd1d0a264b ("slab: move struct kmem_cache
to headers") from the kmemcheck tree.

The former changed the ctor field of the structure that the latter moved
to a different file.  I fixed it up in its new location.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__28_Jul_2008_14_09_17_+1000_ok5GSC_Ob_zD4Xp1
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkiNRm0ACgkQjjKRsyhoI8ye2wCeK7O1wSXnJgawV9K1gZj5mjd+
ITwAoJvY7Yb2QS714sHI1zXoxO8oZ9K+
=pIgN
-----END PGP SIGNATURE-----

--Signature=_Mon__28_Jul_2008_14_09_17_+1000_ok5GSC_Ob_zD4Xp1--
