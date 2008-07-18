From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the vfs tree
Date: Fri, 18 Jul 2008 15:27:58 +1000
Message-ID: <20080718152758.2b6bc862.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__18_Jul_2008_15_27_58_+1000_gGCsS+C9BHdXa42L"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:51395 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750935AbYGRF2F (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 18 Jul 2008 01:28:05 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Al Viro <viro@ZenIV.linux.org.uk>
Cc: linux-next@vger.kernel.org, Miklos Szeredi <mszeredi@suse.cz>

--Signature=_Fri__18_Jul_2008_15_27_58_+1000_gGCsS+C9BHdXa42L
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Al,

Today's linux-next merge of the vfs tree got a conflict in
security/dummy.c between commit 5915eb53861c5776cfec33ca4fcc1fd20d66dd27
("security: remove dummy module") from the  tree and commit
3a889e59496c03e409b66afa3ac9d91b6ff8a937 ("[PATCH] get rid of passing
nameidata to security_inode_permission()") from the vfs tree.

I removed the file.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__18_Jul_2008_15_27_58_+1000_gGCsS+C9BHdXa42L
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkiAKd4ACgkQjjKRsyhoI8ynqgCglYaIHNXuBPn5p7kg29yrtT4J
d+gAn0sSYdVJjxFpvjDm0tSNXwoyuDk0
=2dEQ
-----END PGP SIGNATURE-----

--Signature=_Fri__18_Jul_2008_15_27_58_+1000_gGCsS+C9BHdXa42L--
