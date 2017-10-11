From: Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [Intel-gfx] linux-next: build failure after merge of the
 drm-intel-fixes tree
Date: Wed, 11 Oct 2017 10:39:36 -0700
Message-ID: <20171011173936.bs32lwinrjlpgccn@intel.com>
References: <20171010070300.6fsdy52752resxqn@sirena.co.uk>
 <20171011085106.cusi65s2du3n537y@sirena.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:14330 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751487AbdJKRjk (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 11 Oct 2017 13:39:40 -0400
Content-Disposition: inline
In-Reply-To: <20171011085106.cusi65s2du3n537y@sirena.co.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>, Chris Wilson <chris@chris-wilson.co.uk>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Wed, Oct 11, 2017 at 08:51:06AM +0000, Mark Brown wrote:
> On Tue, Oct 10, 2017 at 08:03:00AM +0100, Mark Brown wrote:
> > Hi all,
> > 
> > After merging the drm-misc-fixes tree, today's linux-next build
> > (x86_allmodconfig) failed like this:
> > 
> >   CC [M]  drivers/gpu/drm/i915/i915_gem_evict.o
> > drivers/gpu/drm/i915/i915_gem_evict.c: In function ‘i915_gem_evict_for_node’:
> > drivers/gpu/drm/i915/i915_gem_evict.c:318:31: error: implicit declaration of function ‘i915_vma_has_userfault’; did you mean ‘i915_vma_pin_count’? [-Werror=implicit-function-declaration]
> >    if (flags & PIN_NONFAULT && i915_vma_has_userfault(vma)) {
> >                                ^~~~~~~~~~~~~~~~~~~~~~
> >                                i915_vma_pin_count
> > 
> > Caused by commit
> > 
> >   72872c99b6dbc ("drm/i915: Check PIN_NONFAULT overlaps in evict_for_node")
> > 
> > in the drm-intel-fixes tree.  I've used the tree from yesterday.
> 
> This is still present today.

It is fixed now. Sorry for the trouble.

> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
