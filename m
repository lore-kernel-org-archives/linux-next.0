Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B2DC374A05;
	Tue, 21 Jul 2026 13:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784641589; cv=none; b=Xa6HBtI7FM1W3grHG48J44zuWFn7fSouNUcok29QkMKG+j37qn1k+S6Lrl45scys8o7irnEkCRlCavP7LJ/mlZaC/Bd+33GfObGs1Tx+wSsmKikIIxGKKW6kCPiVXwkKkviKla0ddc1m2cmnYEA226MPqOWlbNYSL8Ld44Xx5n4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784641589; c=relaxed/simple;
	bh=glbf0X45n8ABuWChhqgijE2/edu5+aCXUl6XzwLdBHs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Zp7KL2uXpTftqlj0sQELsy35fiboGhEdOGYO2IAhK4PeI++CSVEcwa+RzSVTkfSm8HDZr5XEtt+ZHWSrsb4K1MCuF3b6AVsF+VayXdVtrw+A7OBKGft0uF07BkWOfDfczHlYeHQtMCFIAy5WApo2U0k+S26a54MhZdxJYjUYcXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QEZiFXI3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QEZiFXI3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18A531F00A3A;
	Tue, 21 Jul 2026 13:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784641588;
	bh=bO/0aPmF2vjwn29XPSvc4gTROCt8YUyYcLDOZjmXYRM=;
	h=Date:From:To:Cc:Subject;
	b=QEZiFXI3WQFFuGnyQPUvnFs6XGq7wFCkkPKU/NKQR/vRuEt9FyUKRqS3H22tZflbw
	 qcE6XQq+DJGvtt0/Kqsb4sMzC6M1jvZJJXMNPEjQI99Wo7WAuTR995nd9QLX6XKMPZ
	 dBahWhRxSOT2YuwhCDNXADAfG8psT3f2cRmvQFRGsCiWeHCQ1PFV388kZ/aGNaTttW
	 ZekfmvYndWEEiQI7xt0bnQG2lGVge7VkhxpoX/6HvSDORg1wPXjT5g7dodcS89GD27
	 3uHN0cT0DiLRhxmcHvN04VEAOQvbJDnagEKdEFY+W9ypQvXqgHO8jSOWEyg5tLM7Fo
	 5/HOd90F/tG2Q==
Date: Tue, 21 Jul 2026 14:46:23 +0100
From: Mark Brown <broonie@kernel.org>
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@kernel.org>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>, Mike Rapoport <rppt@kernel.org>
Subject: linux-next: manual merge of the tip tree with the
 mm-hotfixes-unstable tree
Message-ID: <al94LynD19vVIqw6@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/GOyAXf1Oc+gCXJ8"
Content-Disposition: inline


--/GOyAXf1Oc+gCXJ8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  arch/x86/mm/pat/set_memory.c

between commit:

  b8228ddfd0586 ("x86/mm/pat: allocate split page tables as kernel page tab=
les")

=66rom the mm-hotfixes-unstable tree and commit:

  5fce67641a3ed ("x86/mm/pat: Don't gate cpa_lock on debug_pagealloc_enable=
d()")

=66rom the tip tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc arch/x86/mm/pat/set_memory.c
index a67ca33b9dd12,1f2a2ba9ce57d..0000000000000
--- a/arch/x86/mm/pat/set_memory.c
+++ b/arch/x86/mm/pat/set_memory.c
@@@ -439,26 -441,12 +442,28 @@@ static void __cpa_collapse_large_pages(
 =20
  	list_for_each_entry_safe(ptdesc, tmp, &pgtables, pt_list) {
  		list_del(&ptdesc->pt_list);
 -		pagetable_free(ptdesc);
 +
 +		if (folio_test_pgtable(ptdesc_folio(ptdesc)))
 +			pagetable_dtor_free(ptdesc);
 +		else
 +			pagetable_free(ptdesc);
  	}
+=20
+ 	spin_unlock(&cpa_lock);
  }
 =20
 +static void cpa_collapse_large_pages(struct cpa_data *cpa)
 +{
 +	/*
 +	 * Take the mmap write lock on init_mm to:
 +	 * - Avoid a use-after-free if raced by ptdump (which takes its own
 +	 *   write lock on init_mm).
 +	 * - Serialise concurrent CPA walkers.
 +	 */
 +	scoped_guard(mmap_write_lock, &init_mm)
 +		__cpa_collapse_large_pages(cpa);
 +}
 +
  static void cpa_flush(struct cpa_data *cpa, int cache)
  {
  	unsigned int i;
@@@ -1249,18 -1237,16 +1253,16 @@@ __split_large_page(struct cpa_data *cpa
  static int split_large_page(struct cpa_data *cpa, pte_t *kpte,
  			    unsigned long address)
  {
 -	struct ptdesc *ptdesc;
 +	pte_t *pte;
 =20
- 	if (!debug_pagealloc_enabled())
- 		spin_unlock(&cpa_lock);
+ 	spin_unlock(&cpa_lock);
 -	ptdesc =3D pagetable_alloc(GFP_KERNEL, 0);
 +	pte =3D pte_alloc_one_kernel(&init_mm);
- 	if (!debug_pagealloc_enabled())
- 		spin_lock(&cpa_lock);
+ 	spin_lock(&cpa_lock);
 -	if (!ptdesc)
 +	if (!pte)
  		return -ENOMEM;
 =20
 -	if (__split_large_page(cpa, kpte, address, ptdesc))
 -		pagetable_free(ptdesc);
 +	if (__split_large_page(cpa, kpte, address, pte))
 +		pte_free_kernel(&init_mm, pte);
 =20
  	return 0;
  }

--/GOyAXf1Oc+gCXJ8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpfeC4ACgkQJNaLcl1U
h9BcFQf+LWCfiYskq8Vr+gLjopCiob7kFtgE5r9VORflzCpzXRXrXQEzm4+i8b4A
EnH59h2KpTOT80lm0FzlmMYpFKVSz9wvAWOXEpoOau/EVeNcLfSxkZNHUrspBTb+
VoCklEqqztXhVkCtvZ0TeuYR9elkv/TKyumCFxLc4EWXsz4yLIh8P8p+6Byrlhex
KSXCrdXPytnRF9fkDZy8Ikks2A5CwChIN/nnAflLMGXeNhwxDQooFyIOH9F6yuD/
c2+0fFGuFPwtaic81c4EBigYwHC/hN2AQWALIcFV3evdJQNGI6ZFoePBnbnrgItE
e1y6eIF80MUsG7ETLhPqkFHenu2Ibw==
=KCAI
-----END PGP SIGNATURE-----

--/GOyAXf1Oc+gCXJ8--
