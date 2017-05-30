From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: Please add reset/next and reset/fixes to linux-next
Date: Tue, 30 May 2017 14:26:08 +1000
Message-ID: <20170530142608.0eb6fd7e@canb.auug.org.au>
References: <1496064197.17695.72.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:39593 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750811AbdE3E0L (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 30 May 2017 00:26:11 -0400
In-Reply-To: <1496064197.17695.72.camel@pengutronix.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-next@vger.kernel.org, kernel@pengutronix.de

Hi Philipp,

On Mon, 29 May 2017 15:23:17 +0200 Philipp Zabel <p.zabel@pengutronix.de> wrote:
>
> could you add the reset/next and reset/fixes branches to the linux-next
> tree? I use those to stage reset framework and driver patches before
> sending them off to be merged via arm-soc.
> 
> https://git.pengutronix.de/git/pza/linux reset/fixes
> https://git.pengutronix.de/git/pza/linux reset/next

Added from today.

Thanks for adding your subsystem tree as a participant of linux-next.  As
you may know, this is not a judgement of your code.  The purpose of
linux-next is for integration testing and to lower the impact of
conflicts between subsystems in the next merge window. 

You will need to ensure that the patches/commits in your tree/series have
been:
     * submitted under GPL v2 (or later) and include the Contributor's
        Signed-off-by,
     * posted to the relevant mailing list,
     * reviewed by you (or another maintainer of your subsystem tree),
     * successfully unit tested, and 
     * destined for the current or next Linux merge window.

Basically, this should be just what you would send to Linus (or ask him
to fetch).  It is allowed to be rebased if you deem it necessary.

-- 
Cheers,
Stephen Rothwell 
sfr@canb.auug.org.au
