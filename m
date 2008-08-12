From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: ide tree build failure
Date: Tue, 12 Aug 2008 11:18:01 +1000
Message-ID: <20080812111801.7c701498.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__12_Aug_2008_11_18_01_+1000__k9L9QGCagL.sgzN"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:51086 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750781AbYHLBSY (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 11 Aug 2008 21:18:24 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>
Cc: linux-next@vger.kernel.org, Borislav Petkov <petkovbb@gmail.com>, David Miller <davem@davemloft.net>, Geert Uytterhoeven <geert@linux-m68k.org>, Ralf Baechle <ralf@linux-mips.org>

--Signature=_Tue__12_Aug_2008_11_18_01_+1000__k9L9QGCagL.sgzN
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Bart,

The linux-next build for 20080808 and later failed like this (on at least
sparc, mips and m68k):

drivers/ide/ide-floppy.c:223: error: implicit declaration of function `sg_p=
age'
drivers/ide/ide-floppy.c:232: error: implicit declaration of function `sg_v=
irt'
drivers/ide/ide-floppy.c:242: error: implicit declaration of function `sg_n=
ext'

Caused by commit 788fc238e7b95dae0ff1e2e7c97351289277deea ("ide-floppy:
use scatterlists for pio transfers") which intrduced usages of the sg_
routines but did not include <linux/scatterlist.h>.

I will add an include of <linux/scatterlist.h> near the top of
drivers/ide/ide-floppy.c in linux-next today.  It would be good if the
above patch was fixed up, or another patch added to the ide tree fixing
this.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__12_Aug_2008_11_18_01_+1000__k9L9QGCagL.sgzN
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkig5MoACgkQjjKRsyhoI8wcRwCfbLL1vAvN4Fs8sVgl69quPU1o
lCkAoJcqW6Wex/6q5Hl6lQBmnpKVj4vE
=XxKD
-----END PGP SIGNATURE-----

--Signature=_Tue__12_Aug_2008_11_18_01_+1000__k9L9QGCagL.sgzN--
