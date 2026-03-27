Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DEC72E8882;
	Fri, 27 Mar 2026 19:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774639336; cv=none; b=tLf2gaLXvDzbwevAuyZ3hZb1tZGc6NAjZTVEcJIYCiV8E+LzL59/CDvZCS8hixRuJZ93+jGz86/RHpi0iWUcPnRJOdhCEKSPLxgzldvSY7TVrkp6TIu4yW7/LniU68Vyu9MAfadOxZP9tj7qKUBHlXs+Rz85HrSz4ciwiZymo1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774639336; c=relaxed/simple;
	bh=etkEgqcw0pGeZtGpRrHWzjNRUB++kL1KoRYxkD1hhQ4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=huaLDGQLssLahvlbCz95q+4vawDwEjQdCdy5Q2kpI52BlZazmOZlvH62JGKU3vO8B1Zz5eCwsnmaXQjXS25Ct7jQ/aZ17xmMufeOb6TQurZXZlWYQkNbT/9it4uTIO7KwL4tystXVFrQMuzF1MljzIVhdsgz+xXZVrheioKFPgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FHgGTjbw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FHgGTjbw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BA92C19423;
	Fri, 27 Mar 2026 19:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774639336;
	bh=etkEgqcw0pGeZtGpRrHWzjNRUB++kL1KoRYxkD1hhQ4=;
	h=Date:From:To:Cc:Subject:From;
	b=FHgGTjbwtsdvPX+1OO5S4yoF9jq2LOtt3FZ34QGHDmuIpRXb7waMRLqqa5zTH5ZCf
	 Wjisvi9aGulLGzpwxamtgwM2lx5H1XU4PYt/xV3QJTP85uQVYgit7+ZdfB1NfK09TM
	 T8r1LOsJe/1g8vKAawJRlY8M+fKbK9wWneySfjjiFZkuMaRwwy00e8rViGGme2JhfB
	 JuwC/KwGg1kqQFD9RAa24VRDp5ikkNHs6c6HGSpIIk03Hew7WASpRYsng7L9zrI+jw
	 VOiHDjmCdDHZBGxDgxkqDcDpYSuduid7RxbMVnXGu896uaLaytSpd/jPCkzfOq/FBv
	 mAE2anQ1KHlRQ==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id A7C6B1AC5847; Fri, 27 Mar 2026 19:22:12 +0000 (GMT)
Date: Fri, 27 Mar 2026 19:22:12 +0000
From: Mark Brown <broonie@kernel.org>
To: Namjae Jeon <linkinjeon@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the fs-next tree
Message-ID: <acbY5CCmsk8C95m5@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7Riw+trt5T602orO"
Content-Disposition: inline


--7Riw+trt5T602orO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the fs-next tree, today's linux-next build (x86_64
allmodconfig) failed like this:

/tmp/next/build/fs/exfat/file.c: In function 'exfat_file_mmap_prepare':
/tmp/next/build/fs/exfat/file.c:842:13: error: implicit
declaration of function 'vma_desc_test_flags'; did you mean
'vma_desc_set_flags'? [-Wimplicit-function-declaration]
  842 |         if (vma_desc_test_flags(desc, VMA_WRITE_BIT)) {
      |             ^~~~~~~~~~~~~~~~~~~ vma_desc_set_flags

Caused by commit

  9b373eacd6e6c4 (exfat: add iomap buffered I/O support)

=66rom the exfat tree interacting with

  2c3b5ea7028fa (mm: reintroduce vma_desc_test() as a singular flag test)

=66rom one of the mm trees.  I have applied a fixup which I can carry as
needed.

=46rom c4935dbc4b15a9119616ac73b17eff29a7e2ec87 Mon Sep 17 00:00:00 2001
=46rom: Mark Brown <broonie@kernel.org>
Date: Fri, 27 Mar 2026 19:08:13 +0000
Subject: [PATCH] exfat: Fix up merge with mm

/tmp/next/build/fs/exfat/file.c: In function 'exfat_file_mmap_prepare':
/tmp/next/build/fs/exfat/file.c:842:13: error: implicit
declaration of function 'vma_desc_test_flags'; did you mean
'vma_desc_set_flags'? [-Wimplicit-function-declaration]
  842 |         if (vma_desc_test_flags(desc, VMA_WRITE_BIT)) {
      |             ^~~~~~~~~~~~~~~~~~~ vma_desc_set_flags

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 fs/exfat/file.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/exfat/file.c b/fs/exfat/file.c
index 9a30c32b3a0526..82db5ebaaad7b7 100644
--- a/fs/exfat/file.c
+++ b/fs/exfat/file.c
@@ -839,7 +839,7 @@ static int exfat_file_mmap_prepare(struct vm_area_desc =
*desc)
 	if (unlikely(exfat_forced_shutdown(file_inode(desc->file)->i_sb)))
 		return -EIO;
=20
-	if (vma_desc_test_flags(desc, VMA_WRITE_BIT)) {
+	if (vma_desc_test(desc, VMA_WRITE_BIT)) {
 		struct inode *inode =3D file_inode(file);
 		loff_t from, to;
 		int err;
--=20
2.47.3


--7Riw+trt5T602orO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnG2OMACgkQJNaLcl1U
h9BGHAf/bt0s4jKbqMcCJ5537OvpCctk0aeP0L2Y5AKGJIN5ktZEIShw5wv571Nu
Bzx9osuXxK9XZ76M0t5X/eFLF6TO0dfezrrH20vqZXMPSy0Jnj3XcAO2UnFZDwzk
ybLj7+YMhE5QbPzKgh4NniEclsjyrJRtJquuXNnYDZdQjKckP7DNvdJIOPD4fhlJ
41mFq13elbSXzJMsSUoR1vjL1xcpprooeK/6dFq91IpE2vWTgu2ubhwuHcWgg63U
z31PnyEg6uf7XrzUIlxa6+SXwkdCoMXxNyZ27GSC7fd0oZ0VPoflfrxtDKrMn0mL
oDee5WxDoA0t5vO9qtRzyxJgYNKEzg==
=Ja7j
-----END PGP SIGNATURE-----

--7Riw+trt5T602orO--
