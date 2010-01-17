From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the vfs tree with the gfs2 tree
Date: Mon, 18 Jan 2010 10:55:56 +1100
Message-ID: <20100118105556.230beb08.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__18_Jan_2010_10_55_56_+1100_K_QTejvRrdeYVoW0"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:55861 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932082Ab0AQX4F (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 17 Jan 2010 18:56:05 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Al Viro <viro@ZenIV.linux.org.uk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>, Steven Whitehouse <swhiteho@redhat.com>

--Signature=_Mon__18_Jan_2010_10_55_56_+1100_K_QTejvRrdeYVoW0
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Al,

Today's linux-next merge of the vfs tree got a conflict in
fs/gfs2/ops_inode.c between commit
83c77e8b3457f2ee5dad028dc54cf3ce540104b2 ("GFS2: Fix refcnt leak on
gfs2_follow_link() error path") from the gfs2 tree and commit
261a144ac2b3867c7be70f08925e446430df6937 ("Switch gfs2 to nd_set_link()")
from the vfs tree.

I can't figure out if the gfs2 tree fix is required any more, so I just
used the vfs tree version.

Al, if that gfs2 patch is standalone, you should probably send it to the
gfs2 guys.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__18_Jan_2010_10_55_56_+1100_K_QTejvRrdeYVoW0
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAktTo4wACgkQjjKRsyhoI8zrlgCfU1Grfdikfen/pkqf87aEiq0z
te4AmwXEvYrHadlJUMuO303z/ARrWOR3
=nkpZ
-----END PGP SIGNATURE-----

--Signature=_Mon__18_Jan_2010_10_55_56_+1100_K_QTejvRrdeYVoW0--
