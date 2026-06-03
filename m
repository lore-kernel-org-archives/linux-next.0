Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 139C2401A3A;
	Wed,  3 Jun 2026 09:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780479560; cv=none; b=NrfaaIYPledreBhlP43CeypppaINMwZAz71/g7F1a4SkVvNe/ZQefaDUh1q77OJYtWZ47Q++8wZSIIkYKynktEU9/kEmWv/lwip0ew6k9GvXJWQkzfkACJ9hfWIC3G/jDOlxh7C/vTRw41lQbZHVXJqHkXaurGJEhVTALwGtaAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780479560; c=relaxed/simple;
	bh=uiP8EAGTnd9xX8f46CJ3nnubAFAGDyaW/PROB1W1v0Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MXWlwbpU0TRiad5XKTyADfS4EbU3ZMynp+Fd6Qr0lnY5AwyPXT01ZHoApyK3GJwX5h/0+aXQFt0/lw/NjvoDI7yTb+sr9vuCvrKsts6npZqlz6EulRzu4EwZlqXX2ENI8qYCrCBMzmaLFEhxTcQSVKeMsAng1XNJYt5UAjpEkos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iAZXVsrn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iAZXVsrn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A42ED1F00898;
	Wed,  3 Jun 2026 09:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780479557;
	bh=oZliQDHdWmOoMcupeMAYGiCdtkHwo9F3kDRmYylSprs=;
	h=Date:From:To:Cc:Subject;
	b=iAZXVsrnW1XebuGaBOAxteoE1NvVGPd66t3bCTE85JYQDFfrGhkXb8xndrC5Ja5/Y
	 jIF+IfPeKzl6Dv4jVfUnSMsGSqixbN8KelbZyLawmPpxYngHJPgqMqiJsD5n4BwnFm
	 AB5cbhMsSxyUsf0dVV902DRMFj0iNCNAtVyLaUfs/gjDuDaWu0ixXbVqAx0TogUikx
	 0cDSGwxyhS/x44p2foW/hkbYZl82G4ynd1MojKW0k7p2Ntafx1WnRGjwdlaVcjMnPn
	 5jkO4W0JheLXY+utuyYmlS5GrRo152oiHDk7treDQ+tUts0aG1iScmxaM8f0Z8Aa8t
	 AyvYuxs8GrMNg==
Date: Wed, 3 Jun 2026 10:39:14 +0100
From: Mark Brown <broonie@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the mm-unstable tree
Message-ID: <ah_2QuKro4gYRP1c@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="YhgKo0VwgqIzZTkd"
Content-Disposition: inline


--YhgKo0VwgqIzZTkd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

After merging the mm-unstable tree, today's linux-next build (x86_64
allmodconfig) failed like this:

/tmp/next/build/mm/khugepaged.c:1357:6: error: variable 'pte' is used uninitialized whenever 'if' condition is true
[-Werror,-Wsometimes-uninitialized]
 1357 |         if (result != SCAN_SUCCEED)
      |             ^~~~~~~~~~~~~~~~~~~~~~
/tmp/next/build/mm/khugepaged.c:1458:6: note: uninitialized use occurs here
 1458 |         if (pte)
      |             ^~~
/tmp/next/build/mm/khugepaged.c:1357:2: note: remove the 'if' if its condition is always false
 1357 |         if (result != SCAN_SUCCEED)
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
 1358 |                 goto out_up_write;
      |                 ~~~~~~~~~~~~~~~~~
/tmp/next/build/mm/khugepaged.c:1352:6: error: variable 'pte' is used uninitialized whenever 'if' condition is true
[-Werror,-Wsometimes-uninitialized]
 1352 |         if (result != SCAN_SUCCEED)
      |             ^~~~~~~~~~~~~~~~~~~~~~
/tmp/next/build/mm/khugepaged.c:1458:6: note: uninitialized use occurs here
 1458 |         if (pte)
      |             ^~~
/tmp/next/build/mm/khugepaged.c:1352:2: note: remove the 'if' if its condition is always false
 1352 |         if (result != SCAN_SUCCEED)
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
 1353 |                 goto out_up_write;
      |                 ~~~~~~~~~~~~~~~~~
/tmp/next/build/mm/khugepaged.c:1296:12: note: initialize the variable 'pte' to silence this warning
 1296 |         pte_t *pte;
      |                   ^
      |                    = NULL
2 errors generated.

Caused by this diff:

diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index 8ffb47f1e8453..2837f12618583 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -1293,7 +1293,7 @@ static enum scan_result collapse_huge_page(struct mm_struct *mm, unsigned long s
        const unsigned long end_addr = start_addr + (PAGE_SIZE << order);
        LIST_HEAD(compound_pagelist);
        pmd_t *pmd, _pmd;
-       pte_t *pte = NULL;
+       pte_t *pte;
        pgtable_t pgtable;
        struct folio *folio;
        spinlock_t *pmd_ptl, *pte_ptl;

which git annotate is getting very confused about the source of unless
it's a dropped commit.  I have reverted that hunk.

--YhgKo0VwgqIzZTkd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmof9kEACgkQJNaLcl1U
h9Dc+Af6Ag6d9AjuLeynqM3mncVojGEqLkO1CjWskAvIk9BpclP3A4YkCokXqjub
WgfWKGyaK3JHtFwH7lktl/GrrQBX1TKUX6zGmnHsAPXYJZu5mKgoGbJbPjDZWyrw
QLKhRizUftq9gn5AOj2C5DoMUoDadJ1viROl52v2RWR3jViMfo6MSzupIj8PFD1z
621Hs2Tboh8fc+hOfnAlL9VABusMdfAKdx9lnLtG5+vQ+aMwDCxkJbh97rOJAjXL
57CzWCDpznJWW1ntoNhq53GS36MNrLk5l/dtNoQcj84NuCBS8RhD2ikfl1nBtiVZ
J4je2NxpNGvccsBrWegqeSikr1tOrw==
=HjfO
-----END PGP SIGNATURE-----

--YhgKo0VwgqIzZTkd--
