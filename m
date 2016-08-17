From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: request new tree for linux-next
Date: Thu, 18 Aug 2016 09:48:35 +1000
Message-ID: <20160818094835.170ef2fd@canb.auug.org.au>
References: <CAJfpegsWt52zN33xzyXzQEjmT-rTjJG6vU_vQ_iEejFtVZ-MYA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:48852 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752992AbcHQXso (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 17 Aug 2016 19:48:44 -0400
In-Reply-To: <CAJfpegsWt52zN33xzyXzQEjmT-rTjJG6vU_vQ_iEejFtVZ-MYA@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: linux-next@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>

Hi Miklos,

On Wed, 17 Aug 2016 14:58:17 +0200 Miklos Szeredi <miklos@szeredi.hu> wrote:
>
> Could you please add
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/mszeredi/vfs.git#next
> 
> to -next?
> 
> This is for any filesystem related stuff that doesn't fit in the fuse
> or overlayfs queues.

Added from today.  Called vfs-miklos.  Is this intended to be merged
via Al's tree, or directly to Linus?

I do note that none of the commits have any Acked-by or Reviewed-by tags ...

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
