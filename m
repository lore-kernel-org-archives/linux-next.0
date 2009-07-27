From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: v9fs tree build warning
Date: Mon, 27 Jul 2009 10:54:40 +1000
Message-ID: <20090727105440.f1bd9525.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__27_Jul_2009_10_54_40_+1000_LB7/bbMACSRuu47S"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:38316 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752056AbZG0Aym (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 26 Jul 2009 20:54:42 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Eric Van Hensbergen <ericvh@gmail.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Abhishek Kulkarni <adkulkar@umail.iu.edu>

--Signature=_Mon__27_Jul_2009_10_54_40_+1000_LB7/bbMACSRuu47S
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Eric,

Today's linux-next build (x86_64 allmodconfig) produced this warning:

fs/9p/vfs_inode.c: In function 'v9fs_get_inode':
fs/9p/vfs_inode.c:218: warning: return makes pointer from integer without a=
 cast

Introduced by commit 3cee01293a246cb6e24aef30c37ddd2e2718de9c ("9p: Fix
possible inode leak in v9fs_get_inode").

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__27_Jul_2009_10_54_40_+1000_LB7/bbMACSRuu47S
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkps+tAACgkQjjKRsyhoI8wMxgCffr8KflZWmWyeG2ZZNdKoBnaE
ojcAn0ZgHhlX6Y7v5Z1uXONV0R5ASERb
=Xjxd
-----END PGP SIGNATURE-----

--Signature=_Mon__27_Jul_2009_10_54_40_+1000_LB7/bbMACSRuu47S--
