From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: Please add my kvm-mips linux-next branch
Date: Fri, 9 Sep 2016 03:21:49 +1000
Message-ID: <20160909032149.7dc5d5a6@canb.auug.org.au>
References: <20160908164501.GB26885@jhogan-linux.le.imgtec.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:47248 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752327AbcIHRVx (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 8 Sep 2016 13:21:53 -0400
In-Reply-To: <20160908164501.GB26885@jhogan-linux.le.imgtec.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: James Hogan <james.hogan@imgtec.com>, linux-next@vger.kernel.org

Hi James,

On Thu, 8 Sep 2016 17:45:01 +0100 James Hogan <james.hogan@imgtec.com> wrote:
>
> Please can you add the following branch to linux-next:
> 
> git://git.kernel.org/pub/scm/linux/kernel/git/jhogan/kvm-mips.git#next
> 
> It should probably go with the other kvm architecture branches after the
> main kvm one.

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
