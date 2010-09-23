From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: linux-next: build failure after merge of the sound tree
Date: Thu, 23 Sep 2010 09:39:31 +0100
Message-ID: <20100923083931.GA8918@opensource.wolfsonmicro.com>
References: <20100923124445.a2b5de42.sfr@canb.auug.org.au>
 <s5haan9ngg2.wl%tiwai@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:51999 "EHLO
	opensource2.wolfsonmicro.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1751791Ab0IWIjL (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Thu, 23 Sep 2010 04:39:11 -0400
Content-Disposition: inline
In-Reply-To: <s5haan9ngg2.wl%tiwai@suse.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Liam Girdwood <lrg@slimlogic.co.uk>

On Thu, Sep 23, 2010 at 08:04:45AM +0200, Takashi Iwai wrote:

> Ah, this was a quick fix for 2.6.36, but it needs to be reverted again
> for 2.6.37.  for-next branch contains 2.6.37 patches, thus it got
> broken.  I fixed now.  Mark, could you pull topic/asoc branch on my tree?

Will do, thanks.
