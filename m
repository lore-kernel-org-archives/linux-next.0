From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the vfs tree with the f2fs tree
Date: Mon, 13 Apr 2015 11:53:08 +1000
Message-ID: <20150413115308.09ef2264@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/_jlPHSAGzuZjY14u2Cphwr_"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:46111 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752502AbbDMBxc (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 12 Apr 2015 21:53:32 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Al Viro <viro@ZenIV.linux.org.uk>, Jaegeuk Kim <jaegeuk@kernel.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, David Howells <dhowells@redhat.com>

--Sig_/_jlPHSAGzuZjY14u2Cphwr_
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Al,

Today's linux-next merge of the vfs tree got a conflict in
fs/f2fs/f2fs.h between commit 510022a85839 ("f2fs: add F2FS_INLINE_DOTS
to recover missing dot dentries") from the f2fs tree and commit
5dd3dc06371a ("VFS: normal filesystems (and lustre): d_inode()
annotations") from the vfs tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc fs/f2fs/f2fs.h
index 053361ace0ec,02e4ab3e7d4d..000000000000
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@@ -1481,8 -1391,8 +1481,8 @@@ bool f2fs_empty_dir(struct inode *)
 =20
  static inline int f2fs_add_link(struct dentry *dentry, struct inode *inod=
e)
  {
- 	return __f2fs_add_link(dentry->d_parent->d_inode, &dentry->d_name,
+ 	return __f2fs_add_link(d_inode(dentry->d_parent), &dentry->d_name,
 -				inode);
 +				inode, inode->i_ino, inode->i_mode);
  }
 =20
  /*

--Sig_/_jlPHSAGzuZjY14u2Cphwr_
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVKyGaAAoJEMDTa8Ir7ZwV2KIP/2m7L/b2jAvkk29oL0EPZv7F
gr3EvK4ds3E/oAd44i3Mq+yNFIRQ4vBztFXO12WtiOBKQwFvrGKPHrEFgST2HGb/
H/PjuV+1a7gVa32fBOaEDVrzeDRy6emHMg7AJkNPW+asJCkBN8NfJM5UsDq9PCuN
TTr+hDSFlZRipi2Wu2PwtKRB5C4Ao1hOb4fCv8gGOUlQACfeUcqr7pftw2P8Vpz0
gDSQyxqYwQCZu9Swe6oIeJlhcgjK12UrvOOm+VLn+4zOqptSsWwuHDXXGIuu5+ev
UGu/Hx+KNAIRsgbiWOJhgsv/13LQ4E2tfZbZIhwIXW95ubbUFq3h1/LKvCwFsyGt
QacAkZjlTVVHMQd18/TF7o5prgqWtKZEVz4rXDtVz5hWERdq7Du2yqXBb0fNt3ng
dJZkpLn8douCzxN7vV+335sLG1CB+2zmQZ2AXlz6DBIsZMPhjw/rugZq+9v2trNM
ok2GsBq8bNxBXwGu7DlhMhhtfc9LrgK7RMHFkYhxVYqVL6CNdD3FQWo2Jho68HTQ
onoIQ/eVe9OebrMGE0vwxJPLK/19jdFLgulnGW10x7IiVOUuCyjpQj8xtv48FfUI
a5vn5kIVZIb5mlfj6z9tNAJAv4R3JCtd5xmqS23XWnl/JRMuIXXlnX4J2JtZ/0sy
gYnvOHGSCTJXnkHtq2CM
=0C84
-----END PGP SIGNATURE-----

--Sig_/_jlPHSAGzuZjY14u2Cphwr_--
