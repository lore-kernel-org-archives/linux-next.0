From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the slab tree
Date: Wed, 13 Aug 2008 14:57:41 +1000
Message-ID: <20080813145741.43da1fc8.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__13_Aug_2008_14_57_41_+1000_IA9lAjkOluZ1+kVG"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:54801 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750980AbYHME5x (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 13 Aug 2008 00:57:53 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Pekka Enberg <penberg@cs.helsinki.fi>, Christoph Lameter <cl@linux-foundation.org>
Cc: linux-next@vger.kernel.org, Randy Dunlap <randy.dunlap@oracle.com>, Eduard - Gabriel Munteanu <eduard.munteanu@linux360.ro>

--Signature=_Wed__13_Aug_2008_14_57_41_+1000_IA9lAjkOluZ1+kVG
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the slab tree got a conflict in
lib/Kconfig.debug between commit 3794f3e812ef707a4f7931742274d1d0ca6597b4
("docsrc: build Documentation/ sources") from Linus' tree and commit
5db80305ad7ea891246aec24204630c2925e7b12 ("kmemtrace: Core
implementation") from the slab tree.

Just a matter of overlapping additions.  I took both sets.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__13_Aug_2008_14_57_41_+1000_IA9lAjkOluZ1+kVG
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkiiacUACgkQjjKRsyhoI8yuSACgjUnRCBn8C+qnp1j7NwBg2BAL
w28An3+H/BJAC1TlOz0Ox2ouvLrLJ5lW
=9W4P
-----END PGP SIGNATURE-----

--Signature=_Wed__13_Aug_2008_14_57_41_+1000_IA9lAjkOluZ1+kVG--
