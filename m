Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B4533F6C33
	for <linux-next@vger.kernel.org>; Thu, 23 Jul 2026 21:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784842050; cv=none; b=icZcfrXKbLxZQQszoEdF6YZISSx6nyEp64id24xB+vNKSr9o575Z/gqfgH24/TsbnBY0GV1Gs9+C8kPy+SYa3zaBE07LMIwHOFiWDcJ37yuxWaf1Nrv9GVe7ziZB6KvpVW3QphQmwARTar0KNZeLeIuDHfm7WUQSUQb3rBOYNDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784842050; c=relaxed/simple;
	bh=fDAVypStLtgTURyoI9cb2UdC0pejK1ODSnOpC1siBk8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rjUFdaH+m7+JitTsaHtlyKOuwoWwRBC/k++Hu+gPYsRbaGIy0I2iMXQfTXTCPn/QDUL4a489eH5z/ak7rG1BwRUtBhV+fKDOwHH/2Go8WsYg2Fd9PGXzFj3xvEN/kV23/sD5FX8shMU1V0jH8bSa02i0KksrCk2aKdpIUfSoQ1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ay2F9Grl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ay2F9Grl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 007D81F000E9;
	Thu, 23 Jul 2026 21:27:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784842049;
	bh=AUfWlxIB863kcySC1ByZPwzpGUvhrXH4mfz+j0Cwkso=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ay2F9Grle9jiAXSao0E8ftufzBgOuPw8cg9e8lbBkO8ZBND6rbnOhAAX5l3rxCzGC
	 nYGG6CUjZiQYh53aIKBeemLraVF3FjL7nLenA6LE+mMG8L9NX6sWIGFrvHimjfE6yK
	 gnQ2jd9vD5mpOyWrMZDGAH4ZnqESrGdn+l5hkbAFmwZ2TM3Aa0I2Y0ks/vVYbaGbCl
	 A7wEmMFEnjhCjo6PP6roVGsf0nfS10QW7L9dP9Xdei5T9AWZqfSJMm+jGikpDFdPHH
	 NXOGldMWZJv77IR/7hCGfcN7Y97nSqXojDl99vPKmQhAKH38jAf6aVSw1zxFavSLM4
	 GprCvkcgiItWQ==
Date: Thu, 23 Jul 2026 14:27:24 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Matthew Brost <matthew.brost@intel.com>
Cc: Mark Brown <broonie@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Usama Arif <usama.arif@linux.dev>, linux-mm@kvack.org,
	dri-devel@lists.freedesktop.org, linux-next@vger.kernel.org
Subject: Re: Semantic conflict between 04b177544a04 in drm-misc-fixes and
 0b6b1bb28482 in -mm
Message-ID: <20260723212724.GA999236@ax162>
References: <20260722225605.GA1910198@ax162>
 <amFPJc1NQbuYWlSp@gsse-cloud1.jf.intel.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <amFPJc1NQbuYWlSp@gsse-cloud1.jf.intel.com>

On Wed, Jul 22, 2026 at 04:15:49PM -0700, Matthew Brost wrote:
> On Wed, Jul 22, 2026 at 03:56:05PM -0700, Nathan Chancellor wrote:
> > Hi Mark and drm and mm folks,
> > 
> 
> Typically to get drm_pagemap.c to compile on various configs this is
> what is needed:
> 
> 109 #ifdef CONFIG_PGTABLE_HAS_HUGE_LEAVES
> 110 #define HPAGE_PMD_SHIFT PMD_SHIFT
> 111 #define HPAGE_PUD_SHIFT PUD_SHIFT
> 112 #else
> 113 #define HPAGE_PMD_SHIFT ({ BUILD_BUG(); 0; })
> 114 #define HPAGE_PUD_SHIFT ({ BUILD_BUG(); 0; })
> 115 #endif
> 
> So the drm_pagemap.c code could be:
> 
> -#if IS_ENABLED(CONFIG_ARCH_ENABLE_THP_MIGRATION)
> +#if IS_ENABLED(CONFIG_PGTABLE_HAS_HUGE_LEAVES)
> #define DRM_PAGEMAP_PMD_ORDER        HPAGE_PMD_ORDER
> #else
> #define DRM_PAGEMAP_PMD_ORDER        (-1)

Ah yeah, I probably should have looked at the bigger picture there.

> This Kconfig has been around since 2024:
> git format-patch -1 b979db1611a63
> 
> Would it be better for everyone for me to change this in the DRM branches?

I believe that would render this conflict moot and seems like the
correct thing to do anyways but you could wait for input from the mm
folks.

> > There is a semantic conflict between commit 04b177544a04 ("drm/pagemap:
> > Guard HPAGE_PMD_ORDER use with CONFIG_ARCH_ENABLE_THP_MIGRATION") in the
> > drm-misc-fixes tree and commit 0b6b1bb28482 ("mm: rename
> > ARCH_ENABLE_THP_MIGRATION to ARCH_HAS_PMD_SOFTLEAVES"), resulting in a
> > lone instance of CONFIG_ARCH_ENABLE_THP_MIGRATION with no way to define
> > it.
> > 
> >   $ git grep ARCH_ENABLE_THP_MIGRATION
> >   Next/merge.log:Merging drm-misc-fixes/for-linux-next-fixes (04b177544a040 drm/pagemap: Guard HPAGE_PMD_ORDER use with CONFIG_ARCH_ENABLE_THP_MIGRATION)
> >   drivers/gpu/drm/drm_pagemap.c:#if IS_ENABLED(CONFIG_ARCH_ENABLE_THP_MIGRATION)
> > 
> > This results in an objtool warning (or error with CONFIG_OBJTOOL_WERROR)
> > when building with clang because NR_PAGES(order) results in 1U << -1,
> > which causes clang to stop generating code for
> > drm_pagemap_migrate_to_devmem() when encountering unconditional
> > undefined behavior.
> > 
> >   drivers/gpu/drm/drm_gpusvm_helper.o: error: objtool: drm_pagemap_migrate_to_devmem() falls through to next function drm_pagemap_zdd_alloc()
> > 
> > Mark, could please apply the following diff to the -mm merge to avoid
> > this? Obviously, there will need to be further coordination for
> > resolving this upstream when the time comes but it is only an issue in
> > -next currently.
> > 
> > diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/drm_pagemap.c
> > index 4a794544b7dc..f00c27edbfb9 100644
> > --- a/drivers/gpu/drm/drm_pagemap.c
> > +++ b/drivers/gpu/drm/drm_pagemap.c
> > @@ -12,7 +12,7 @@
> >  #include <drm/drm_pagemap_util.h>
> >  #include <drm/drm_print.h>
> >  
> > -#if IS_ENABLED(CONFIG_ARCH_ENABLE_THP_MIGRATION)
> > +#if IS_ENABLED(CONFIG_ARCH_HAS_PMD_SOFTLEAVES)
> >  #define DRM_PAGEMAP_PMD_ORDER	HPAGE_PMD_ORDER
> >  #else
> >  #define DRM_PAGEMAP_PMD_ORDER	(-1)
> > -- 
> > Cheers,
> > Nathan

-- 
Cheers,
Nathan
