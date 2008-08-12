From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the vfs tree
Date: Tue, 12 Aug 2008 15:01:24 +1000
Message-ID: <20080812150124.2dbe6fba.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__12_Aug_2008_15_01_24_+1000_zeBjXzZ2HFS3xI19"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:34615 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751155AbYHLFB4 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 12 Aug 2008 01:01:56 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Al Viro <viro@ZenIV.linux.org.uk>
Cc: linux-next@vger.kernel.org, Christoph Hellwig <hch@lst.de>, David Chinner <david@fromorbit.com>, xfs-masters@oss.sgi.com

--Signature=_Tue__12_Aug_2008_15_01_24_+1000_zeBjXzZ2HFS3xI19
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Al,

Today's linux-next merge of the vfs tree got a conflict in
fs/xfs/linux-2.6/xfs_iops.c between commit
293a47c282254cbae1c96cfb2e242e57c050f5c7 ("[XFS] In several places we
directly convert from the XFS inode to the") from the xfs tree and commit
c019d29bf7a7989cab5adfeb4d46c507ea9db087 ("change d_add_ci argument
ordering") from the vfs tree.

I did the obvious fixup and can carry it.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__12_Aug_2008_15_01_24_+1000_zeBjXzZ2HFS3xI19
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkihGSQACgkQjjKRsyhoI8yCgQCgrK8JE6c7zoeEnyvPHrVEuk/b
6G4AoL8KOvbx2vtz/TPS3YmWETdMP08v
=lSAT
-----END PGP SIGNATURE-----

--Signature=_Tue__12_Aug_2008_15_01_24_+1000_zeBjXzZ2HFS3xI19--
