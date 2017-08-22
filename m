From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: Tree for Aug 22
Date: Wed, 23 Aug 2017 08:27:11 +1000
Message-ID: <20170823082711.50fa0ef6@canb.auug.org.au>
References: <20170822183816.7925e0f8@canb.auug.org.au>
        <20170823041117.780097f7@canb.auug.org.au>
        <20170823041424.1dddeb2d@canb.auug.org.au>
        <20170822185923.GE11320@linux.vnet.ibm.com>
        <20170823051216.34f2c09f@canb.auug.org.au>
        <20170822193231.GF11320@linux.vnet.ibm.com>
        <20170822193620.GA7752@linux.vnet.ibm.com>
        <20170823075705.75432321@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170823075705.75432321@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, ppc-dev <linuxppc-dev@lists.ozlabs.org>, Nicholas Piggin <npiggin@gmail.com>
List-Id: linux-next.vger.kernel.org

Hi Paul,

On Wed, 23 Aug 2017 07:57:05 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> On Tue, 22 Aug 2017 12:36:20 -0700 "Paul E. McKenney" <paulmck@linux.vnet.ibm.com> wrote:
> >
> > To complete the thought, if you aren't already using it, I suggest
> > applying Nick's patch:
> > 
> > http://lkml.kernel.org/r/20170822084348.21436-1-npiggin@gmail.com  
> 
> OK, I applied that - with a little shoehorning due to commit
> 
>   71acb768f5b3 ("timers: Fix excessive granularity of new timers after a nohz idle")
> 
> from your cru tree.
            ^^^
(I meant rcu, of course)

I will apply the resulting patch to linux-next (as part of the rcu tree
merge) today - unless you get around to updating your tree before then.

-- 
Cheers,
Stephen Rothwell
