Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 912D63451CE;
	Wed, 28 Jan 2026 12:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769601914; cv=none; b=IWOFAX2btMwgW2gHfK5+7PTog7XDuu2C4H1UNLtFZwHNk8bkjXfZ5uqRihH5pvrgG4oYTGLQFNIwKAqdHQOeOFXR7xho+RxIWN0cSeFOnvKyNRrJoCg7As68k/oZAx7wuP9dqg3PAuYW/+z+Fqr4lUxLK5tUxYqr0zAt7FsZAGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769601914; c=relaxed/simple;
	bh=mZoGhIvcm/aY9O4mzCGFQinOBk/QBr1TOFbkCMKPD68=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=H3LAfQ6VMYQHABP5aV/znSG75zn20KlkVSf5GwLBP3x96hMKRYrXVHFXPPGYIyFwU4h/xKfWySh83o6B2z/dBCnRh9mibXEEgjCNRWkyODMn/wwJECFBG+zzl7cvdx6V6bC8djb6CQylUEl0LFCmwYyMsRxHL2w0QOORgxSbJKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a02hPlwu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a02hPlwu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1A80C4CEF1;
	Wed, 28 Jan 2026 12:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769601914;
	bh=mZoGhIvcm/aY9O4mzCGFQinOBk/QBr1TOFbkCMKPD68=;
	h=Date:From:To:Cc:Subject:From;
	b=a02hPlwu7NckS+hrgdt/6foA8vWiHKR13uesM6KR30za2szg2AvG1vLxiTj9CoFjn
	 PiZqbs/VzxnhZTYVghaGougxKS1WCSGGS/f9lGDNSIX+pBX0xgAgBfzJeD6VkpnJ13
	 /WQLWYEaRMAvmqdKstrzMoWxWpKMMp0RRUPy+gCHwO2t2stEqGa3pKq3ruRxIieNip
	 XmZjJzItKbuW3RV+i1NuG6JMHYLduBQgY3VsvO9ne3OQWe8UGha3eftJdGcnYpROkL
	 idHd7jP2IxRjmkhCdJ3bhDEMPdnRppo4B7f7W/h79mg82mk7IEk3wEOflHj914/gUn
	 HS/1WTphJNAxA==
Date: Wed, 28 Jan 2026 12:05:10 +0000
From: Mark Brown <broonie@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Oreoluwa Babatunde <oreoluwa.babatunde@oss.qualcomm.com>
Subject: linux-next: manual merge of the mm-stable tree with the
 dma-mapping-fixes tree
Message-ID: <aXn7doIFLJ3R-HCv@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Today's linux-next merge of the mm-stable tree got a conflict in:

  include/linux/cma.h

between commit:

  26332ae848f08 ("of: reserved_mem: Allow reserved_mem framework detect "cma=" kernel param")

from the dma-mapping-fixes tree and commit:

  9bda131c6093e ("mm: cma: add cma_alloc_frozen{_compound}()")

from the mm-stable tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc include/linux/cma.h
index 48bbc78db4479,e2a690f7e77eb..0000000000000
--- a/include/linux/cma.h
+++ b/include/linux/cma.h
@@@ -57,33 -62,4 +62,13 @@@ extern bool cma_intersects(struct cma *
  
  extern void cma_reserve_pages_on_error(struct cma *cma);
  
 +#ifdef CONFIG_DMA_CMA
 +extern bool cma_skip_dt_default_reserved_mem(void);
 +#else
 +static bool cma_skip_dt_default_reserved_mem(void)
 +{
 +	return false;
 +}
 +#endif
 +
- #ifdef CONFIG_CMA
- struct folio *cma_alloc_folio(struct cma *cma, int order, gfp_t gfp);
- bool cma_free_folio(struct cma *cma, const struct folio *folio);
- bool cma_validate_zones(struct cma *cma);
- #else
- static inline struct folio *cma_alloc_folio(struct cma *cma, int order, gfp_t gfp)
- {
- 	return NULL;
- }
- 
- static inline bool cma_free_folio(struct cma *cma, const struct folio *folio)
- {
- 	return false;
- }
- static inline bool cma_validate_zones(struct cma *cma)
- {
- 	return false;
- }
- #endif
- 
  #endif
