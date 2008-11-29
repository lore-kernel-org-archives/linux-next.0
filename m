From: David Woodhouse <dwmw2@infradead.org>
Subject: Re: linux-next: manual merge of the firmware tree
Date: Sat, 29 Nov 2008 10:11:45 +0000
Message-ID: <1227953505.22021.6.camel@macbook.infradead.org>
References: <20081128160339.23fa014f.sfr@canb.auug.org.au>
	 <49308976.7010206@chelsio.com>
	 <20081129114846.4b97cd96.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([18.85.46.34]:40389 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751082AbYK2KLx (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 29 Nov 2008 05:11:53 -0500
In-Reply-To: <20081129114846.4b97cd96.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Divy Le Ray <divy@chelsio.com>, linux-next@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Jaswinder Singh <jaswinder@infradead.org>

On Sat, 2008-11-29 at 11:48 +1100, Stephen Rothwell wrote:
> On Fri, 28 Nov 2008 16:14:46 -0800 Divy Le Ray <divy@chelsio.com> wrote:
> > I created this situation and apologize for it. I should have sent the
> > patch to the firmware tree maintainer.

No, I think you did the right thing. Thank you for the patch.

> Its not a big issue - the conflict has a very obvious resolution and "git
> rerere" remembers it for me.  As far as I know, there is no "firmware
> maintainer" - David just has a git tree that was used when the initial
> conversions were done.  Some of those have not yet been finalised and so
> are still in his tree.

I had said that it's time for the 'firmware tree' to be discarded, and
the patches pushed upstream via the appropriate maintainers. The reason
I'd waited was because I'd told DaveM I'd wait for the dust to settle on
the first round of patches before sending the rest.

Now I'm a little concerned about the conflicts in the WHENCE file if we
have patches going through different routes. Perhaps we should stop just
adding stuff at the _end_ and sort it? Or rearrange it differently?

-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation
