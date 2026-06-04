Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 349F3356768;
	Thu,  4 Jun 2026 10:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780570762; cv=none; b=ZBBJWPTULUrGkbOuNK65D9DfQzIZtudS+XXjwgvuxVvTD0AdG2dCN//h/rkuth2XX6YzyoIleeLZ6iFI3sTOUwHRNPh8RAQS9uec0XxjRLspwTUwUouizfFl20kHeiX2MOdElKV60gbsnPQZb1tZf/flJxGIogvLo2x8K6MBDqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780570762; c=relaxed/simple;
	bh=XYGHeKwowYxYhbUg49NUixUYDpoMVeLNxB686/LZvuo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YQc3pHlDr8ZH3XZHLRKNz9hu9SN37mEuOBvZ5GCzDMa6TRyCP5O8h67kK/nj2+iMrKBv/09gjfgvI5uu9WE9k0CX2ZnqLEon92kefgJHHOMFm7/ntirvVpbBkn+o4ipDrnLNKkWba/F9a8caSowjQvzPbcINx0PzTycJ/qOFIIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=QrUk+Bgy; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="QrUk+Bgy"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Content-Description:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:In-Reply-To:References;
	bh=2ec4v9E88vZCFVppWUGEKmoCveFRHoOdqY/9bxA7aZE=; b=QrUk+BgyX7yHzyD+iW5f2c64F4
	tXfeuQNQS5/jDJSHY0qag3LmRwWgO5CE2ZOIVuXJPm1TW99qNL2rzxpVVlXM0ZVppipZGGhBvJPZv
	CnL14Lz8Qf6gpbdzzriqHv0QtecwvrGkJCUTlxHBU+vVygUtiiM2dmOOUaNBsLStSood04pDn6CX/
	GEYhQB4Fv2FTyynfaSQ3XLrs0WA/ZbIFDIyNYO5zo4AF/mxoea2LCGDUu1QV9WG3dGb9GD0rT0k62
	Mu/PF3ehbsGz+k5ym0P035urNwK35NdvNVy/dvC+o3O/JkAR5WelzoE6WwZ2syjH0BVxZ81A2SSyu
	I8mWlBDg==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wV5n5-004T7n-0T;
	Thu, 04 Jun 2026 10:59:11 +0000
Date: Thu, 4 Jun 2026 03:59:06 -0700
From: Breno Leitao <leitao@debian.org>
To: mst@redhat.com
Cc: mst@redhat.com, Andrew Morton <akpm@linux-foundation.org>, 
	Vlastimil Babka <vbabka@kernel.org>, david@kernel.org, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, linux-mm@kvack.org, 
	linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: BUG: mm: VM_BUG_ON_PAGE in post_alloc_hook() via
 __ClearPagePrezeroed() on compound pages
Message-ID: <aiFZeSKzb4HLfjFm@gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Description: avid@kernel.org>, Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Stephen
Content-Disposition: inline
X-Debian-User: leitao

Hi Michael,

Booting next-20260603 (a225caacc365) on arm64 with CONFIG_DEBUG_VM=y
panics in start_kernel() during kmem_cache_init():

  page dumped because: VM_BUG_ON_PAGE(1 && PageCompound(page))
  kernel BUG at ./include/linux/page-flags.h:682!
  Internal error: Oops - BUG: 00000000f2000800 [#1]  SMP
  CPU: 0 UID: 0 PID: 0 Comm: swapper Not tainted 7.1.0-rc6-next-20260603
  Hardware name: linux,dummy-virt (DT)
  pc : post_alloc_hook+0x224/0x2b8
  Call trace:
   post_alloc_hook+0x224/0x2b8 (P)
   get_page_from_freelist+0x18a4/0x1b18
   __alloc_frozen_pages_noprof+0x1b0/0x2068
   __alloc_pages_mpol+0x130/0x2d0
   alloc_frozen_pages_noprof+0x64/0xe8
   alloc_slab_page+0x88/0x140
   new_slab+0x11c/0x680
   ___slab_alloc+0x18c/0x7f0
   __kmalloc_noprof+0x534/0x938
   do_kmem_cache_create+0x724/0x890
   create_boot_cache+0xc8/0x148
   create_kmalloc_cache+0x5c/0xc8
   new_kmalloc_cache+0x274/0x438
   create_kmalloc_caches+0x2c/0x88
   kmem_cache_init+0x228/0x2e0
   mm_core_init+0x74/0xa0
   start_kernel+0x1cc/0x4d0

Bisected (by inspection) to:

  504f40f6bda6 ("mm: page_reporting: skip redundant zeroing of host-zeroed
                 reported pages")

Reproducer:
  - linux-next 20260603, arm64 defconfig + DEBUG_VM=y (any debug-heavy
    config will do; mine also has PROVE_LOCKING/DEBUG_LOCK_ALLOC, but
    those are not required to trip the BUG once an order>0 __GFP_COMP
    allocation hits prep_new_page).
  - Boot under qemu-system-aarch64 -M virt with earlycon enabled.

I've tested something like the following and  I was able to boot the host:

  --- a/include/linux/page-flags.h
  +++ b/include/linux/page-flags.h
  @@ -679,7 +679,7 @@ FOLIO_FLAG_FALSE(idle)
    * PagePrezeroed() tracks pages known to be zero.  The allocator
    * uses this to skip redundant zeroing in post_alloc_hook().
    */
  -__PAGEFLAG(Prezeroed, prezeroed, PF_NO_COMPOUND)
  +__PAGEFLAG(Prezeroed, prezeroed, PF_ANY)

With that change the lockdep+DEBUG_VM kernel boots all the way through
SMP init and hands off to PID 1 on arm64.

Happy to test a follow-up patch if you'd prefer a different shape.

Thanks,
--breno

