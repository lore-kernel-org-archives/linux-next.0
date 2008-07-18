From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the ocfs2 tree
Date: Fri, 18 Jul 2008 14:40:54 +1000
Message-ID: <20080718144054.738ee965.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__18_Jul_2008_14_40_54_+1000_ryZK/fDOCrOeqxTu"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:50348 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750842AbYGRElB (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 18 Jul 2008 00:41:01 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark Fasheh <mark.fasheh@oracle.com>
Cc: linux-next@vger.kernel.org

--Signature=_Fri__18_Jul_2008_14_40_54_+1000_ryZK/fDOCrOeqxTu
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Mark,

Today's linux-next merge of the ocfs2 tree got conflicts in
fs/configfs/configfs_internal.h, fs/configfs/dir.c, fs/configfs/symlink.c
and fs/ocfs2/super.c between Linus' tree and the ocfs2 tree.

It looks like a subset of the ocfs2 tree in linux-next was submitted to
Linus - and that subset was put into a reorganised tree before submission
(please don't do that unless really necessary - what you have submitted
to Linus is no longer what has been tested in linux-next).  I used the
versions in the ocfs2 tree.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__18_Jul_2008_14_40_54_+1000_ryZK/fDOCrOeqxTu
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkiAHtYACgkQjjKRsyhoI8x1WACgrW5vry+xpEn/FeCS7awEGNvj
M20AniJpp/jDvYwwadlh+qHVEmcryhpF
=mWfR
-----END PGP SIGNATURE-----

--Signature=_Fri__18_Jul_2008_14_40_54_+1000_ryZK/fDOCrOeqxTu--
