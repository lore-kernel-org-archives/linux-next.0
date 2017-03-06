From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: Please add new mux tree to linux-next
Date: Mon, 6 Mar 2017 22:51:09 +1100
Message-ID: <20170306225109.4032d790@canb.auug.org.au>
References: <6bd1debe-f5a2-29e3-9081-e63258625e37@axentia.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:56999 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753084AbdCFL7g (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 6 Mar 2017 06:59:36 -0500
In-Reply-To: <6bd1debe-f5a2-29e3-9081-e63258625e37@axentia.se>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Peter Rosin <peda@axentia.se>
Cc: linux-next@vger.kernel.org

Hi Peter,

On Mon, 6 Mar 2017 12:13:43 +0100 Peter Rosin <peda@axentia.se> wrote:
>
> Could you please add:
> 
> https://gitlab.com/peda-linux/mux.git for-next
> 
> To the linux-next tree? Greg K-H has agreed to be my upstream for
> this new mux subsystem and I'm hoping for it to end up in 4.12.

Added from tomorrow.

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
