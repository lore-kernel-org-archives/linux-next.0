From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: s390 build failure
Date: Fri, 20 Jun 2008 12:42:35 +1000
Message-ID: <20080620124235.24fbe33e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__20_Jun_2008_12_42_35_+1000_bz4548y4z_YnAEX8"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:37627 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751829AbYFTCmu (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 19 Jun 2008 22:42:50 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Martin Schwidefsky <schwidefsky@de.ibm.com>
Cc: linux-next@vger.kernel.org, Jens Axboe <jens.axboe@oracle.com>

--Signature=_Fri__20_Jun_2008_12_42_35_+1000_bz4548y4z_YnAEX8
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Martin,

Starting with next-20080613, the linux-next build (s390 defconfig s390x
compiler) has failed with these errors:

In file included from /scratch/michael/kisskb-build/src/include/linux/spinl=
ock.h:87,
                 from /scratch/michael/kisskb-build/src/include/linux/smp.h=
:11,
                 from /scratch/michael/kisskb-build/src/include/linux/kerne=
l_stat.h:4,
                 from /scratch/michael/kisskb-build/src/mm/memory.c:41:
include2/asm/spinlock.h: In function '__raw_spin_lock':
include2/asm/spinlock.h:69: error: implicit declaration of function 'smp_pr=
ocessor_id'

There are others as well, but I was concentrating on this.  Bisecting
leads to commit 2448ad3d8e64a9b58acca34a3d010cfa0be88cc1 which is the
merge of the block tree.  The block tree contains a commit
(37e81b98dba08cce1d8eedb2bdaa58022bf31ee0 "Add generic helpers for arch
IPI function calls") that adds an include of linux/spinlock.h to
linux/smp.h. (asm-s390/spinlock.h includes linux/smp.h ...)

But the block tree itself is OK.  So something in the s390 tree is
interacting with the above commit to cause the failure.  It is not
immediately obvious to me what that is. (Or I may have screwed up the
bisect :-))

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__20_Jun_2008_12_42_35_+1000_bz4548y4z_YnAEX8
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhbGRsACgkQTgG2atn1QN+DWgCffBLwGtTFIrjbux2xbOrQLEb5
mfIAoIKbnij76APYLKRpUf+2BRolvNYy
=Qbth
-----END PGP SIGNATURE-----

--Signature=_Fri__20_Jun_2008_12_42_35_+1000_bz4548y4z_YnAEX8--
