From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: unsigned commit in the rcu tree
Date: Mon, 27 Mar 2017 09:45:49 +1100
Message-ID: <20170327094549.1868c8e5@canb.auug.org.au>
References: <20170327003327.3d5bf230@canb.auug.org.au>
        <20170326162204.GX3637@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:46317 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751380AbdCZWro (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 26 Mar 2017 18:47:44 -0400
In-Reply-To: <20170326162204.GX3637@linux.vnet.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: linux-next@vger.kernel.org

Hi Paul,

On Sun, 26 Mar 2017 09:22:04 -0700 "Paul E. McKenney" <paulmck@linux.vnet.ibm.com> wrote:
>
> On Mon, Mar 27, 2017 at 12:33:27AM +1100, Stephen Rothwell wrote:
> > Hi Paul,
> > 
> > Commit 08b35b89141a ("fixup! srcu: Create a tiny SRCU") has not
> > Signed-off-by tag at all :-(
> > 
> > Please do not put commits in your linux-next included branch that are
> > not signed.  
> 
> I should have done the rebase before pushing, which I have now done.
> Please accept my apologies for the noise!

Now worries, but I think you forgot to push (i.e. that commit is still
the top of the rcu tree as I see it) ...

-- 
Cheers,
Stephen Rothwell
