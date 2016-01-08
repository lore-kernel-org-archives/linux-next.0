From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: linux-next: build failure after merge of the rcu tree
Date: Thu, 7 Jan 2016 19:41:57 -0800
Message-ID: <20160108034157.GZ3818@linux.vnet.ibm.com>
References: <20160107195725.3a130b4d@canb.auug.org.au>
 <20160107180244.GR3818@linux.vnet.ibm.com>
 <20160108071932.060a9bcc@canb.auug.org.au>
 <20160107205220.GU3818@linux.vnet.ibm.com>
 <20160108013631.GA11410@fixme-laptop.cn.ibm.com>
Reply-To: paulmck@linux.vnet.ibm.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e36.co.us.ibm.com ([32.97.110.154]:56720 "EHLO
	e36.co.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753506AbcAHDlw (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 7 Jan 2016 22:41:52 -0500
Received: from localhost
	by e36.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-next@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
	Thu, 7 Jan 2016 20:41:51 -0700
Content-Disposition: inline
In-Reply-To: <20160108013631.GA11410@fixme-laptop.cn.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Boqun Feng <boqun.feng@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@linux-foundation.org>

On Fri, Jan 08, 2016 at 09:37:04AM +0800, Boqun Feng wrote:
> On Thu, Jan 07, 2016 at 12:52:20PM -0800, Paul E. McKenney wrote:
> > On Fri, Jan 08, 2016 at 07:19:32AM +1100, Stephen Rothwell wrote:
> > > Hi Paul,
> > > 
> > > On Thu, 7 Jan 2016 10:02:44 -0800 "Paul E. McKenney" <paulmck@linux.vnet.ibm.com> wrote:
> > > >
> > > > On Thu, Jan 07, 2016 at 07:57:25PM +1100, Stephen Rothwell wrote:
> > > > > Hi Paul,
> > > > > 
> > > > > [I found this a few days ago, but I think I forgot to send the email,
> > > > > sorry.]
> > > > > 
> > > > > After merging the rcu tree, today's linux-next build (powerpc
> > > > > allyesconfig) failed like this:
> > > > > 
> > > > > kernel/rcu/rcuperf.o:(.discard+0x0): multiple definition of `__pcpu_unique_srcu_ctl_srcu_array'
> > > > > kernel/rcu/rcutorture.o:(.discard+0x0): first defined here
> > > > > 
> > > > > Caused by commit
> > > > > 
> > > > >   abcd7ec0808e ("rcutorture: Add RCU grace-period performance tests")
> > > > > 
> > > > > I have reverted that commit for today.  
> > > > 
> > > > Hello, Stephen,
> > > > 
> > > > Very strange.  The "static" keyword does not mean anything here?
> > > > Easy enough to use different symbols in the two different files,
> > > > but this situation is not so good for information hiding.
> > > > 
> > > > Happy to update rcuperf.c to use a different name, but in the
> > > > immortal words of MSDOS, "Are you sure?" :-)
> > > 
> > > I have no idea why it happens, but I do get the error above unless I
> > > revert that commit.  So, yes, I am sure :-)
> > > 
> > > OK, I looked further and
> > > 
> > > DEFINE_STATIC_SRCU(srcu_ctl);
> > > 
> > > becomes this (NLs added for clarity):
> > > 
> > > static __attribute__((section(".discard"), unused)) char __pcpu_scope_srcu_ctl_srcu_array;
> > > extern __attribute__((section(".discard"), unused)) char __pcpu_unique_srcu_ctl_srcu_array;
> > > __attribute__((section(".discard"), unused)) char __pcpu_unique_srcu_ctl_srcu_array;
> > > extern __attribute__((section(".data..percpu" ""))) __typeof__(struct srcu_struct_array) srcu_ctl_srcu_array;
> > > __attribute__((section(".data..percpu" ""))) __attribute__((weak)) __typeof__(struct srcu_struct_array) srcu_ctl_srcu_array;
> > > static struct srcu_struct srcu_ctl = {
> > > 	.
> > > 	.
> > > };
> > > 
> > > So, the "static" is not very effective :-(
> > 
> > Oddly enough, this appears to be toolchain dependent.  No idea why.
> > 
> 
> Maybe the reason is because "static" doesn't work well with
> DEFINE_PER_CPU sometimes?
> 
> The definition of __DEFINE_STATIC_SRCU is:
> 
> #define __DEFINE_SRCU(name, is_static)					\
> 	static DEFINE_PER_CPU(struct srcu_struct_array, name##_srcu_array);\
> 	is_static struct srcu_struct name = __SRCU_STRUCT_INIT(name)
> 
> whereas DEFINE_PER_CPU(which calls DEFINE_PER_CPU_SECTION) *could*
> consists of *several* definitions:
> 
> #if defined(ARCH_NEEDS_WEAK_PER_CPU) || defined(CONFIG_DEBUG_FORCE_WEAK_PER_CPU)
> ...
> #define DEFINE_PER_CPU_SECTION(type, name, sec)				\
> 	__PCPU_DUMMY_ATTRS char __pcpu_scope_##name;			\
> 	extern __PCPU_DUMMY_ATTRS char __pcpu_unique_##name;		\
> 	__PCPU_DUMMY_ATTRS char __pcpu_unique_##name;			\
> 	extern __PCPU_ATTRS(sec) __typeof__(type) name;			\
> 	__PCPU_ATTRS(sec) PER_CPU_DEF_ATTRIBUTES __weak			\
> 	__typeof__(type) name
> #else
> ...
> #define DEFINE_PER_CPU_SECTION(type, name, sec)				\
> 	__PCPU_ATTRS(sec) PER_CPU_DEF_ATTRIBUTES			\
> 	__typeof__(type) name
> #endif
> 
> So if ARCH_NEEDS_WEAK_PER_CPU=y or CONFIG_DEBUG_FORCE_WEAK_PER_CPU=y,
> the "static" keyword only has effects on the first definition i.e.
> __pcpu_scope_##name.
> 
> Mind to check your config options, Stephen?
> 
> 
> IOW, DEFINE_PER_CPU is not designed to work with "static", maybe we
> should add STATIC_DEFINE_PER_CPU for that purpose?

Indeed, I suspect that SRCU might not be the only thing that would like
static per-CPU variables.  ;-)

> Cc Tejun and Christoph for their opinions.
> 
> Regards,
> Boqun

							Thanx, Paul

> > Here is a patch that I will be merging in.
> > 
> > 							Thanx, Paul
> > 
> > ------------------------------------------------------------------------
> > 
> > commit d81f900405de0dc6152692a2088258b8b35d740d
> > Author: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
> > Date:   Thu Jan 7 12:39:10 2016 -0800
> > 
> >     Merge with abcd7ec0808e (rcutorture: Add RCU grace-period performance tests)
> >     
> >     Signed-off-by: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
> > 
> > diff --git a/kernel/rcu/rcuperf.c b/kernel/rcu/rcuperf.c
> > index eef82a9460d8..4c8d99aa4f5e 100644
> > --- a/kernel/rcu/rcuperf.c
> > +++ b/kernel/rcu/rcuperf.c
> > @@ -188,8 +188,8 @@ static struct rcu_perf_ops rcu_bh_ops = {
> >   * Definitions for srcu perf testing.
> >   */
> >  
> > -DEFINE_STATIC_SRCU(srcu_ctl);
> > -static struct srcu_struct *srcu_ctlp = &srcu_ctl;
> > +DEFINE_STATIC_SRCU(srcu_ctl_perf);
> > +static struct srcu_struct *srcu_ctlp = &srcu_ctl_perf;
> >  
> >  static int srcu_perf_read_lock(void) __acquires(srcu_ctlp)
> >  {
> > 
