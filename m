From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: vfs tree build failure
Date: Thu, 7 May 2009 13:53:33 +1000
Message-ID: <20090507135333.2871582a.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__7_May_2009_13_53_33_+1000_NNvWEF=DVrRbCZg5"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:43947 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752808AbZEGDyA (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 6 May 2009 23:54:00 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Al Viro <viro@ZenIV.linux.org.uk>
Cc: linux-next@vger.kernel.org, Christoph Hellwig <hch@lst.de>

--Signature=_Thu__7_May_2009_13_53_33_+1000_NNvWEF=DVrRbCZg5
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Al,

Today's linux-next build (x86_64 allmodconfig) failed like this:

fs/cachefiles/interface.c: In function 'cachefiles_sync_cache':
fs/cachefiles/interface.c:357: error: 'sb' undeclared (first use in this fu=
nction)

Caused by commit d8f9cc04fdc69bff74a835b2895acb46cd08999b ("enforce
->sync_fs is only called for rw superblock").

I have used the version of the vfs tree from next-20090506 for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__7_May_2009_13_53_33_+1000_NNvWEF=DVrRbCZg5
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkoCWz0ACgkQjjKRsyhoI8y3xwCgjeCTrXlPRSJmYZYVJZPUk3nY
3lEAniyOgcDHkmvhkFqxiEdbRNONCOu6
=n0y0
-----END PGP SIGNATURE-----

--Signature=_Thu__7_May_2009_13_53_33_+1000_NNvWEF=DVrRbCZg5--
