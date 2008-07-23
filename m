From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the ide tree
Date: Wed, 23 Jul 2008 14:06:03 +1000
Message-ID: <20080723140603.4bd704a6.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__23_Jul_2008_14_06_03_+1000_U.fcnKXE/56XMq/l"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:44760 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751997AbYGWEGJ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 23 Jul 2008 00:06:09 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>
Cc: linux-next@vger.kernel.org, David Miller <davem@davemloft.net>

--Signature=_Wed__23_Jul_2008_14_06_03_+1000_U.fcnKXE/56XMq/l
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Bart,

Today's linux-next merge of the ide tree got conflicts in
include/asm-sparc/ide_32.h and include/asm-sparc/ide_64.h between commit
6662327e190a20bd42867f11abca095badee56e1 ("ide: merge
<asm-sparc/ide_64.h> with <asm-sparc/ide_32.h>") from the sparc-current
tree and commit 41a69a4b23f34977d11aacf1d56614f1c983d856 ("ide: define
MAX_HWIFS in <linux/ide.h>") from the ide tree.

I removed the appropriate lines from the merged file.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__23_Jul_2008_14_06_03_+1000_U.fcnKXE/56XMq/l
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkiGrisACgkQjjKRsyhoI8wS3ACdEPcw7p3tqyVYuRLnMmohyAqn
iWgAn0gtK+D0j1hvf1j+od8YZqNeeiED
=XHQX
-----END PGP SIGNATURE-----

--Signature=_Wed__23_Jul_2008_14_06_03_+1000_U.fcnKXE/56XMq/l--
