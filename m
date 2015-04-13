From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the vfs tree with the xfs tree
Date: Mon, 13 Apr 2015 11:57:37 +1000
Message-ID: <20150413115737.6ec67270@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/iEH1YIDf_QrcK4=TQ9kKEXb"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:38594 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752143AbbDMB5i (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 12 Apr 2015 21:57:38 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Al Viro <viro@ZenIV.linux.org.uk>, Ben Myers <bpm@sgi.com>, David Chinner <david@fromorbit.com>, xfs@oss.sgi.com
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, David Howells <dhowells@redhat.com>

--Sig_/iEH1YIDf_QrcK4=TQ9kKEXb
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Al,

Today's linux-next merge of the vfs tree got a conflict in
fs/xfs/xfs_iops.c between commit e8e9ad42c1f1 ("xfs: take i_mmap_lock
on extent manipulation operations") from the xfs tree and commit
5dd3dc06371a ("VFS: normal filesystems (and lustre): d_inode()
annotations") from the vfs tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc fs/xfs/xfs_iops.c
index 015d6a366b16,54b95232d946..000000000000
--- a/fs/xfs/xfs_iops.c
+++ b/fs/xfs/xfs_iops.c
@@@ -953,13 -975,9 +953,13 @@@ xfs_vn_setattr
  		uint		iolock =3D XFS_IOLOCK_EXCL;
 =20
  		xfs_ilock(ip, iolock);
- 		error =3D xfs_break_layouts(dentry->d_inode, &iolock);
+ 		error =3D xfs_break_layouts(d_inode(dentry), &iolock);
 -		if (!error)
 +		if (!error) {
 +			xfs_ilock(ip, XFS_MMAPLOCK_EXCL);
 +			iolock |=3D XFS_MMAPLOCK_EXCL;
 +
  			error =3D xfs_setattr_size(ip, iattr);
 +		}
  		xfs_iunlock(ip, iolock);
  	} else {
  		error =3D xfs_setattr_nonsize(ip, iattr, 0);

--Sig_/iEH1YIDf_QrcK4=TQ9kKEXb
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVKyKRAAoJEMDTa8Ir7ZwVi3YP/iRdVaFVy0eBuYzW7IHUP85U
24N+LJApUHOY8hM5GAF8lY5ifDthwBolhimCVFgO8mLbB2P2+UjTilav9r8CI5dT
PrwBP1C7Y5MxQt1kWrlpyV/Q8dQAodcEHDujXscPnDeEEL++tW9K+BzKrNANRF5E
x2cmT81bITQ4ARZCMG+q5FsaqoQxO9yv7bhM0CKEbPkAmg9peezUxP2MUhq8S6S9
qlz1Y6lKAl5px5R7SWzkWYBokdDA79s4xvnVTFWU7TH8ydaYxolfVR758ygu207b
DPqC5abQVR0y4K9NsWo2vUG6QwT75kfvY9qm+rx5sc2QJm3lkcqltYlUOJXmrAVm
l7d/Ddw2I+VRgL7axd1aDTahPDTXk1lKfV9bAoHZbYp9ODtKky7/j4NBnBpUtU43
pHNuF+Q9uebti/YkGHdNKfXEWXUp+P2TuiK5XdQ8oUS6W4PQLP4OwCX94Cn6oJk/
335rryoERycF/mIYGC5rPL7NlQtrb4M+Gz+YYTQDXUyIdFNHJhnK8M7RK8G6Xb/g
bRrkrwY0sHU+4m9khfaT/Qdr3jsVEVwBXP6GH1C7ZN+2rlqy9NANaQ+1cmTnUZis
AubhLD4K+NOFcE7ux7Z64tbuQln1YNiDj1xZo8VgBceQ3Zix+jcc2GsBYPJPwgs0
rXc5L1+VnVcKY2cs4QBu
=1B9g
-----END PGP SIGNATURE-----

--Sig_/iEH1YIDf_QrcK4=TQ9kKEXb--
