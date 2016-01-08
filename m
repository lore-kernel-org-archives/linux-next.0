From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: linux-next: build failure after merge of the rcu tree
Date: Thu, 7 Jan 2016 20:48:35 -0800
Message-ID: <20160108044835.GB3818@linux.vnet.ibm.com>
References: <20160107195725.3a130b4d@canb.auug.org.au>
 <20160107180244.GR3818@linux.vnet.ibm.com>
 <20160108071932.060a9bcc@canb.auug.org.au>
 <20160107205220.GU3818@linux.vnet.ibm.com>
 <20160108013631.GA11410@fixme-laptop.cn.ibm.com>
 <20160108034157.GZ3818@linux.vnet.ibm.com>
 <20160108150850.1ec97e78@canb.auug.org.au>
Reply-To: paulmck@linux.vnet.ibm.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e31.co.us.ibm.com ([32.97.110.149]:44483 "EHLO
	e31.co.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753612AbcAHEsb (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 7 Jan 2016 23:48:31 -0500
Received: from localhost
	by e31.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-next@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
	Thu, 7 Jan 2016 21:48:30 -0700
Content-Disposition: inline
In-Reply-To: <20160108150850.1ec97e78@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Boqun Feng <boqun.feng@gmail.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@linux-foundation.org>

On Fri, Jan 08, 2016 at 03:08:50PM +1100, Stephen Rothwell wrote:
> Hi Paul,
> 
> On Thu, 7 Jan 2016 19:41:57 -0800 "Paul E. McKenney" <paulmck@linux.vnet.ibm.com> wrote:
> >
> > Indeed, I suspect that SRCU might not be the only thing that would like
> > static per-CPU variables.  ;-)
> 
> from include/linux/percpu-defs.h:
> 
>  * s390 and alpha modules require percpu variables to be defined as
>  * weak to force the compiler to generate GOT based external
>  * references for them.  This is necessary because percpu sections
>  * will be located outside of the usually addressable area.
>  *
>  * This definition puts the following two extra restrictions when
>  * defining percpu variables.
>  *
>  * 1. The symbol must be globally unique, even the static ones.
>  * 2. Static percpu variables cannot be defined inside a function.
>  *
>  * Archs which need weak percpu definitions should define
>  * ARCH_NEEDS_WEAK_PER_CPU in asm/percpu.h when necessary.
>  *
>  * To ensure that the generic code observes the above two
>  * restrictions, if CONFIG_DEBUG_FORCE_WEAK_PER_CPU is set weak
>  * definition is used for all cases.
> 
> so they can be static, but must be globally unique.

Thank you for the tutorial!  I have updated the patch to use a unique
name for the srcu_struct added by rcuperf.c.

							Thanx, Paul
