From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the userns tree with the block tree
Date: Wed, 3 Jun 2015 18:46:48 +1000
Message-ID: <20150603184648.6d2481e1@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/rGi7Iy.x+xJZgRIX+NgPsXE"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:33895 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753094AbbFCIq5 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 3 Jun 2015 04:46:57 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Eric W. Biederman" <ebiederm@xmission.com>, Jens Axboe <axboe@kernel.dk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Tejun Heo <tj@kernel.org>

--Sig_/rGi7Iy.x+xJZgRIX+NgPsXE
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Eric,

Today's linux-next merge of the userns tree got a conflict in
include/linux/fs.h between commit 89e9b9e07a39 ("writeback: add
{CONFIG|BDI_CAP|FS}_CGROUP_WRITEBACK") from the block tree and commit
1b852bceb0d1 ("mnt: Refactor the logic for mounting sysfs and proc in a
user namespace") from the userns tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc include/linux/fs.h
index fe0dcaa3a789,571aab91bfc0..000000000000
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@@ -1913,7 -1897,7 +1913,8 @@@ struct file_system_type=20
  #define FS_HAS_SUBTYPE		4
  #define FS_USERNS_MOUNT		8	/* Can be mounted by userns root */
  #define FS_USERNS_DEV_MOUNT	16 /* A userns mount does not imply MNT_NODEV=
 */
- #define FS_CGROUP_WRITEBACK	32	/* Supports cgroup-aware writeback */
+ #define FS_USERNS_VISIBLE	32	/* FS must already be visible */
++#define FS_CGROUP_WRITEBACK	64	/* Supports cgroup-aware writeback */
  #define FS_RENAME_DOES_D_MOVE	32768	/* FS will handle d_move() during ren=
ame() internally. */
  	struct dentry *(*mount) (struct file_system_type *, int,
  		       const char *, void *);

--Sig_/rGi7Iy.x+xJZgRIX+NgPsXE
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVbr79AAoJEMDTa8Ir7ZwVqacP/3Bgr8QbbLJhhnzvEovfOhl5
1Zp398+WkBA3+M0WSTM3kXtLR6dcASiidsxD35IEsZVSWtdCZAaWYxogIUY40evj
HAeZ89URaWLvaQd/g1CD2aOsYp24SXOd/eus0gYt/lJypJfkaDXRqOQ0ckh8Ca1B
GYzW/Rm1X3pEOJyjG7BzosBczMq6XRhm4PmTEc5DI0+pSz0s8PoUwy0QM8q9kWs1
SMjYZ/S1zPJdQOzIPMg3ycyWJoEV78k55mCPHdbeQDzCffm9LfKN6zNO6UDZqHY8
D/mrhAvw51ljImVz0TXs8urB1iNpuGityZvJLq71GT5jy9ENPGy8SR/moSqju/Qz
ev2TaGHuz7PNLVlIiWqejY1lsKWoN/OlmE2aFrIUNrlzOB/C10iGm5+QfwL2j0EQ
K/GpR/CXWJuPFJ64PILieN9B4VLohqHIz/a05hLWFTIuFQ/tOtsPKL3Q6i1OrlFP
W2esvN0sn5a/drJUAQcMxUikwud1b41miOirsICBhRzSR9wJ6MGLvBkafPXFZnWk
+E/5RmlNwmJmvTGp01SGFNht1czc+5TfwTzP46BO0z1HJBiBz+XKWkjDa/sZDjlb
WG0WJcE+mt05r2Yqa2pg9ilUGCSC2ULxfoJImES//6GRoo1uPzpSbkBuRNbz7djR
7UqVctScjEGIChMXC3AY
=DO3u
-----END PGP SIGNATURE-----

--Sig_/rGi7Iy.x+xJZgRIX+NgPsXE--
