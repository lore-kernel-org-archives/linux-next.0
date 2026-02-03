Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9995539C65C;
	Tue,  3 Feb 2026 13:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770125799; cv=none; b=h06FT9odQQgbxMh0X+g0llTlFYfw24G70uSw/lRkhWi/9ClzJfMHiEdB+AZ3vL/yGsXXZoBH01e/FOwXyrZG79XjGQ+vb2178mV1JtCnNcs+UH+48KAPFfzsPTUC0pQrANiJj32kFiFpZtaKQxx31sNIDj332JWS61GyykwUvMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770125799; c=relaxed/simple;
	bh=GsOSlD56yflqmqQOCCG91Vxdt6DuThQUcfoMKE/n1yo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mV40JXvo8JCauiH1wCyPmLyM3VDG2wPqoMGczznBvFgyRYSY70qTKqmP5lmbt7msrYJmSgF3IAowLQE7nrTlfKCJBugPJeAtJg+Kof07V+1zg+p2TfACrCXl4EQtczI5X+yFRN5S0ohRUfqnorJsk1AkowgtU9EZB6dE3di7C0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I3/c/dlo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I3/c/dlo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1C79C19425;
	Tue,  3 Feb 2026 13:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770125799;
	bh=GsOSlD56yflqmqQOCCG91Vxdt6DuThQUcfoMKE/n1yo=;
	h=Date:From:To:Cc:Subject:From;
	b=I3/c/dlooiAa95SY+T4pwk9JPVqkufk0QqPfhHdLbYBmzQ1e/6WdjJ6X84nwFyUVa
	 xcbzsIZgiWRdwb2VSucSNXijpAdF5Kwkhebw7hbf1w9LI4XhYt420CzPcU9PeHAYZb
	 AIPZK4J8EDm7BjkIejWTWZHBGdscA/049NWsJpesfeHOregrsRlf73VX67Vtt99Zf1
	 c8IEWiLHkWfQuPzdSo6Nfj4/MSlPywi9H7W4h4McQgujLAu9BZOTp/hMKr1ujQ/biz
	 91MRMcb4m8+syRE8efALfX06qXYk8ltX8wzs9PScYLkb7CFYAskdOid6r0LkkqdBDz
	 HuVtfnsxx1Y8A==
Date: Tue, 3 Feb 2026 13:36:34 +0000
From: Mark Brown <broonie@kernel.org>
To: Eric Biggers <ebiggers@kernel.org>, "Theodore Y. Ts'o" <tytso@mit.edu>,
	Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>,
	Christoph Hellwig <hch@lst.de>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the fsverity tree
Message-ID: <aYH54qJee85qLLkN@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="MLfAgtyTmprji45Q"
Content-Disposition: inline


--MLfAgtyTmprji45Q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the fsverity tree, today's linux-next build (x86_64
allmodconfig) failed like this:

/tmp/next/build/fs/f2fs/data.c: In function 'f2fs_read_data_large_folio':
/tmp/next/build/fs/f2fs/data.c:2525:51: error: passing argument 1 of 'fsver=
ity_verify_page' from incompatible pointer type [-Wincompatible-pointer-typ=
es]
 2525 |                             !fsverity_verify_page(folio_file_page(f=
olio,
      |                                                   ^~~~~~~~~~~~~~~~~=
~~~~~
      |                                                   |
      |                                                   struct page *
 2526 |                                                                 ind=
ex))) {
      |                                                                 ~~~=
~~~
In file included from /tmp/next/build/fs/f2fs/f2fs.h:29,
                 from /tmp/next/build/fs/f2fs/data.c:24:
/tmp/next/build/include/linux/fsverity.h:285:63: note: expected 'struct fsv=
erity_info *' but argument is of type 'struct page *'
  285 | static inline bool fsverity_verify_page(struct fsverity_info *vi,
      |                                         ~~~~~~~~~~~~~~~~~~~~~~^~
/tmp/next/build/fs/f2fs/data.c:2525:30: error: too few arguments to functio=
n 'fsverity_verify_page'
 2525 |                             !fsverity_verify_page(folio_file_page(f=
olio,
      |                              ^~~~~~~~~~~~~~~~~~~~
/tmp/next/build/include/linux/fsverity.h:285:20: note: declared here
  285 | static inline bool fsverity_verify_page(struct fsverity_info *vi,
      |                    ^~~~~~~~~~~~~~~~~~~~
/tmp/next/build/fs/f2fs/data.c:2557:57: error: passing argument 2 of 'f2fs_=
grab_read_bio' makes pointer from integer without a cast [-Wint-conversion]
 2557 |                         bio =3D f2fs_grab_read_bio(inode, block_nr,
      |                                                         ^~~~~~~~
      |                                                         |
      |                                                         sector_t {a=
ka long long unsigned int}
/tmp/next/build/fs/f2fs/data.c:1100:61: note: expected 'struct fsverity_inf=
o *' but argument is of type 'sector_t' {aka 'long long unsigned int'}
 1100 |                                       struct fsverity_info *vi, blo=
ck_t blkaddr,
      |                                       ~~~~~~~~~~~~~~~~~~~~~~^~
/tmp/next/build/fs/f2fs/data.c:2557:31: error: too few arguments to functio=
n 'f2fs_grab_read_bio'
 2557 |                         bio =3D f2fs_grab_read_bio(inode, block_nr,
      |                               ^~~~~~~~~~~~~~~~~~
/tmp/next/build/fs/f2fs/data.c:1099:20: note: declared here
 1099 | static struct bio *f2fs_grab_read_bio(struct inode *inode,
      |                    ^~~~~~~~~~~~~~~~~~

Caused by commit

   3428cd0a9498a (f2fs: consolidate fsverity_info lookup)

interacting with

   05e65c14ea59 (f2fs: support large folio for immutable non-compressed cas=
e)

I have (hopefully) fixed it up, see below, and can carry as needed.

=46rom a954b589f2aa0da3f2522dbeaf342966190a4139 Mon Sep 17 00:00:00 2001
=46rom: Mark Brown <broonie@kernel.org>
Date: Tue, 3 Feb 2026 13:19:22 +0000
Subject: [PATCH] f2fs: Fix interaction with fsverity changes

/tmp/next/build/fs/f2fs/data.c: In function 'f2fs_read_data_large_folio':
/tmp/next/build/fs/f2fs/data.c:2525:51: error: passing argument 1 of 'fsver=
ity_verify_page' from incompatible pointer type [-Wincompatible-pointer-typ=
es]
 2525 |                             !fsverity_verify_page(folio_file_page(f=
olio,
      |                                                   ^~~~~~~~~~~~~~~~~=
~~~~~
      |                                                   |
      |                                                   struct page *
 2526 |                                                                 ind=
ex))) {
      |                                                                 ~~~=
~~~
In file included from /tmp/next/build/fs/f2fs/f2fs.h:29,
                 from /tmp/next/build/fs/f2fs/data.c:24:
/tmp/next/build/include/linux/fsverity.h:285:63: note: expected 'struct fsv=
erity_info *' but argument is of type 'struct page *'
  285 | static inline bool fsverity_verify_page(struct fsverity_info *vi,
      |                                         ~~~~~~~~~~~~~~~~~~~~~~^~
/tmp/next/build/fs/f2fs/data.c:2525:30: error: too few arguments to functio=
n 'fsverity_verify_page'
 2525 |                             !fsverity_verify_page(folio_file_page(f=
olio,
      |                              ^~~~~~~~~~~~~~~~~~~~
/tmp/next/build/include/linux/fsverity.h:285:20: note: declared here
  285 | static inline bool fsverity_verify_page(struct fsverity_info *vi,
      |                    ^~~~~~~~~~~~~~~~~~~~
/tmp/next/build/fs/f2fs/data.c:2557:57: error: passing argument 2 of 'f2fs_=
grab_read_bio' makes pointer from integer without a cast [-Wint-conversion]
 2557 |                         bio =3D f2fs_grab_read_bio(inode, block_nr,
      |                                                         ^~~~~~~~
      |                                                         |
      |                                                         sector_t {a=
ka long long unsigned int}
/tmp/next/build/fs/f2fs/data.c:1100:61: note: expected 'struct fsverity_inf=
o *' but argument is of type 'sector_t' {aka 'long long unsigned int'}
 1100 |                                       struct fsverity_info *vi, blo=
ck_t blkaddr,
      |                                       ~~~~~~~~~~~~~~~~~~~~~~^~
/tmp/next/build/fs/f2fs/data.c:2557:31: error: too few arguments to functio=
n 'f2fs_grab_read_bio'
 2557 |                         bio =3D f2fs_grab_read_bio(inode, block_nr,
      |                               ^~~~~~~~~~~~~~~~~~
/tmp/next/build/fs/f2fs/data.c:1099:20: note: declared here
 1099 | static struct bio *f2fs_grab_read_bio(struct inode *inode,
      |                    ^~~~~~~~~~~~~~~~~~

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 fs/f2fs/data.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index d9085d1236d97..46b4f70f8faf5 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -2451,6 +2451,7 @@ static void ffs_detach_free(struct folio *folio)
 }
=20
 static int f2fs_read_data_large_folio(struct inode *inode,
+		struct fsverity_info *vi,
 		struct readahead_control *rac, struct folio *folio)
 {
 	struct bio *bio =3D NULL;
@@ -2522,7 +2523,7 @@ static int f2fs_read_data_large_folio(struct inode *i=
node,
 		} else {
 			folio_zero_range(folio, offset << PAGE_SHIFT, PAGE_SIZE);
 			if (f2fs_need_verity(inode, index) &&
-			    !fsverity_verify_page(folio_file_page(folio,
+			    !fsverity_verify_page(vi, folio_file_page(folio,
 								index))) {
 				ret =3D -EIO;
 				goto err_out;
@@ -2554,7 +2555,7 @@ static int f2fs_read_data_large_folio(struct inode *i=
node,
 			bio =3D NULL;
 		}
 		if (bio =3D=3D NULL)
-			bio =3D f2fs_grab_read_bio(inode, block_nr,
+			bio =3D f2fs_grab_read_bio(inode, vi, block_nr,
 					max_nr_pages,
 					f2fs_ra_op_flags(rac),
 					index, false);
@@ -2629,7 +2630,7 @@ static int f2fs_mpage_readpages(struct inode *inode, =
struct fsverity_info *vi,
 	int ret =3D 0;
=20
 	if (mapping_large_folio_support(mapping))
-		return f2fs_read_data_large_folio(inode, rac, folio);
+		return f2fs_read_data_large_folio(inode, vi, rac, folio);
=20
 #ifdef CONFIG_F2FS_FS_COMPRESSION
 	if (f2fs_compressed_file(inode)) {
--=20
2.47.3


--MLfAgtyTmprji45Q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmB+eIACgkQJNaLcl1U
h9BGZwf/TPFNxaT45Fr7Rgl77sLcrtZrdwSr0xgFolHKpclEiK9YS3FGdULplKDD
3EIRBTxgbDzadxnsgAFe23FQ2uvSRyzncJ1SLV1tKtlxrr5YqPE0o2a2h9rgeB12
xtcxAd2g3M6q9fQX/Pw4s9QSndY9uMLTWPAb4O8r0HBTQvfvWEX3rrEAmh3HRADq
CQWSUhheBq+IDUznIkAocLE26qkWYwz9UvieHKTWvpj74xuTeYrrisDCQzQr+aXm
KHtsdNdG/tjhJ6iDrF3Ya+vs4G0BfnU1E/NHqieVLvgaDZ9C3MHcht8iI9isMdql
abuQfvhuBLLXXQjtLgTxmus88ix6Vw==
=VGCB
-----END PGP SIGNATURE-----

--MLfAgtyTmprji45Q--
