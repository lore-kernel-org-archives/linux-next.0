From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the vfs tree
Date: Tue, 19 Aug 2008 15:25:59 +1000
Message-ID: <20080819152559.38d4d05e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__19_Aug_2008_15_25_59_+1000_s2D.EA4FX/_tDsre"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:33585 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752127AbYHSF0I (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 19 Aug 2008 01:26:08 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Al Viro <viro@ZenIV.linux.org.uk>
Cc: linux-next@vger.kernel.org, Christoph Hellwig <hch@lst.de>

--Signature=_Tue__19_Aug_2008_15_25_59_+1000_s2D.EA4FX/_tDsre
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Al,

Today's linux-next merge of the vfs tree got a conflict in
arch/powerpc/kernel/sys_ppc32.c between commit
50d0b17645a26d2877c9d5538114498c3f82adac ("powerpc: Use generic
compat_sys_old_readdir") from Linus' tree and commit
7218c796efebbb70dce773d14d3cd3f359eebe2a ("[PATCH] fix powerpc compat
readdir()") from the vfs tree.

Again, the former removes the code that the latter updates.  I used the
version from Linus' tree.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__19_Aug_2008_15_25_59_+1000_s2D.EA4FX/_tDsre
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkiqWWcACgkQjjKRsyhoI8wFSACfZ8rNfAgD4zMXRxgg9mllFP4d
CBMAoLEkLmCPyiekISwWcZgU7CbMeJPA
=lU6v
-----END PGP SIGNATURE-----

--Signature=_Tue__19_Aug_2008_15_25_59_+1000_s2D.EA4FX/_tDsre--
