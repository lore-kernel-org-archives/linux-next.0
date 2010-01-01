From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: agp tree build failure
Date: Fri, 1 Jan 2010 11:03:27 +1100
Message-ID: <20100101110327.425e0a0d.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__1_Jan_2010_11_03_27_+1100_/yerdMF3Gfe5Qg_4"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:44526 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751184Ab0AAADu (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 31 Dec 2009 19:03:50 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dave Airlie <airlied@linux.ie>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, FUJITA Tomonori <fujita.tomonori@lab.ntt.co.jp>, Andrew Morton <akpm@linux-foundation.org>

--Signature=_Fri__1_Jan_2010_11_03_27_+1100_/yerdMF3Gfe5Qg_4
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next build (x86_64 allmodconfig) failed like this:

drivers/char/agp/amd64-agp.c: In function '__exittest':
drivers/char/agp/amd64-agp.c:782: error: 'agp_amd64_cleanup' undeclared (fi=
rst use in this function)

Caused by commit f405d2c02395a74d3883bd03ded36457aa3697ad ("x86/agp: Fix
agp_amd64_init() initialization with CONFIG_GART_IOMMU enabled") from the
origin tree interacting with commit
e85c5c6542528aba88a5d811652cf0e2d44f7f07 ("drivers/char/agp/amd64-agp.c:
squish warning") from the agp tree.

I reverted the agp tree commit.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__1_Jan_2010_11_03_27_+1100_/yerdMF3Gfe5Qg_4
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAks9O88ACgkQjjKRsyhoI8wWXQCgqfwKMCF2GnMqcYKQzcqxJY5N
NlkAnj9dfNWi0RA0iwWnmx6zWWZR42iO
=458C
-----END PGP SIGNATURE-----

--Signature=_Fri__1_Jan_2010_11_03_27_+1100_/yerdMF3Gfe5Qg_4--
