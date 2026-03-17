Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B679C2D877C;
	Tue, 17 Mar 2026 13:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773755294; cv=none; b=nTknHWaMtx3wBVzMcJkOQwX0O/7/3FUxiwevIgoQOOnduVnIE4YRng6j4OMwHZnjYB2bCQ0ueqlMfy4oMYLV2awj5lo1PSaKrseKQ4F9q+imCBN3z/Hn3eAVBipUfxT/D6U+/ms7hDg5xk6Hw8ZfWMQfYCN1zlWUl/8LJ7tmPOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773755294; c=relaxed/simple;
	bh=w7EDQmmlZDSBiRS2UBRGvoHuo6CsvaJMx1wa9N+TAiw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sgh9VBnPT/xF0nUnH79UjgVhErG029UQs+p/CZUzcTEDNfVv7kIkOminJe2nak5C0chU2PDLdaDs69pBIj6rPARVWU1JFbQRyTyZf1newDgFAjHWV37OhWW/+xOaxzLe3OCOUDwZc33d/cMrcDocQ7bLmFRFuRDWwdvj0Qnz3FE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G3GBFS5e; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G3GBFS5e"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 348B1C4CEF7;
	Tue, 17 Mar 2026 13:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773755294;
	bh=w7EDQmmlZDSBiRS2UBRGvoHuo6CsvaJMx1wa9N+TAiw=;
	h=Date:From:To:Cc:Subject:From;
	b=G3GBFS5ed+jIHdcNBDjuRh1klV+8FqKrKj4xeiwQahjj/MbMTB1vPEvL2f24CvVxZ
	 Y1GcFjhEZRVurbSC5dg4z9FgTZ5Dpbmm1gQFE3td6fcz05eT3jxV3rvdnzR+uYboQt
	 T/AvNdtmDgaCrIHYO6+RJsrVHI8z0x9+VTCq9jYa1/0SJuY7Q9IyVBcWU950hJ0ERI
	 Ojm0K/CM1n3KgzHVJ8TwLlpzB2yyurPdYw1/QjbQoLA6YpK425JZCik8143C/He0SW
	 wgOjhSgMMI+UG84KjvWgdU9Vd8drNa3Vqbb5auaEAMwo2k3UkkuuPXqyccTRCJI79C
	 GpnmZbYiThe4A==
Date: Tue, 17 Mar 2026 13:48:10 +0000
From: Mark Brown <broonie@kernel.org>
To: David Sterba <dsterba@suse.cz>
Cc: David Sterba <dsterba@suse.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Qu Wenruo <wqu@suse.com>
Subject: linux-next: manual merge of the btrfs tree with the btrfs-fixes tree
Message-ID: <ablbmhRJcTwgE7k3@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="CHRGK0v39L0XJqSv"
Content-Disposition: inline


--CHRGK0v39L0XJqSv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the btrfs tree got a conflict in:

  fs/btrfs/compression.c

between commits:

  65ee6061388b3 ("btrfs: fix a bug that makes encoded write bio larger than=
 expected")
  3adf8f14152fb ("btrfs: do not touch page cache for encoded writes")

=66rom the btrfs-fixes tree and commits:

  c18bcdc0422e9 ("btrfs: reduce the size of compressed_bio")
  d634a62ed907c ("btrfs: do not touch page cache for encoded writes")
  bd2e495aacd58 ("btrfs: fix a bug that makes encoded write bio larger than=
 expected")

=66rom the btrfs tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --combined fs/btrfs/compression.c
index 85199944c1ebe,192f133d9eb58..0000000000000
--- a/fs/btrfs/compression.c
+++ b/fs/btrfs/compression.c
@@@ -224,7 -224,6 +224,6 @@@ void btrfs_free_compr_folio(struct foli
  		return;
 =20
  free:
- 	ASSERT(folio_ref_count(folio) =3D=3D 1);
  	folio_put(folio);
  }
 =20
@@@ -292,7 -291,7 +291,7 @@@ static void end_bbio_compressed_write(s
  	struct compressed_bio *cb =3D to_compressed_bio(bbio);
  	struct folio_iter fi;
 =20
- 	btrfs_finish_ordered_extent(cb->bbio.ordered, NULL, cb->start, cb->len,
+ 	btrfs_finish_ordered_extent(cb->bbio.ordered, cb->start, cb->len,
  				    cb->bbio.bio.bi_status =3D=3D BLK_STS_OK);
 =20
  	if (cb->writeback)
@@@ -330,7 -329,6 +329,6 @@@ void btrfs_submit_compressed_write(stru
  	cb->start =3D ordered->file_offset;
  	cb->len =3D ordered->num_bytes;
  	ASSERT(cb->bbio.bio.bi_iter.bi_size =3D=3D ordered->disk_num_bytes);
- 	cb->compressed_len =3D ordered->disk_num_bytes;
  	cb->bbio.bio.bi_iter.bi_sector =3D ordered->disk_bytenr >> SECTOR_SHIFT;
  	cb->bbio.ordered =3D ordered;
 =20
@@@ -560,7 -558,6 +558,6 @@@ void btrfs_submit_compressed_read(struc
  	em_start =3D em->start;
 =20
  	cb->len =3D bbio->bio.bi_iter.bi_size;
- 	cb->compressed_len =3D compressed_len;
  	cb->compress_type =3D btrfs_extent_map_compression(em);
  	cb->orig_bbio =3D bbio;
  	cb->bbio.csum_search_commit_root =3D bbio->csum_search_commit_root;

--CHRGK0v39L0XJqSv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmm5W5kACgkQJNaLcl1U
h9COGgf+MH+46rI2Fm+Ro/sKF8HykLhdHW8kGnOJ4qZBFcJ1snpw9k5ecl+qA1cs
BCNyXqelBec93skiikpFBfjQMZbHb5PwT/NPzkLg/R0cfsD9A2yTbwIKnCuxLErC
rHGptlpP5cedaaPPMIn8LIVdGJvsUsNTwp8ZAUoQbWPTGPlnZKybpCXuabNSQaUp
wBBVT7s+DLN1Py54yR1+OeCQjT62aZQ+kSH4SSrcdiWEiQRKXY7J9CG3+O7bUDLs
qHmqBOi3JX1Gjzob1tMjKw1SfsWSHHzPzoqIA61CbMn92jG9A/pJ5kYlfK6NuMN8
3fPuu2Su5M4HTwObeWfhO4dkuzaJlw==
=hUdx
-----END PGP SIGNATURE-----

--CHRGK0v39L0XJqSv--
