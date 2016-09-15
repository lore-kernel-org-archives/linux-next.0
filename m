From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: removal of the kgdb tree
Date: Fri, 16 Sep 2016 07:49:07 +1000
Message-ID: <20160916074907.3355feff@canb.auug.org.au>
References: <20160309161650.2477ec9e@canb.auug.org.au>
        <8767b8c5-d156-9b5a-5376-cc313652bb2f@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:35336 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754421AbcIOVtL (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 15 Sep 2016 17:49:11 -0400
In-Reply-To: <8767b8c5-d156-9b5a-5376-cc313652bb2f@windriver.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jason Wessel <jason.wessel@windriver.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Jason,

On Thu, 15 Sep 2016 07:16:18 -0500 Jason Wessel <jason.wessel@windriver.com> wrote:
>
> On 03/08/2016 11:16 PM, Stephen Rothwell wrote:
> >
> > I noticed that the kgdb tree
> >
> >   git://git.kernel.org/pub/scm/linux/kernel/git/jwessel/kgdb.git branch kgdb-next
> >
> > has not been updated since March 2015.  I am going to remove it from
> > linux-next tomorrow unless I hear that it may be useful.  It can always
> > be easily added back if it proves useful in the future.
> >  
> 
> The time has finally arrived.  :-)
> 
> Could you please add the kgdb-next branch back to linux-next.

Done from today.

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
