From: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [Intel-gfx] linux-next: build failure after merge of the drm-intel	tree
Date: Mon, 23 May 2016 11:55:27 +0300
Message-ID: <87iny5dugw.fsf@intel.com>
References: <20160523122459.7d380f01@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:17512 "EHLO mga11.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753331AbcEWIzb (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 23 May 2016 04:55:31 -0400
In-Reply-To: <20160523122459.7d380f01@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, 23 May 2016, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi all,
>
> After merging the drm-intel tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>
> In file included from drivers/gpu/drm/i915/i915_trace.h:10:0,
>                  from drivers/gpu/drm/i915/i915_drv.h:2735,
>                  from drivers/gpu/drm/i915/i915_drv.c:34:
> drivers/gpu/drm/i915/intel_drv.h:36:41: fatal error: drm/drm_dp_dual_mode_helper.h: No such file or directory
>
> Caused by commit
>
>   8d87410a019f ("drm/i915: Respect DP++ adaptor TMDS clock limit")
>
> I have used the drm-intel tree from next-20160520 for today.

Hi Stephen, my bad, should be fixed now, sorry for the trouble.

(Note to self, don't even dream of doing this stuff when you're out
sick. Try to remember there was a reason you were out sick and not at
the office in the first place...)

BR,
Jani.

-- 
Jani Nikula, Intel Open Source Technology Center
