Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65CCD3E0C74;
	Wed, 18 Mar 2026 13:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773841866; cv=none; b=mIs14gqTkKVOEItPOhw72RGFW+1rohUaky5pk/40hpKuo7kssJTpYAFmbkAnhogEXDtGrwOKY+o3PKwl0zi6E+mnpIHAKfxx27Dk0gHgp6Dv1+PL73zft0lcl9NYGDacaA8NM9tjHUbTZxj+AgCuqKo5asCNi3cL5mC0SIi++Bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773841866; c=relaxed/simple;
	bh=tV8hmOcpUfRd6+4HamqXbSylQIQsNx82Wi2N2gmqW5I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Z0V/s5rWlT6AY74r1dUtmaH/VdSxh0UXAg5Tno0PzBK3KGxtO33lw2tRmb5/uB9EiUIr9z+kmwXzk6wpBf8jj5GCNfvBkeDPpNlBXXJf2UDG5FKN3e+P2nCRolcw4kcSzSsa7x2PPOECuHgw6BznUNlb3IT8XLeoTuu0C7JThjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pmYSlBk7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pmYSlBk7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95590C2BCB2;
	Wed, 18 Mar 2026 13:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773841865;
	bh=tV8hmOcpUfRd6+4HamqXbSylQIQsNx82Wi2N2gmqW5I=;
	h=Date:From:To:Cc:Subject:From;
	b=pmYSlBk7X5l6JdT4k3LlDudnzzTl4hO6gnrveB1NtnpQ5p1pOD8kMq5ek46ajsQeX
	 Bz+0BmIxiS8o+R2xoUPPomOp52DqwoC2bIEBjWLH5w+wR6g5NL1B+4CqBkZPKSS1MV
	 Uhj3b5vQeY11i3zj7icuWFMZcVnB9o3uFtZDHVMfhT9AleHWfaXKahpJAa6CryKQt7
	 0zPL9R53oCS+WeHxa93/xSMGYagw+13i+AypfwAmK7J5voH1V//Ma0Uj5OQKWaGHjX
	 VD+jwtRR2O2DtXz+DDykiLP1woCdg7Ou+ugRqhDVsIuZ29OTlXo5wLcWYtaxEhf5aJ
	 Kr317X4bvOSYg==
Date: Wed, 18 Mar 2026 13:51:01 +0000
From: Mark Brown <broonie@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Puranjay Mohan <puranjay@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the mm-unstable tree
Message-ID: <abqtxbX0eW1Ljdhx@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4A6oakzeyv/tekuA"
Content-Disposition: inline


--4A6oakzeyv/tekuA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the mm-unstable tree, today's linux-next build
(x86_64 allmodconfig rustfmtcheck) failed like this:

Diff in /tmp/next/build/drivers/android/binder/page_range.rs:762:
     if let Some(unchecked_vma) =3D mmap_read.vma_lookup(vma_addr) {
         if let Some(vma) =3D check_vma(unchecked_vma, range_ptr) {
             let user_page_addr =3D vma_addr + (page_index << PAGE_SHIFT);
-        vma.zap_vma_range(user_page_addr, PAGE_SIZE);
+            vma.zap_vma_range(user_page_addr, PAGE_SIZE);
         }
     }
=20
Diff in /tmp/next/build/drivers/android/binder/page_range.rs:762:
     if let Some(unchecked_vma) =3D mmap_read.vma_lookup(vma_addr) {
         if let Some(vma) =3D check_vma(unchecked_vma, range_ptr) {
             let user_page_addr =3D vma_addr + (page_index << PAGE_SHIFT);
-        vma.zap_vma_range(user_page_addr, PAGE_SIZE);
+            vma.zap_vma_range(user_page_addr, PAGE_SIZE);
         }
     }
=20

Caused by commit

  320e410f0294b (mm: rename zap_page_range_single() to zap_vma_range())

I have used the tree from next-20260317 instead.

--4A6oakzeyv/tekuA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmm6rcUACgkQJNaLcl1U
h9DUgwf/fgPzqv97goEWGYNE0A/oUEGCTLj40seYphUrIRavmLLCTx2AwSxSmNpn
GWgOMCG7O19KfYfaf4dRcsNNvTTnsoC7Tsce+2kfmROTE0cbIBZzkmieJkr7KIGQ
VRyO9xPVkXAHTDiv8BKcNKelXWiHgW/Z7eQXYAqoPW61G7t5H2ojkHofSgDdUxUu
sB4bOOq6p5iKn0gaSVePjbW1zOop/dggFM1J/50PcXlnJ2OOTyvL93AokcX29gHj
b7mE/sq1I6cdw3n81Zp8PtE2P/UmNMwMFq06B49fz/5GuriqOlGhCrOI+94nPtFx
T4oLNYYae70Afll1wxd+oYrjkNrMZQ==
=wkcL
-----END PGP SIGNATURE-----

--4A6oakzeyv/tekuA--
