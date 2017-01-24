From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: Please add extable branch to linux-next
Date: Wed, 25 Jan 2017 09:50:06 +1100
Message-ID: <20170125095006.141e71c8@canb.auug.org.au>
References: <20170124214207.GW29778@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:33863 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750827AbdAXWuJ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 24 Jan 2017 17:50:09 -0500
In-Reply-To: <20170124214207.GW29778@windriver.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: linux-next@vger.kernel.org

Hi Paul,

On Tue, 24 Jan 2017 16:42:08 -0500 Paul Gortmaker <paul.gortmaker@windriver.com> wrote:
>
> Would you please add the "extable" branch to linux-next for a once around
> addition from this repo?
> 
> git://git.kernel.org/pub/scm/linux/kernel/git/paulg/linux.git

Added from today.  If I forget to remove it once it is merged, please
just remind me, thanks.

One thing, once you get an Acked-by from someone, you may as well
remove the Cc tag for them.

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
