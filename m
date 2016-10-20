From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: including PHY tree in linux-next
Date: Fri, 21 Oct 2016 09:00:41 +1100
Message-ID: <20161021090041.46cc5fee@canb.auug.org.au>
References: <5808995C.3010300@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:59811 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932826AbcJTWAo (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 20 Oct 2016 18:00:44 -0400
In-Reply-To: <5808995C.3010300@ti.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Kishon Vijay Abraham I <kishon@ti.com>
Cc: linux-next@vger.kernel.org

Hi Kishon,

On Thu, 20 Oct 2016 15:45:56 +0530 Kishon Vijay Abraham I <kishon@ti.com> wrote:
>
> Can you include the following branches for linux-phy tree into linux-next?
> 
> git://git.kernel.org/pub/scm/linux/kernel/git/kishon/linux-phy.git next
> git://git.kernel.org/pub/scm/linux/kernel/git/kishon/linux-phy.git fixes

Added from today (called phy-next and phy respectively).  Will these be
merged via Dave Miller's trees, or directly to Linus?

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
