From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the xfs tree with the ext3 tree
Date: Fri, 4 Sep 2009 09:55:00 +1000
Message-ID: <20090904095500.04205407.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__4_Sep_2009_09_55_00_+1000_nDIOfB5+91cZ9WR6"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:50170 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756574AbZICXzI (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 3 Sep 2009 19:55:08 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Chinner <david@fromorbit.com>, xfs-masters@oss.sgi.com
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jan Kara <jack@suse.cz>, Christoph Hellwig <hch@lst.de>, Felix Blyakher <felixb@sgi.com>

--Signature=_Fri__4_Sep_2009_09_55_00_+1000_nDIOfB5+91cZ9WR6
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the xfs tree got a conflict in
fs/xfs/linux-2.6/xfs_lrw.c between commit
218604a0bf712976171798b1dd5c44d26d6d0ea4 ("xfs: Convert sync_page_range()
to simple filemap_write_and_wait_range()") from the ext3 tree and commit
13e6d5cdde0e785aa943810f08b801cadd0935df ("xfs: merge fsync and O_SYNC
handling") from the xfs tree.

They both do the same thing (to this bit of code) ... I used the version
from the xfs tree.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__4_Sep_2009_09_55_00_+1000_nDIOfB5+91cZ9WR6
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkqgV1QACgkQjjKRsyhoI8ziQQCdGHOw+/mptt+GHdFbKGBmQa3j
xqgAoIxaYf8/uwdfIOX4wb0E4jDHzBmV
=A3Xk
-----END PGP SIGNATURE-----

--Signature=_Fri__4_Sep_2009_09_55_00_+1000_nDIOfB5+91cZ9WR6--
