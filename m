Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71BB63264CF;
	Mon,  1 Jun 2026 16:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780333143; cv=none; b=J75O67tsmPigIQ9BmS27YZ172ebUqUtTppc0Ox+DQNyadaRgXoXGBcUVZaN4RaCrH2nY+6XIynxXn0Ec4uqUmulWuK+rQSUd0LDq65b6E48IkquOr601qxVcZqbM3w8fi6UagtDs9TLuOGKs0yrlEk2vj/PGVwj9KwEm5BRdo9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780333143; c=relaxed/simple;
	bh=BnFp3E5CbMVyDAbVe4Gbuuj9zvgfBVB8lctVF4eCfXg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OUQemXTEj49aTq6M5e+WXZELyicPYTmi2gPpGlAggX6i1xdy+Ux8BSypMvL6O/r8vUsJkUOHpHBPevU8ftqCkBAfIQbRuuzLmp9AHB1/PPu/y2H6e4MF2uStqllz1M5SuQ1865sWX11bNLSFs69gHFicRWxgOLf8yz+I3Ceu9MQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oLEI4FQw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oLEI4FQw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1DE91F00893;
	Mon,  1 Jun 2026 16:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780333142;
	bh=xKVpPG6jBZwA9cpUZ0pljESgvYoPbuLLjfZJw1xMnYg=;
	h=Date:From:To:Cc:Subject;
	b=oLEI4FQwtmfAwKPgONXkC9kPEfUUDdwCEebFXz5y++m1eUcYWcRmxq/I6zH0mKmFm
	 sRlPwM0Isyc095yEfK9zsNz8ALZWZa0s5F1D36LyvD0KH++vplWnj72dA8Gk9GnsX0
	 gS9bDm3UPz80KwPYG80nYjG4TB5wdHS5wSN9BmShf/Q8dncQ/0LSA3IQFBNpmF3sri
	 GMK2z67PwuYWXoHuN1TmliVaI5vghzun8/7MwSOJ6axPNaeTGV0Wtcw520I5KOWCTd
	 Sk+YUmM8bErP/Zig7gnnqgV6WbaI1hroZzdTLDwpFPaC7h6waw/8JrK1xt9PX0HWkF
	 lnolDbqfaRUdA==
Date: Mon, 1 Jun 2026 17:58:58 +0100
From: Mark Brown <broonie@kernel.org>
To: Jens Axboe <axboe@kernel.dk>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Carlier <devnexen@gmail.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Matthew Wilcox <willy@infradead.org>
Subject: linux-next: manual merge of the block tree with the mm-stable tree
Message-ID: <ah26UmcBXVJMy-Cc@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="roMLsZXQ3ijalH2B"
Content-Disposition: inline


--roMLsZXQ3ijalH2B
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the block tree got a conflict in:

  mm/page_io.c

between commit:

  d590df11be0f1 ("mm/page_io: rename swap_iocb fields for clarity")

=66rom the mm-stable tree and commit:

  ca36c1aaee095 ("block: Add bvec_folio()")

=66rom the block tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc mm/page_io.c
index f2d8fe7fd0574,a59b73f8bdd9d..0000000000000
--- a/mm/page_io.c
+++ b/mm/page_io.c
@@@ -499,8 -489,8 +499,8 @@@ static void sio_read_complete(struct ki
  	int p;
 =20
  	if (ret =3D=3D sio->len) {
 -		for (p =3D 0; p < sio->pages; p++) {
 -			struct folio *folio =3D bvec_folio(&sio->bvec[p]);
 +		for (p =3D 0; p < sio->nr_bvecs; p++) {
- 			struct folio *folio =3D page_folio(sio->bvecs[p].bv_page);
++			struct folio *folio =3D bvec_folio(&sio->bvecs[p]);
 =20
  			count_mthp_stat(folio_order(folio), MTHP_STAT_SWPIN);
  			count_memcg_folio_events(folio, PSWPIN, folio_nr_pages(folio));
@@@ -509,8 -499,8 +509,8 @@@
  		}
  		count_vm_events(PSWPIN, sio->len >> PAGE_SHIFT);
  	} else {
 -		for (p =3D 0; p < sio->pages; p++) {
 -			struct folio *folio =3D bvec_folio(&sio->bvec[p]);
 +		for (p =3D 0; p < sio->nr_bvecs; p++) {
- 			struct folio *folio =3D page_folio(sio->bvecs[p].bv_page);
++			struct folio *folio =3D bvec_folio(&sio->bvecs[p]);
 =20
  			folio_unlock(folio);
  		}

--roMLsZXQ3ijalH2B
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmodulEACgkQJNaLcl1U
h9Biswf7BOS8wGbR6zxLueVKunb/M58TSJ2F6Um3ZvrFBe9HE4JLb8GDaqoVF8kF
ljUD0/wMk2Kc2eJDIeVLq0s3SdzE2YPr28cpndns8AwmiKm3TsUmcTGat/nPfjSm
yICEXFuXSQSqAdxYcCzE5ejQbsCeYBm3MpwCq45uVGCorgQl2K9xjIOLFcy8Hiey
7VEXsN4iuuOm4WRCes8ALY5PKFLN6IugdB37TQ9EJ4yco2/zV4IMqfAVh/9M3pBT
SJtemnTTCVqU7zTmFTwzPcAPUKcjdvyf9TwurdmBgVxcrSuAdUmHKVUQdqTeTXdi
ze3E/KV3MtnYDRsmIXLRYyn4ohaA3g==
=TqZ/
-----END PGP SIGNATURE-----

--roMLsZXQ3ijalH2B--
