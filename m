Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C837539DBF9;
	Tue, 10 Mar 2026 13:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773148865; cv=none; b=Fg+y8uLOx7SAnvOmeaR8K28N7PxBXiUBD+bNp/EcSXQQR9OlBcuRy3BAjf9MHOMQl7iPv9qDBCn7PFyyBJPBBOTN1eoyIRBSL905qhkZ6I4UJ2Tyns7geqDMcltbn9URQOh0AuwbyvPbpD7xKEb4PXQOP3I9gzoXP+UqKcghWkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773148865; c=relaxed/simple;
	bh=c+BZ8y0X9zvIcVdjPyEpvY2CXeG9uw0Y/psx09nXjTs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BjLexlXqn5PV6S9xaY8M8jXftcdieaFDVk5F9HesQN430H1Ube3kg51cQEfWXsEljH1mHn53INQnkvaAe7ZzzdputTull9eU8wexfs0WcEYKoFuq1hKIur20bvBderep4tmXgjvIySKlrBx754Un8je3HBChNME1k+547poFrLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Le7mJ0k9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Le7mJ0k9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05B99C19423;
	Tue, 10 Mar 2026 13:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773148865;
	bh=c+BZ8y0X9zvIcVdjPyEpvY2CXeG9uw0Y/psx09nXjTs=;
	h=Date:From:To:Cc:Subject:From;
	b=Le7mJ0k95/1zXaGqD13r3azz4k8K/etWvjiC+MWAfFcyrfwN/AzNv48k/EorWdwGo
	 A2KA1v/WQZ3605pGPyGCaxzRDkz/w+1YanBt/JvJNiHksLMuRoCMIvI4ZUU0PblUzc
	 lebQk4YYgwuNsOzWi0ndILk7QYn+xdIS8oopZvGcPz6k3AgDkkYj1Q4dsdotDScV2w
	 bne0GGTdvyA13B0TxRXziNtG1c7MaxOcFOJYgvMTvDHlAOLPtaw7D152z/NZfX0qm7
	 CEiQphj7CuWnLz8EnDGcHHRDMA9aYVlwwIyDO4fwEAz9t5v6DpGhsWY92L9sxrTreE
	 oIkvifqTM8/Eg==
Date: Tue, 10 Mar 2026 13:21:01 +0000
From: Mark Brown <broonie@kernel.org>
To: Al Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Jeff Layton <jlayton@kernel.org>,
	Namjae Jeon <linkinjeon@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the vfs tree
Message-ID: <abAavVrDrfzkzuVR@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="P0Nl9gZCpRQ/rWLn"
Content-Disposition: inline


--P0Nl9gZCpRQ/rWLn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the vfs tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

/tmp/next/build/fs/ntfs/mft.c: In function 'ntfs_may_write_mft_record':
/tmp/next/build/fs/ntfs/mft.c:773:52: error: passing argument 3 of 'find_in=
ode_nowait' from incompatible pointer type [-Wincompatible-pointer-types]
  773 |                 vi =3D find_inode_nowait(sb, mft_no, ntfs_test_inod=
e_wb, &na);
      |                                                    ^~~~~~~~~~~~~~~~=
~~
      |                                                    |
      |                                                    int (*)(struct i=
node *, long unsigned int,  void *)
In file included from /tmp/next/build/include/linux/writeback.h:10,
                 from /tmp/next/build/fs/ntfs/mft.c:11:
/tmp/next/build/include/linux/fs.h:2955:39: note: expected 'int (*)(struct =
inode *, u64,  void *)' {aka 'int (*)(struct inode *, long long unsigned in=
t,  void *)'} but argument is of type 'int (*)(struct inode *, long unsigne=
d int,  void *)'
 2955 |                                 int (*match)(struct inode *, u64, v=
oid *),
      |                                 ~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
/tmp/next/build/fs/ntfs/mft.c:836:52: error: passing argument 3 of 'find_in=
ode_nowait' from incompatible pointer type [-Wincompatible-pointer-types]
  836 |                 vi =3D find_inode_nowait(sb, mft_no, ntfs_test_inod=
e_wb, &na);
      |                                                    ^~~~~~~~~~~~~~~~=
~~
      |                                                    |
      |                                                    int (*)(struct i=
node *, long unsigned int,  void *)
/tmp/next/build/include/linux/fs.h:2955:39: note: expected 'int (*)(struct =
inode *, u64,  void *)' {aka 'int (*)(struct inode *, long long unsigned in=
t,  void *)'} but argument is of type 'int (*)(struct inode *, long unsigne=
d int,  void *)'
 2955 |                                 int (*match)(struct inode *, u64, v=
oid *),
      |                                 ~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~

Caused by commit

   0b2600f81cefc (treewide: change inode->i_ino from unsigned long to u64)

interacting with the addition of the ntfs tree.  I have fixed this up as
below and can carry as needed:

commit d1b19b9f221c93e8fd0f43b80509ba1660e25cf9
Author: Mark Brown <broonie@kernel.org>
Date:   Tue Mar 10 12:33:15 2026 +0000

    ntfs: Fixup merge issue with vfs.all changes
   =20
    /tmp/next/build/fs/ntfs/mft.c: In function 'ntfs_may_write_mft_record':
    /tmp/next/build/fs/ntfs/mft.c:773:52: error: passing argument 3 of 'fin=
d_inode_nowait' from incompatible pointer type [-Wincompatible-pointer-type=
s]
      773 |                 vi =3D find_inode_nowait(sb, mft_no, ntfs_test_=
inode_wb, &na);
          |                                                    ^~~~~~~~~~~~=
~~~~~~
          |                                                    |
          |                                                    int (*)(stru=
ct inode *, long unsigned int,  void *)
    In file included from /tmp/next/build/include/linux/writeback.h:10,
                     from /tmp/next/build/fs/ntfs/mft.c:11:
    /tmp/next/build/include/linux/fs.h:2955:39: note: expected 'int (*)(str=
uct inode *, u64,  void *)' {aka 'int (*)(struct inode *, long long unsigne=
d int,  void *)'} but argument is of type 'int (*)(struct inode *, long uns=
igned int,  void *)'
     2955 |                                 int (*match)(struct inode *, u6=
4, void *),
          |                                 ~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~
    /tmp/next/build/fs/ntfs/mft.c:836:52: error: passing argument 3 of 'fin=
d_inode_nowait' from incompatible pointer type [-Wincompatible-pointer-type=
s]
      836 |                 vi =3D find_inode_nowait(sb, mft_no, ntfs_test_=
inode_wb, &na);
          |                                                    ^~~~~~~~~~~~=
~~~~~~
          |                                                    |
          |                                                    int (*)(stru=
ct inode *, long unsigned int,  void *)
    /tmp/next/build/include/linux/fs.h:2955:39: note: expected 'int (*)(str=
uct inode *, u64,  void *)' {aka 'int (*)(struct inode *, long long unsigne=
d int,  void *)'} but argument is of type 'int (*)(struct inode *, long uns=
igned int,  void *)'
     2955 |                                 int (*match)(struct inode *, u6=
4, void *),
          |                                 ~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~
   =20
    Signed-off-by: Mark Brown <broonie@kernel.org>

diff --git a/fs/ntfs/mft.c b/fs/ntfs/mft.c
index 48e64eaa7ec33..0c3f8d9b7c3a4 100644
--- a/fs/ntfs/mft.c
+++ b/fs/ntfs/mft.c
@@ -632,7 +632,7 @@ int write_mft_record_nolock(struct ntfs_inode *ni, stru=
ct mft_record *m, int syn
 	return err;
 }
=20
-static int ntfs_test_inode_wb(struct inode *vi, unsigned long ino, void *d=
ata)
+static int ntfs_test_inode_wb(struct inode *vi, u64 ino, void *data)
 {
 	struct ntfs_attr *na =3D data;
=20

--P0Nl9gZCpRQ/rWLn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmwGrwACgkQJNaLcl1U
h9D55wf/dzwXoA0+oVl1AlCTr2yFx+8grv1+nlk5iUnGfk4XtckLrWrPM7gYBpNV
SS/z+rRg2Afk+geciJPYH3447gDjnIZkZS5usgnC2EtvzNcZHvyTsSdoQh8cLCgW
by07BVCOqbsiMh57kRiYGA68QlmIptDGSnlW9CCLSZ3WwU5OaKAeDZHfBz0MpMif
5y9H+UTZvo+/cBOFATFgfOVNNmhZ7JNqRz+2WX+UKpN7eEw0t0CRI/uu/CwvNyw/
bDRIMmqnNCe6Q+IPa7IIdGIRZXPHBJpnYJ3u9TatPqnMN65zdZuUYiJy3f7n1Pj5
UKqm1FPA7N9Ym7dXQevvEYpribXEcA==
=gPTC
-----END PGP SIGNATURE-----

--P0Nl9gZCpRQ/rWLn--
