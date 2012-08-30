From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH] ASoC: omap-mcbsp: Fix compilation error due to leftover
 code
Date: Thu, 30 Aug 2012 11:02:20 -0700
Message-ID: <20120830180219.GI4356@opensource.wolfsonmicro.com>
References: <1346335575-1592-1-git-send-email-peter.ujfalusi@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:54031 "EHLO
	opensource.wolfsonmicro.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751613Ab2H3SCY (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Thu, 30 Aug 2012 14:02:24 -0400
Content-Disposition: inline
In-Reply-To: <1346335575-1592-1-git-send-email-peter.ujfalusi@ti.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc: Liam Girdwood <lrg@ti.com>, alsa-devel@alsa-project.org, linux-next@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>

On Thu, Aug 30, 2012 at 05:06:15PM +0300, Peter Ujfalusi wrote:
> Part of commit (which patches sound/soc/omap/mcbsp.c file):
> 8fef626 ARM/ASoC: omap-mcbsp: Remove CLKR/FSR mux configuration code
> 
> since the tree where it has been applied did not had the earlier patch:
> d0db84e ASoC: omap-mcbsp: Fix 6pin mux configuration
> which changed code around omap_mcbsp_6pin_src_mux().
> 
> Because of the missing part from 8fef626 the sound/soc/omap/mcbsp.c does
> not compile in linux-next.

This makes little sense to me.  If the other patch is a dependency why
not merge that dependency?  What does this mean at the code level?
You're just talking about textual issues here, there's no semantic
information about what any of this stuff does or how the changes relate
to each other at all.

> When you applied 8fef626 you mentioned that it did not applied cleanly.
> The reason was that the branch did not had commit d0db84e applied prior to the
> series:
> http://mailman.alsa-project.org/pipermail/alsa-devel/2012-August/054668.html

> Now I can not find the d0db84e commit in the asoc tree (not in for-3.6, for-3.7
> and not in for-next branch) anymore.

The above doesn't mean much to me.
