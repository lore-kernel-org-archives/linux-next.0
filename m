From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: linux-next: sound tree build failure
Date: Mon, 16 Mar 2009 10:59:02 +0000
Message-ID: <20090316105902.GA20990@rakim.wolfsonmicro.main>
References: <20090316213932.70ed9550.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:38609 "EHLO
	opensource2.wolfsonmicro.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1751340AbZCPK7H (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Mon, 16 Mar 2009 06:59:07 -0400
Content-Disposition: inline
In-Reply-To: <20090316213932.70ed9550.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Takashi Iwai <tiwai@suse.de>, linux-next@vger.kernel.org, Eric Miao <eric.y.miao@gmail.com>

On Mon, Mar 16, 2009 at 09:39:32PM +1100, Stephen Rothwell wrote:

> Today's linux-next build (powerpc allyesconfig) failed like this:

> sound/soc/codecs/twl4030.c:1400: warning: braces around scalar initializer
> sound/soc/codecs/twl4030.c:1400: warning: (near initialization for 'twl4030_dai.ops')

I'll push a fix for this later today.
