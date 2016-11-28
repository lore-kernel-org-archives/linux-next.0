From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: Add modules-next branch to linux-next
Date: Mon, 28 Nov 2016 16:12:30 +1100
Message-ID: <20161128161230.5f28b34d@canb.auug.org.au>
References: <20161126224209.iqrmopqv3b2augpb@jeyu>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:52893 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751597AbcK1FMn (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 28 Nov 2016 00:12:43 -0500
In-Reply-To: <20161126224209.iqrmopqv3b2augpb@jeyu>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jessica Yu <jeyu@redhat.com>
Cc: Rusty Russell <rusty@rustcorp.com.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Jessica,

On Sat, 26 Nov 2016 14:42:09 -0800 Jessica Yu <jeyu@redhat.com> wrote:
>
> Could you please add the modules-next branch at:
> 
>    git://git.kernel.org/pub/scm/linux/kernel/git/jeyu/linux.git modules-next
> 
> to linux-next? The branch contains patches for modules targeted for the next
> merge window. It is meant to replace Rusty's old modules-next branch.

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
