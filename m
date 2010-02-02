From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: linux-next: sound tree build failure
Date: Tue, 2 Feb 2010 10:42:15 +0000
Message-ID: <20100202104215.GD6566@rakim.wolfsonmicro.main>
References: <20100202124711.d8cdc220.sfr@canb.auug.org.au>
 <s5heil4cd2g.wl%tiwai@suse.de>
 <20100202103112.GB6566@rakim.wolfsonmicro.main>
 <s5hwryvapks.wl%tiwai@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:38356 "EHLO
	opensource2.wolfsonmicro.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1752964Ab0BBKmR (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 2 Feb 2010 05:42:17 -0500
Content-Disposition: inline
In-Reply-To: <s5hwryvapks.wl%tiwai@suse.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Samuel Ortiz <sameo@linux.intel.com>

On Tue, Feb 02, 2010 at 11:40:03AM +0100, Takashi Iwai wrote:
> Mark Brown wrote:

> > No, it needs to look at things like the multi-function pin configuration
> > in order to configure itself correctly.

> Hm, then shouldn't it depend on mfd?

Yes, I've got a patch for that which I'll send shortly (though that
shouldn't affect the -next build it will affect the sound build).
