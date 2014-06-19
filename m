From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Jun 19 (drm/i915)
Date: Thu, 19 Jun 2014 10:24:42 -0700
Message-ID: <53A31CDA.20207@infradead.org>
References: <20140619161632.58b442e4@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:60324 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933062AbaFSRYn (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 19 Jun 2014 13:24:43 -0400
In-Reply-To: <20140619161632.58b442e4@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>, intel-gfx <intel-gfx@lists.freedesktop.org>, dri-devel <dri-devel@lists.freedesktop.org>

On 06/18/14 23:16, Stephen Rothwell wrote:
> Hi all,
> 
> The powerpc allyesconfig is again broken more than usual.
> 
> Changes since 20140618:
> 

on i386:

CONFIG_ACPI is not enabled.

  CC      drivers/gpu/drm/i915/i915_drv.o
../drivers/gpu/drm/i915/i915_drv.c: In function 'i915_drm_freeze':
../drivers/gpu/drm/i915/i915_drv.c:547:2: error: implicit declaration of function 'acpi_target_system_state' [-Werror=implicit-function-declaration]
../drivers/gpu/drm/i915/i915_drv.c:547:36: error: 'ACPI_STATE_S3' undeclared (first use in this function)
../drivers/gpu/drm/i915/i915_drv.c:547:36: note: each undeclared identifier is reported only once for each function it appears in
  CC      net/dccp/qpolicy.o
cc1: some warnings being treated as errors
make[5]: *** [drivers/gpu/drm/i915/i915_drv.o] Error 1



-- 
~Randy
