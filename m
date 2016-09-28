From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: Please add xtensa arch tree to the linux-next
Date: Thu, 29 Sep 2016 08:12:53 +1000
Message-ID: <20160929081253.191cd14c@canb.auug.org.au>
References: <CAMo8BfJ88XK=PAmgTGt0fBm+pm=17BF7G6wva-4LNOjYBMMqew@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:44105 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754310AbcI1WMz (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 28 Sep 2016 18:12:55 -0400
In-Reply-To: <CAMo8BfJ88XK=PAmgTGt0fBm+pm=17BF7G6wva-4LNOjYBMMqew@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Max Filippov <jcmvbkbc@gmail.com>
Cc: Linux-Next <linux-next@vger.kernel.org>, Chris Zankel <chris@zankel.net>, Marc Gauthier <marc@cadence.com>

Hi Max,

On Wed, 28 Sep 2016 13:59:31 -0700 Max Filippov <jcmvbkbc@gmail.com> wrote:
>
> can you please add the following branch with xtensa architecture-specific
> patches to linux-next:
> 
> git://github.com/jcmvbkbc/linux-xtensa.git#xtensa-for-next
> 
> in replacement of the branch from Chris?

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
