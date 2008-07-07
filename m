From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the generic-ipi tree
Date: Tue, 8 Jul 2008 02:46:52 +1000
Message-ID: <20080708024652.3ede4029.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__8_Jul_2008_02_46_52_+1000_OJkjPLrnmMNDuudQ"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:54225 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753356AbYGGQq7 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 7 Jul 2008 12:46:59 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>, Jens Axboe <jens.axboe@oracle.com>
Cc: linux-next@vger.kernel.org, Yinghai Lu <yhlu.kernel@gmail.com>

--Signature=_Tue__8_Jul_2008_02_46_52_+1000_OJkjPLrnmMNDuudQ
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Ingo,

Today's linux-next merge of the generic-ipi tree got a conflict in
arch/x86/kernel/setup.c between commit
f31174007a74d6866968a37520c40e7d0e11cb5a ("Merge commit
'pci/linux-next'") from the merge of the pci tree and commit
a37ec98ac0a44bd0314c20ce866a33091055a6b6 ("x86: move reserve_setup_data
to setup.c") from the generic-ipi tree.

Just a contextual conflict.  I fixed it up and will carry the fix.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__8_Jul_2008_02_46_52_+1000_OJkjPLrnmMNDuudQ
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhySHwACgkQjjKRsyhoI8yw5ACdHB9m0e+0YZY6c2B6y0M8tqDC
N5cAoJolbQDk2Yw/gwujZsCpwnfonm4W
=Rz2z
-----END PGP SIGNATURE-----

--Signature=_Tue__8_Jul_2008_02_46_52_+1000_OJkjPLrnmMNDuudQ--
