Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95B6C6FC5;
	Sun, 26 Jul 2026 21:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785101639; cv=none; b=aFO7iqBE3CzS2WpyZCVSE8MPPt25YNjRXyOBKInMXo3jn8ohph77aCunHahxMRSnUBkQvEwlXiuZdJ1yQJULKzuv3jyZ8USd/eRokokiBldNajZwW/Tw7UCSHtBbalTgDPNEysZTUE+16lOeZd9mNp8EARlgv4dtwoIbEK9O5YE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785101639; c=relaxed/simple;
	bh=EO/enUGpLfTkWUOYBRACuZI/qyge+mSk9WqQQKZXEdU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UNIsAksSsginPjhsnjETEo5kl5Vwzp8P6dNEfOgf1GpuJCBZPnsdjqF5qz7BT3F1PhK/DHPUWEB0FoE6kT4g5Y2lyH+qMnWqyK/Xp5OUcghn+20X2/fpVuufeTzOqEk8pNby3DCL4rcPqu936ICqTMUoEf6Qs7yCaN4fTMF0+HI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P3tw7yDN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P3tw7yDN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AAF51F000E9;
	Sun, 26 Jul 2026 21:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785101638;
	bh=YwG/Tfq1YJkJ7Lw3R+2+EN1VYQK4aaxpQXtv1rAQhkk=;
	h=Date:From:To:Cc:Subject;
	b=P3tw7yDNZHpPtuK5oPwB3dec4SV0SJeM9oMGXFhad5QMdYSLFw1PinWCswlMcdjy4
	 pOx/zbCGoUngQFQy7tvS021JdS3CL8uGWH3Z3zi+snb46fy+0EVbIxOMTUj/iEKCjC
	 aM8eUB3aCCUY/VUibI3ogvZ+zJetduSj+1bl5Yp5jTY0e4F9IoQIv9WdCHulwNDn+T
	 LIZvSJB43KA++A/rg5WVkb9cFuR8Hb2K1KGBPgyuIdj8Ok+rx5Q9D/zc1XegbmiK0L
	 jzh245GN8Wa/f1GKsoz7bv6/hAtepcEJMd7xcjyg/2nYbF9zO19ICs44MdEzsNsXv0
	 cRU6qTnI2hBwg==
Date: Sun, 26 Jul 2026 22:33:53 +0100
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
Message-ID: <amZ9QR_9NYqq6JMy@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="I41KaYYt2+F4dI+b"
Content-Disposition: inline


--I41KaYYt2+F4dI+b
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  arch/x86/mm/pat/set_memory.c

between commits:

  7a7c16a2d2b4d ("x86/mm/pat: acquire init_mm read lock on attribute change=
 to avoid UAF")
  25a54f65ccbaf ("x86/mm/pat: allocate split page tables as kernel page tab=
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
index 422ce7fba00c6,1f2a2ba9ce57d..0000000000000
--- a/arch/x86/mm/pat/set_memory.c
+++ b/arch/x86/mm/pat/set_memory.c
@@@ -440,30 -441,12 +443,32 @@@ static void __cpa_collapse_large_pages(
 =20
  	list_for_each_entry_safe(ptdesc, tmp, &pgtables, pt_list) {
  		list_del(&ptdesc->pt_list);
 -		pagetable_free(ptdesc);
 +		/*
 +		 * Only early alloc'd direct map should not be flagged PG_table
 +		 * here and those shouldn't be collapsed. However be abundantly
 +		 * cautious and handle the !PG_table case too.
 +		 */
 +		if (PageTable((ptdesc_page(ptdesc))))
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
@@@ -1254,22 -1237,16 +1258,20 @@@ __split_large_page(struct cpa_data *cpa
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
 +	if (cpa->init_mm_read_locked)
 +		mmap_read_unlock(&init_mm);
 +	pte =3D pte_alloc_one_kernel(&init_mm);
 +	if (cpa->init_mm_read_locked)
 +		mmap_read_lock(&init_mm);
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

--I41KaYYt2+F4dI+b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpmfUAACgkQJNaLcl1U
h9D+Egf+Ik63Ln8M58ZzRVhdL9YWVNmwKGzQYfuSNFwnlxaflmlfXkqCFp3sIRGy
6j2s1ww2xKi6FHykNum05ifzx7FRuDQkfDpjT1FX0g/owg3NKjY4njiXR6yJOadS
ts5aBDX194/J5UHuD9yDat/UOJiq6kRyAXkPfPw1wWN1q4r8z2VmnPe/huBPXJQ/
jrWFoXuC51OU4aLILK5kFrLFHQY6EPQr5U2fdD0IXXlkx6T5A8Uy7Buk79z1rmpv
BTz44vUh6QI+ai5iNuofslurlW7l9hHG/0E2UdR9b0WuqPKC05QD9HMECEEzCLOx
k1zhuTf3ubym/4+z73fdeEWZY8B39Q==
=i9uX
-----END PGP SIGNATURE-----

--I41KaYYt2+F4dI+b--
