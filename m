Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 701283D1CA7;
	Mon,  9 Mar 2026 14:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773066580; cv=none; b=mJ1CvCDX7a8QazioRrLaOczas8Tu9yFF9NcenhICB8vyQ+KoNLlFyjhFtNeMnPf/hhcznEwx0U5JUq5nc1Z28U3E8lYRVFsyHEjdvwBYVyNltx6qufKiQ1VbTZP/HPxwIimzQHh3rKOETD3kqSQ6VG957n3UgAL+9DOuJYRAvMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773066580; c=relaxed/simple;
	bh=AsFH0HBq5dqKEcOxfOx+0w5Nb0IJbiqSud7zDizNtsE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gIaLnmOQxHCGia0aXXXgTkX2RfC+su4zUUDg1gR9O55PKu7bp/r1Id0tBwjEWaQFjqt3nYERxGrL2HjK9huh58kHYkjaJ2Zmpg2YSFzhRGOFXdQ+r/qJSkBoW3Qqy/1i9UXAI2EJsjf+rEQeMmCIv2zlutEjcGa9n1CiEhgZ8FE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=URatpSB9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="URatpSB9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B541DC4CEF7;
	Mon,  9 Mar 2026 14:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773066580;
	bh=AsFH0HBq5dqKEcOxfOx+0w5Nb0IJbiqSud7zDizNtsE=;
	h=Date:From:To:Cc:Subject:From;
	b=URatpSB9sQZL+ghO1A5KwV8WpCEoiSfGJMeIuIOHhwhsqUgX+v7RsvDCv+mXDTzPC
	 UwpZsCTHsh35yx7StnLd6IMM7heZ8tZNnxxs34dflAeZUIQ54b6e4NlFCRb0ROSnrQ
	 VmaBJd+LkeNIaG0PpdTCFLgiaZ+pFYXUwTOXtPlqI7uy9aXEqnVYDK4WZ/87P9P5zd
	 IKAbDSRjxewKnOsyiuDjJg/66dBN+PKPFHgq9tRK3r+05daaQghib3qsZVGwRvKrlW
	 4syxWT1z0WAxGuuWXqyGn0NKabRAfSDudZGaF2mj8WqKmOTublfBX5fc1yKhZehbYl
	 cwmMGAj1K666g==
Date: Mon, 9 Mar 2026 14:29:35 +0000
From: Mark Brown <broonie@kernel.org>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>, David Hildenbrand <david@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the fs-next tree
Message-ID: <aa7ZT-cQMVdQOOAj@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="BuwbS+7/sGbNgLhr"
Content-Disposition: inline


--BuwbS+7/sGbNgLhr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the fs-next tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

/tmp/next/build/fs/ntfs/file.c: In function 'ntfs_file_mmap_prepare':
/tmp/next/build/fs/ntfs/file.c:657:13: error: implicit declaration of funct=
ion 'vma_desc_test_flags'; did you mean 'vma_desc_set_flags'? [-Wimplicit-f=
unction-declaration]
  657 |         if (vma_desc_test_flags(desc, VMA_WRITE_BIT)) {
      |             ^~~~~~~~~~~~~~~~~~~
      |             vma_desc_set_flags

Caused by an interaction with commit:

  2c3b5ea7028fa (mm: reintroduce vma_desc_test() as a singular flag test)

=66rom one of the mm trees, I've fixed it up as below and can carry as
needed.

commit 8cbd256f4ac9d0b08b6fc30b305cfcb51b9de9f7
Author: Mark Brown <broonie@kernel.org>
Date:   Mon Mar 9 13:24:55 2026 +0000

    ntfs: Fix up mm merge
   =20
    /tmp/next/build/fs/ntfs/file.c: In function 'ntfs_file_mmap_prepare':
    /tmp/next/build/fs/ntfs/file.c:657:13: error: implicit declaration of f=
unction 'vma_desc_test_flags'; did you mean 'vma_desc_set_flags'? [-Wimplic=
it-function-declaration]
      657 |         if (vma_desc_test_flags(desc, VMA_WRITE_BIT)) {
          |             ^~~~~~~~~~~~~~~~~~~
   =20
    Signed-off-by: Mark Brown <broonie@kernel.org>

diff --git a/fs/ntfs/file.c b/fs/ntfs/file.c
index 2735780159999..e5b897a6c1e15 100644
--- a/fs/ntfs/file.c
+++ b/fs/ntfs/file.c
@@ -654,7 +654,7 @@ static int ntfs_file_mmap_prepare(struct vm_area_desc *=
desc)
 	if (NInoCompressed(NTFS_I(inode)))
 		return -EOPNOTSUPP;
=20
-	if (vma_desc_test_flags(desc, VMA_WRITE_BIT)) {
+	if (vma_desc_test(desc, VMA_WRITE_BIT)) {
 		struct inode *inode =3D file_inode(file);
 		loff_t from, to;
 		int err;

--BuwbS+7/sGbNgLhr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmu2U8ACgkQJNaLcl1U
h9BPywf9GDIiaf2asLFk/p+n9n7BndWbb2PDaox0vFWs3KgNja1x4cCSfyXBDxIO
EndZjHXjk7Pd6Ix5aMu1Hm7fKfiGeGwo6DvEw0a868ZyyAbWBMIiLeJadvOudEjT
XE7A/ipkiX5rb3t/DS+2jULsLuwWkUGb8TuMc/XEUeLZE5OF1HXEngMIJCgVNDPk
fgf35ofAc7NFe/z4QRD0MuSlm6YtkF9ilzrLLCh8WrM30U+cnK1W3m3QE4axQjHX
pt5/wg6DBj1PTNMa1WxdYrhDWPHUcKSUv7bgK4BATDLnKs+wkWhdvLmhnetJ/Q6m
xjWgkW6YMgeWU4Y4sHbpS0naJSZ60w==
=ACt2
-----END PGP SIGNATURE-----

--BuwbS+7/sGbNgLhr--
