From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: stats
Date: Fri, 3 Aug 2012 14:38:56 +1000
Message-ID: <20120803143856.26e37ac47cb11871669a19bd@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Fri__3_Aug_2012_14_38_56_+1000_aD_kA9fC2PnI0VfY"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from haggis.pcug.org.au ([203.10.76.10]:54803 "EHLO
	members.tip.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750744Ab2HCEjE (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 3 Aug 2012 00:39:04 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: linux-next@vger.kernel.org, Linus <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>

--Signature=_Fri__3_Aug_2012_14_38_56_+1000_aD_kA9fC2PnI0VfY
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Well here are this merge windows' stats:

(No merge commits counted, next-20120722 is the first linux-next after
v3.5)

Commits in v3.6-rc1 (relative to v3.5): 8587
Commits in next-20120521:		9245
Commits with the same SHA1:		6711
Commits with the same patch_id:		 640	(1)
Commits with the same subject line:	  72	(1)

(1) not counting those in the lines above.

So commits in -rc1 that were "in" next-20120722:	7423	86.4%
Commits in -rc1 that were not in next-20120722:		1164	13.6%

Again, not too bad, but it would be nice to figure out where the last lot
came from.  I have the "git log --oneline --no-walk" list if someone wants =
them.

Some break down of the onlines list:
	grep for btrfs gives 68 commits
	         media gives 155
		 rdb gives 43
		 ceph gives 62
		 drm gives 69

As for the 1823 commits left in linux-next ... 1191 are in the kvmtool
tree (most of these are in the tip tree as well - this has been pending a
merge to Linus since before 3.2 ...)

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Signature=_Fri__3_Aug_2012_14_38_56_+1000_aD_kA9fC2PnI0VfY
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBCAAGBQJQG1XgAAoJEECxmPOUX5FEbH4P/idh5zisREOeSHMDZON7fXZE
YN+Mv6xF18HjcoXIIJ3wKBfZ0BIzdHBeFcpaEBYvx/3GZXDEfHogixrFbLmyMbbw
l2BbRDd6MNlq+S4y/WgRywFkZSl1dBlHZoVXJRejlHghRQ22jeZnBRHqVY5pB3zt
cXHXybhuAfVLdlqKMo5eaUTp5Wj0JzuEDbI8yS9hWUdhAxsWBVTmdMzQHHS1SBQm
ihV2/Hdwc2/mRVmi00R1H6ev9f0+iFQkcFLu1YBLS2zOSfOYGAeIynmLW+noosKR
5BoC3Sk86YOEdkvP1W8czGG7C5sEm2oi/zpRAnCOR4n05sDLhX/2IalimQgmk/u6
sXI2IRRozLpcs65INVtQV4N9f2GrokMkDHCGWD6mMd6o3Phs5y2Yv7o/j2xmJqRS
KdsOpMancsAN9Pl+xeE1wD5imAMsbA0yn8wwKrVf7PMUZUFX60W33CVr+sqktoWh
jNDlZ+hIcrf9P0amU95YS2RnDwuYjNkh89bDbeCjNJhYFgTlXsKfPE+ZET8H2NDu
wSZIuNiDQCi0+65ftxmsG/rbpkDTh3cuIST5vnBiQAXowradrvAmswQARk2YE9WY
UDRydkFPeS+AWX3/m1gp8k1sPMFcd90rh25UrlQyDUAcrCbmXDDSnRaGX/+N1rLI
ysY7KQaBvMoJphMtJ3qU
=/99k
-----END PGP SIGNATURE-----

--Signature=_Fri__3_Aug_2012_14_38_56_+1000_aD_kA9fC2PnI0VfY--
