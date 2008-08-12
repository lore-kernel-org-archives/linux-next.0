From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the vfs tree
Date: Tue, 12 Aug 2008 15:20:37 +1000
Message-ID: <20080812152037.b7de321f.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__12_Aug_2008_15_20_37_+1000_Qx6maq/UH38cbRds"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:35261 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750705AbYHLFUr (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 12 Aug 2008 01:20:47 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Al Viro <viro@ZenIV.linux.org.uk>
Cc: linux-next@vger.kernel.org, Julia Lawall <julia@diku.dk>, "J. Bruce Fields" <bfields@fieldses.org>

--Signature=_Tue__12_Aug_2008_15_20_37_+1000_Qx6maq/UH38cbRds
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Al,

Today's linux-next merge of the vfs tree got a conflict in
fs/nfsd/export.c between commit 53e6d8d182e97c5211da4ee1f163c840c7ecf8ca
("fs/nfsd/export.c: Adjust error handling code involving
auth_domain_put") from the nfsd tree and commit
eec56f5904cd79d7cf99efd74ad02f39c829fff1 ("switch nfsd to kern_path()")
from the vfs tree.

The conflict is contextual. I fixed it up and can carry the fixup.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__12_Aug_2008_15_20_37_+1000_Qx6maq/UH38cbRds
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkihHaUACgkQjjKRsyhoI8y+EQCeKLAq//pGCi4o4aYH9KYCjJ9a
M1wAn1lDppwOzkk6bu5qRHwsM/PPG4Bt
=JwI2
-----END PGP SIGNATURE-----

--Signature=_Tue__12_Aug_2008_15_20_37_+1000_Qx6maq/UH38cbRds--
