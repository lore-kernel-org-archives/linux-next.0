From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the security-testing tree
Date: Tue, 2 Dec 2008 15:06:33 +1100
Message-ID: <20081202150633.79aabc0b.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__2_Dec_2008_15_06_33_+1100_cdrHz8zAkCuN1zIU"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:36698 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751797AbYLBEGq (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 1 Dec 2008 23:06:46 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: James Morris <jmorris@namei.org>
Cc: linux-next@vger.kernel.org, Christoph Hellwig <hch@infradead.org>, Tim Shimmin <tes@sgi.com>, David Chinner <david@fromorbit.com>, Lachlan McIlroy <lachlan@sgi.com>, xfs-masters@oss.sgi.com, David Howells <dhowells@redhat.com>

--Signature=_Tue__2_Dec_2008_15_06_33_+1100_cdrHz8zAkCuN1zIU
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi James,

Today's linux-next merge of the security-testing tree got a conflict in
fs/xfs/xfs_vnodeops.h between commit
ea5a3dc8356bf1cf27bab9a5a0da5dfbbb82013d ("[XFS] kill sys_cred") from the
xfs tree and commit b6dff3ec5e116e3af6f537d4caedcad6b9e5082a ("CRED:
Separate task security context from task_struct") from the
security-testing tree.

I fixed it up (by using the xfs tree version - since that removed the
parameters that the latter changed) and can carry the fix as necessary.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/


--Signature=_Tue__2_Dec_2008_15_06_33_+1100_cdrHz8zAkCuN1zIU
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkk0tEkACgkQjjKRsyhoI8x4xQCgvkEROKYql3foLQNUNRmoeADD
/fYAnRn4ofD4zWioW64JFkynEfi89BBa
=a8z+
-----END PGP SIGNATURE-----

--Signature=_Tue__2_Dec_2008_15_06_33_+1100_cdrHz8zAkCuN1zIU--
