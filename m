Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE36E380FC3;
	Mon,  3 Aug 2026 16:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785775960; cv=none; b=e/fNc+R4auh/PDY3w2++HGf7I2XHf1LvnlU3fl+z4xybyK1fD7YiVyjtIVNnDIFUB1HtkVhKzd3u+Eol65qm73b3vNiexx6SoGI1rmVt8uiXviMtfNWWjN2USQpJD8Dkndq9HwpTAfHltDnuUZyCS3dhfdnfG8LYCO3u69a/gpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785775960; c=relaxed/simple;
	bh=mlq53Vcohwuk9pCl9GwpOi1M033nYrAv85t91POWQtw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=f9ZFs8g46c9MxVWglFznkQVCHkqV3Z/tJScT6oWRp7VDGIMK1H4DTMW81mUP9Qijd/RRClQKU5cal+hNRmSuvl82Uz5oAmzqgjGeHQCtIuvlLfe4app8gtJZNd4QuyBPPdQxu/UZkwG24Z+IpS1FhlfBlINk8GFM2xDPGbk9NwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JlPbIVB2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JlPbIVB2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3F2F1F000E9;
	Mon,  3 Aug 2026 16:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785775959;
	bh=LSaH+huDsVLRiUShUsuY95+WDwOxfP/VyQdKj7OQmmk=;
	h=Date:From:To:Cc:Subject;
	b=JlPbIVB2JCadIMAfda7K2PWFiIfs9aNpTw14UjA6TnuoOCiLorfwtN3i+fcPOw+i6
	 FUyVH2h2qu8r8K81jYYUP2lIgfd5/ymZTkaQbJub87ubT2EDd1wUOabKyJWR0RGZyH
	 Y4bRqzRJaEXFOpZcsIaofZW1Wb8c1tC74ah/WbIU1vBFudXStXbcfOtKADZWQmcn7x
	 c6oOOvIeYNAYZR2XQDJChb237M93NO4d/wibyp6TTVPHmmjI29+FOd1XCvWK24Qje8
	 /lNLLOfYXZfINr9Cd2pRE/TWJb/cDfznupjEQvu59rnIXJavACd2aVQIacxms8cdEo
	 Zg765Gk7XhAcw==
Date: Mon, 3 Aug 2026 17:52:35 +0100
From: Mark Brown <broonie@kernel.org>
To: Jens Axboe <axboe@kernel.dk>, Keith Busch <kbusch@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	Fengnan Chang <changfengnan@bytedance.com>
Cc: Christoph Hellwig <hch@lst.de>, Hannes Reinecke <hare@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the block tree
Message-ID: <anDHU9Wc-EGV1KYL@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="IF7RZ+LnkIY2MC39"
Content-Disposition: inline


--IF7RZ+LnkIY2MC39
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the block tree, today's linux-next build
(arm64 allnoconfig) failed like this:

/tmp/next/build/fs/iomap/direct-io.c: In function '__iomap_dio_read_simple':
/tmp/next/build/fs/iomap/direct-io.c:1037:15: error: too few arguments to f=
unction 'bio_iov_iter_get_pages'
 1037 |         ret =3D bio_iov_iter_get_pages(bio, iter, alignment - 1);
      |               ^~~~~~~~~~~~~~~~~~~~~~
In file included from /tmp/next/build/include/linux/bio-integrity.h:5,
                 from /tmp/next/build/fs/iomap/direct-io.c:6:
/tmp/next/build/include/linux/bio.h:524:5: note: declared here
  524 | int bio_iov_iter_get_pages(struct bio *bio, struct iov_iter *iter,
      |     ^~~~~~~~~~~~~~~~~~~~~~

caused by a sematic conflict between

  14b007e178811 (block: validate user space vectors during extraction)

=66rom the block tree and

  36f199c8d0ee4 (iomap: add simple dio path for small direct I/O)

=66rom the vfs-brauner tree.  I have applied the fixup patch below and can
carry as needed, you should ensure you flag this to Linus when sending
PRs:

=46rom 5bf17d9828d05688ad4fd04cc07b64642d4ba295 Mon Sep 17 00:00:00 2001
=46rom: Mark Brown <broonie@kernel.org>
Date: Mon, 3 Aug 2026 15:53:13 +0100
Subject: [PATCH] fs: Fix up semantic conflict with bio_iov_iter_get_pages

/tmp/next/build/fs/iomap/direct-io.c: In function '__iomap_dio_read_simple':
/tmp/next/build/fs/iomap/direct-io.c:1037:15: error: too few arguments to f=
unction 'bio_iov_iter_get_pages'
 1037 |         ret =3D bio_iov_iter_get_pages(bio, iter, alignment - 1);
      |               ^~~~~~~~~~~~~~~~~~~~~~
In file included from /tmp/next/build/include/linux/bio-integrity.h:5,
                 from /tmp/next/build/fs/iomap/direct-io.c:6:
/tmp/next/build/include/linux/bio.h:524:5: note: declared here
  524 | int bio_iov_iter_get_pages(struct bio *bio, struct iov_iter *iter,
      |     ^~~~~~~~~~~~~~~~~~~~~~

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 fs/iomap/direct-io.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/iomap/direct-io.c b/fs/iomap/direct-io.c
index 2b3e916dedc77..2aa71be36c996 100644
--- a/fs/iomap/direct-io.c
+++ b/fs/iomap/direct-io.c
@@ -1034,7 +1034,8 @@ ssize_t __iomap_dio_read_simple(struct kiocb *iocb, s=
truct iov_iter *iter,
 	bio->bi_iter.bi_sector =3D iomap_sector(&iomi->iomap, iomi->pos);
 	bio->bi_ioprio =3D iocb->ki_ioprio;
=20
-	ret =3D bio_iov_iter_get_pages(bio, iter, alignment - 1);
+	ret =3D bio_iov_iter_get_pages(bio, iter, bdev_dma_alignment(bio->bi_bdev=
),
+				     alignment - 1);
 	if (unlikely(ret))
 		goto out_bio_put;
=20
--=20
2.47.3


--IF7RZ+LnkIY2MC39
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpwx1IACgkQJNaLcl1U
h9CAyQf/RoehCPJtRXzuYLKZv1DM6Mv02x0BM7KtG3uEf8DHfmW0LU020zv6pkFV
TEHklHPy00Kmy20hPqD30NYvVjzzm9vbap46FnwdbnMQxiT6rpiSRoR3uIlmigy5
bcn0Nc5cKKKT6jmzJKT3StuEKCmIU+cfkpo3bbg1J3wUFMTOlF++5ORzV5SoEVin
4cx31963lJz1+SZtmqB1EN4NO90bHna6nlfSN/OcUI+JPbRh9CUYt0O7RysGDG8f
r1a0QLfrsD2MCu5NN8G8e+Q0NADCd3uSIrha6D2o7bpaVU1MPlx6AGWUFzcttAMC
ADJHHUAkbque/EkYe91BebK/OJ6n6w==
=7LD9
-----END PGP SIGNATURE-----

--IF7RZ+LnkIY2MC39--
