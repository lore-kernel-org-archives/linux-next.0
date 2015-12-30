From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: HDLCD tree for linux-next
Date: Thu, 31 Dec 2015 09:00:03 +1100
Message-ID: <20151231090003.1e8b4b6d@canb.auug.org.au>
References: <20151223143022.GY960@e106497-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:49511 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750940AbbL3WAG (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 30 Dec 2015 17:00:06 -0500
In-Reply-To: <20151223143022.GY960@e106497-lin.cambridge.arm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Liviu Dudau <Liviu.Dudau@arm.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Dave Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org

Hi Liviu,

On Wed, 23 Dec 2015 14:30:23 +0000 Liviu Dudau <Liviu.Dudau@arm.com> wrote:
>
> I would like to add the HDLCD DRM driver tree to linux-next. I'm planning
> to send a pull request for inclusion into v4.5 and I hope that getting a
> wider exposure for a few weeks is beneficial.
> 
> Please add the following git tree:
> 
>    git://linux-arm.org/linux-ld for-upstream/hdlcd
> 
> It is based on Dave Airlie's drm-next tree as of 23rd of December.

Added from today (though there may not be a release until Monday).

Thanks for adding your subsystem tree as a participant of linux-next.  As
you may know, this is not a judgment of your code.  The purpose of
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
