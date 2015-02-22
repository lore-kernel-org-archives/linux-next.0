From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the vfs tree with Linus' tree
Date: Sun, 22 Feb 2015 11:46:51 +1100
Message-ID: <20150222114651.0578e72a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/ScE4louVk8yICCaETK6TxCb"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:40905 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751730AbbBVAq6 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sat, 21 Feb 2015 19:46:58 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Al Viro <viro@ZenIV.linux.org.uk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Mike Marciniszyn <mike.marciniszyn@intel.com>, David Howells <dhowells@redhat.com>

--Sig_/ScE4louVk8yICCaETK6TxCb
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Al,

Today's linux-next merge of the vfs tree got a conflict in
drivers/infiniband/hw/qib/qib_fs.c between commit 041af0bb765a
("IB/qib: Fix sizeof checkpatch warnings") from Linus' tree and commit
271b063723fd ("VFS: (Scripted) Convert ->d_inode to fs_inode() in
drivers/infiniband/hw/qib/qib_fs.c") from the vfs tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc drivers/infiniband/hw/qib/qib_fs.c
index 55f240a363fe,88cc9a288ccd..000000000000
--- a/drivers/infiniband/hw/qib/qib_fs.c
+++ b/drivers/infiniband/hw/qib/qib_fs.c
@@@ -481,8 -481,8 +481,8 @@@ static int remove_device_files(struct s
  	int ret, i;
 =20
  	root =3D dget(sb->s_root);
- 	mutex_lock(&root->d_inode->i_mutex);
+ 	mutex_lock(&fs_inode(root)->i_mutex);
 -	snprintf(unit, sizeof unit, "%u", dd->unit);
 +	snprintf(unit, sizeof(unit), "%u", dd->unit);
  	dir =3D lookup_one_len(unit, root, strlen(unit));
 =20
  	if (IS_ERR(dir)) {

--Sig_/ScE4louVk8yICCaETK6TxCb
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJU6ScAAAoJEMDTa8Ir7ZwV4ZYP/2q/Pu7H/aU603DCNiSD7EyL
P6ex31QwC55ymbLlIYSKAEAP05A41wvTMjnk/0oZVWGUMB2cjfMjhBfNCRifBKa7
cU+M5f2tBzykFxw+i6qQsmaLwc5EydXvlE7fLKO10uua0w5eOE6i8pcG0Bugrfz0
6N8XaFBE9aPN108Ekwv4JBJVdUXYjxiu1bQGfZ43MUfUrTirBqYbIHa1tFWR+3U8
hCDuacNGQ08HhPct4smRtFf6zPxrjARYpFCLtKKLxCzsXcyMYHzgZLOtD6Q6/UHH
mvmrlppp3ymGZ7NVN0oM/v49WZqaEcGFBFTGpMK/mquY4pcsFAE3U2EYZa+htiHW
vJ6hHayDvK8DaQzonu1eLvwjVoMwwhvVkVGJyzcalMQvzInV5/GTjwimbfI4RijL
nz3XLwvLww/BnC4ZQLG1F7unW4a/hUfc5Z2SPJXooNff3fp0mVO8ypRvCwrrOqnD
xK62CZGbcFuw2ndvh/tXYr/uKZHpkTeW3diEVN6jGXBjpvFGxA1Eg745l0KJYpQJ
sHWJirvVg7e+eadsUCUVDpjlNVEkM6hSzGLDrYN+PzK5bUOcGHf0nIF4bsSX9cVu
xNfmQXkc+QiG2vIjKmr/x5FQpJg7U0YT+79FYl46uvJm5adsdvaHfNyKLARxbybn
it7tldskJR36ri1k090q
=iC9H
-----END PGP SIGNATURE-----

--Sig_/ScE4louVk8yICCaETK6TxCb--
