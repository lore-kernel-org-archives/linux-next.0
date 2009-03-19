From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: s390 build failure
Date: Fri, 20 Mar 2009 10:53:07 +1100
Message-ID: <20090320105307.7e75b0dc.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__20_Mar_2009_10_53_07_+1100_eeZH9d7n2BUco.6s"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:51736 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1759928AbZCSXxU (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 19 Mar 2009 19:53:20 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Martin Schwidefsky <schwidefsky@de.ibm.com>, Heiko Carstens <heiko.carstens@de.ibm.com>
Cc: linux-next@vger.kernel.org, Rusty Russell <rusty@rustcorp.com.au>

--Signature=_Fri__20_Mar_2009_10_53_07_+1100_eeZH9d7n2BUco.6s
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's (and yesterday's) linux-next build of s390 defconfig failed like
this:

In file included from arch/s390/include/asm/tlb.h:30,
                 from arch/s390/mm/init.c:37:
arch/s390/include/asm/tlbflush.h: In function '__tlb_flush_full':
arch/s390/include/asm/tlbflush.h:54: error: incompatible type for argument =
2 of 'cpumask_equal'

Caused by a bad merge on my part.  It will be fixed today as the
conflicting commit has been removed.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__20_Mar_2009_10_53_07_+1100_eeZH9d7n2BUco.6s
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAknC2uMACgkQjjKRsyhoI8zrwQCfWA8y4jvNvbMjHAYOha5IKqVe
haYAn3ZcudMoilEXQrklZXN5Fj4v+Ddg
=Jwnx
-----END PGP SIGNATURE-----

--Signature=_Fri__20_Mar_2009_10_53_07_+1100_eeZH9d7n2BUco.6s--
