From: Richard Purdie <rpurdie@linux.intel.com>
Subject: Re: linux-next: drm tree build failure
Date: Mon, 12 Jan 2009 17:13:19 +0000
Message-ID: <1231780399.12963.47.camel@dax.rpnet.com>
References: <20090112141249.f9d72f6c.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:50327 "EHLO mga09.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752744AbZALRMw (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 12 Jan 2009 12:12:52 -0500
In-Reply-To: <20090112141249.f9d72f6c.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Dave Airlie <airlied@linux.ie>, linux-next@vger.kernel.org

On Mon, 2009-01-12 at 14:12 +1100, Stephen Rothwell wrote:
> Today's linux-next build (x86_64 allmodconfig) failed like this:
> 
> drivers/gpu/drm/i915/i915_dma.c: In function 'i915_initialize':
> drivers/gpu/drm/i915/i915_dma.c:183: error: 'drm_i915_init_t' has no member named 'sarea_priv'
> 
> Immediate cause is commit 21edb2690395e7a5281d0d5b5b8a9362491c9879
> ("drm/i915: setup sarea properly in master_priv").
> 
> I have dropped the drm tree for today.

I've also mentioned to this to Dave and there is a fixed version of that
patch in his inbox.

Cheers,

Richard
