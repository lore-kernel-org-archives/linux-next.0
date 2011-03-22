From: Samuel Ortiz <sameo@linux.intel.com>
Subject: Re: linux-next: manual merge of the mfd tree with Linus' tree
Date: Tue, 22 Mar 2011 12:08:46 +0100
Message-ID: <20110322110845.GD2351@sortiz-mobl>
References: <20110321122615.8a639909.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga03.intel.com ([143.182.124.21]:42270 "EHLO mga03.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755332Ab1CVLIt (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 22 Mar 2011 07:08:49 -0400
Content-Disposition: inline
In-Reply-To: <20110321122615.8a639909.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Philippe Langlais <philippe.langlais@linaro.org>

Hi Stephen,

On Mon, Mar 21, 2011 at 12:26:15PM +1100, Stephen Rothwell wrote:
> Hi Samuel,
> 
> Today's linux-next merge of the mfd tree got a conflict in
> arch/arm/mach-ux500/board-mop500-regulators.c and
> arch/arm/mach-ux500/board-mop500.c between commits d1de85a23144
> ("mach-ux500: add a few AB8500 regulator consumers v3") and a71b819b6edf
> ("mach-ux500: platform data for SFH7741 proximity sensor driver") from
> Linus' tree and commit 00423735a08e ("mach-ux500: configure board for the
> TPS61052 regulator v2") from the mfd tree.
As per Linus Walleij request, I dropped commit 00423735a08e from my for-next
branch. So this should be fixed now.
Thanks again for the heads up.

Cheers,
Samuel.

-- 
Intel Open Source Technology Centre
http://oss.intel.com/
