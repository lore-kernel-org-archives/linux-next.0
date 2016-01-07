From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the rcu tree
Date: Fri, 8 Jan 2016 07:19:32 +1100
Message-ID: <20160108071932.060a9bcc@canb.auug.org.au>
References: <20160107195725.3a130b4d@canb.auug.org.au>
	<20160107180244.GR3818@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:47581 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752709AbcAGUTf (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 7 Jan 2016 15:19:35 -0500
In-Reply-To: <20160107180244.GR3818@linux.vnet.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Paul,

On Thu, 7 Jan 2016 10:02:44 -0800 "Paul E. McKenney" <paulmck@linux.vnet.ibm.com> wrote:
>
> On Thu, Jan 07, 2016 at 07:57:25PM +1100, Stephen Rothwell wrote:
> > Hi Paul,
> > 
> > [I found this a few days ago, but I think I forgot to send the email,
> > sorry.]
> > 
> > After merging the rcu tree, today's linux-next build (powerpc
> > allyesconfig) failed like this:
> > 
> > kernel/rcu/rcuperf.o:(.discard+0x0): multiple definition of `__pcpu_unique_srcu_ctl_srcu_array'
> > kernel/rcu/rcutorture.o:(.discard+0x0): first defined here
> > 
> > Caused by commit
> > 
> >   abcd7ec0808e ("rcutorture: Add RCU grace-period performance tests")
> > 
> > I have reverted that commit for today.  
> 
> Hello, Stephen,
> 
> Very strange.  The "static" keyword does not mean anything here?
> Easy enough to use different symbols in the two different files,
> but this situation is not so good for information hiding.
> 
> Happy to update rcuperf.c to use a different name, but in the
> immortal words of MSDOS, "Are you sure?" :-)

I have no idea why it happens, but I do get the error above unless I
revert that commit.  So, yes, I am sure :-)

OK, I looked further and

DEFINE_STATIC_SRCU(srcu_ctl);

becomes this (NLs added for clarity):

static __attribute__((section(".discard"), unused)) char __pcpu_scope_srcu_ctl_srcu_array;
extern __attribute__((section(".discard"), unused)) char __pcpu_unique_srcu_ctl_srcu_array;
__attribute__((section(".discard"), unused)) char __pcpu_unique_srcu_ctl_srcu_array;
extern __attribute__((section(".data..percpu" ""))) __typeof__(struct srcu_struct_array) srcu_ctl_srcu_array;
__attribute__((section(".data..percpu" ""))) __attribute__((weak)) __typeof__(struct srcu_struct_array) srcu_ctl_srcu_array;
static struct srcu_struct srcu_ctl = {
	.
	.
};

So, the "static" is not very effective :-(

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
