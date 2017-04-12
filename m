From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: Please add imx-drm/next and etnaviv/next to linux-next
Date: Thu, 13 Apr 2017 01:21:52 +1000
Message-ID: <20170413012152.0e39a94c@canb.auug.org.au>
References: <1492005584.15082.20.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:48027 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752513AbdDLPV4 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 12 Apr 2017 11:21:56 -0400
In-Reply-To: <1492005584.15082.20.camel@pengutronix.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Lucas Stach <l.stach@pengutronix.de>
Cc: linux-next@vger.kernel.org, dri-devel@lists.freedesktop.org, kernel@pengutronix.de, Philipp Zabel <p.zabel@pengutronix.de>

Hi Lucas,

On Wed, 12 Apr 2017 15:59:44 +0200 Lucas Stach <l.stach@pengutronix.de> wrote:
>
> can you please add imx-drm/next and etnaviv/next to the linux-next tree?
> 
> Both trees stage patches which will eventually feed into Dave Airlie's
> drm-next tree.
> 
> https://git.pengutronix.de/git/pza/linux imx-drm/next
> 
> https://git.pengutronix.de/git/lst/linux etnaviv/next

Added from tomorrow with just you as contact.  Let me know if there
should be other contacts.

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
