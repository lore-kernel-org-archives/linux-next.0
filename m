From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: Inclusion in linux-next
Date: Fri, 22 Apr 2016 08:03:51 +1000
Message-ID: <20160422080351.791b3f46@canb.auug.org.au>
References: <20160420093251.GX6349@leon.nu>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:58103 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751302AbcDUWDy (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 21 Apr 2016 18:03:54 -0400
In-Reply-To: <20160420093251.GX6349@leon.nu>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Leon Romanovsky <leon@kernel.org>, linux-next@vger.kernel.org
Cc: Doug Ledford <dledford@redhat.com>

Hi Leon,

On Wed, 20 Apr 2016 12:32:51 +0300 Leon Romanovsky <leon@kernel.org> wrote:
>
> I would like to add my tree [1] in linux-next automatic tree merge.
> What do I need to do for it? Do I need to prepare/send anything?
> 
> I thought about two branches for inclusion, but would be glad to hear
> your opinion if it is right thing to do and maybe I need only one.
> 
> My goal is to create clean tree from different topic branches.
> 
> Branches:
> * rdma-next - this branch will serve as a main for next (not RCs fixes) pull requests. No rebase.
> * testing/rdma-next - this branch will serve as a testing branch for topic
> 			merges and different companies quals. Rebased.
> 
> [1] git://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git

Included from today.  I have called them rdma-leon and rdma-leon-test.

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
