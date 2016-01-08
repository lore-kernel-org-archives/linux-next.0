From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: linux-next: build failure after merge of the rcu tree
Date: Fri, 8 Jan 2016 07:53:41 -0800
Message-ID: <20160108155341.GC3818@linux.vnet.ibm.com>
References: <20160107195725.3a130b4d@canb.auug.org.au>
 <20160107180244.GR3818@linux.vnet.ibm.com>
 <20160108071932.060a9bcc@canb.auug.org.au>
 <20160107205220.GU3818@linux.vnet.ibm.com>
 <20160108013631.GA11410@fixme-laptop.cn.ibm.com>
 <20160108034157.GZ3818@linux.vnet.ibm.com>
 <20160108150850.1ec97e78@canb.auug.org.au>
 <20160108044835.GB3818@linux.vnet.ibm.com>
 <20160108045453.GB4300@fixme-laptop.cn.ibm.com>
Reply-To: paulmck@linux.vnet.ibm.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e31.co.us.ibm.com ([32.97.110.149]:47207 "EHLO
	e31.co.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755497AbcAHPxh (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 8 Jan 2016 10:53:37 -0500
Received: from localhost
	by e31.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-next@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
	Fri, 8 Jan 2016 08:53:36 -0700
Content-Disposition: inline
In-Reply-To: <20160108045453.GB4300@fixme-laptop.cn.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Boqun Feng <boqun.feng@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@linux-foundation.org>

On Fri, Jan 08, 2016 at 12:54:53PM +0800, Boqun Feng wrote:
> On Thu, Jan 07, 2016 at 08:48:35PM -0800, Paul E. McKenney wrote:
> > On Fri, Jan 08, 2016 at 03:08:50PM +1100, Stephen Rothwell wrote:
> > > Hi Paul,
> > > 
> > > On Thu, 7 Jan 2016 19:41:57 -0800 "Paul E. McKenney" <paulmck@linux.vnet.ibm.com> wrote:
> > > >
> > > > Indeed, I suspect that SRCU might not be the only thing that would like
> > > > static per-CPU variables.  ;-)
> > > 
> > > from include/linux/percpu-defs.h:
> > > 
> > >  * s390 and alpha modules require percpu variables to be defined as
> > >  * weak to force the compiler to generate GOT based external
> > >  * references for them.  This is necessary because percpu sections
> > >  * will be located outside of the usually addressable area.
> > >  *
> > >  * This definition puts the following two extra restrictions when
> > >  * defining percpu variables.
> > >  *
> > >  * 1. The symbol must be globally unique, even the static ones.
> > >  * 2. Static percpu variables cannot be defined inside a function.
> > >  *
> > >  * Archs which need weak percpu definitions should define
> > >  * ARCH_NEEDS_WEAK_PER_CPU in asm/percpu.h when necessary.
> > >  *
> > >  * To ensure that the generic code observes the above two
> > >  * restrictions, if CONFIG_DEBUG_FORCE_WEAK_PER_CPU is set weak
> > >  * definition is used for all cases.
> > > 
> > > so they can be static, but must be globally unique.
> 
> Interesting ;-) Thank you.
> 
> > Thank you for the tutorial!  I have updated the patch to use a unique
> > name for the srcu_struct added by rcuperf.c.
> 
> Plus a comment for DEFINE_STATIC_SRCU saying srcu can be defined as
> static but must have a unique name for this reason?

Yes, plus some words about how to work around the limitation.  How about
the patch below?

							Thanx, Paul

------------------------------------------------------------------------

commit 61822ff81839ee3c5b6094ce348944d972b87892
Author: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
Date:   Fri Jan 8 07:43:50 2016 -0800

    rcu: Document unique-name limitation for DEFINE_STATIC_SRCU()
    
    SRCU uses per-CPU variables, and DEFINE_STATIC_SRCU() uses a static
    per-CPU variable.  However, per-CPU variables have significant
    restrictions, for example, names of per-CPU variables must be globally
    unique, even if declared static.  These restrictions carry over to
    DEFINE_STATIC_SRCU(), and this commit therefore documents these
    restrictions.
    
    Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
    Reported-by: kbuild test robot <fengguang.wu@intel.com>
    Suggested-by: Boqun Feng <boqun.feng@gmail.com>
    Signed-off-by: Paul E. McKenney <paulmck@linux.vnet.ibm.com>

diff --git a/include/linux/srcu.h b/include/linux/srcu.h
index f5f80c5643ac..dc8eb63c6568 100644
--- a/include/linux/srcu.h
+++ b/include/linux/srcu.h
@@ -99,8 +99,23 @@ void process_srcu(struct work_struct *work);
 	}
 
 /*
- * define and init a srcu struct at build time.
- * dont't call init_srcu_struct() nor cleanup_srcu_struct() on it.
+ * Define and initialize a srcu struct at build time.
+ * Do -not- call init_srcu_struct() nor cleanup_srcu_struct() on it.
+ *
+ * Note that although DEFINE_STATIC_SRCU() hides the name from other
+ * files, the per-CPU variable rules nevertheless require that the
+ * chosen name be globally unique.  These rules also prohibit use of
+ * DEFINE_STATIC_SRCU() within a function.  If these rules are too
+ * restrictive, declare the srcu_struct manually.  For example, in
+ * each file:
+ *
+ *	static struct srcu_struct my_srcu;
+ *
+ * Then, before the first use of each my_srcu, manually initialize it:
+ *
+ *	init_srcu_struct(&my_srcu);
+ *
+ * See include/linux/percpu-defs.h for the rules on per-CPU variables.
  */
 #define __DEFINE_SRCU(name, is_static)					\
 	static DEFINE_PER_CPU(struct srcu_struct_array, name##_srcu_array);\
