From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: linux-next: build failure after merge of the scsi-mkp tree
Date: Wed, 6 Dec 2017 20:42:22 -0800
Message-ID: <20171207044222.GK7829@linux.vnet.ibm.com>
References: <20171207145728.57cd9ac4@canb.auug.org.au>
 <1512619169.3298.3.camel@wdc.com>
 <20171207152521.0036b131@canb.auug.org.au>
Reply-To: paulmck@linux.vnet.ibm.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:51902 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1752177AbdLGEm2 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 6 Dec 2017 23:42:28 -0500
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id vB74e5S7090699
        for <linux-next@vger.kernel.org>; Wed, 6 Dec 2017 23:42:28 -0500
Received: from e14.ny.us.ibm.com (e14.ny.us.ibm.com [129.33.205.204])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2epwpq29q7-1
        (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
        for <linux-next@vger.kernel.org>; Wed, 06 Dec 2017 23:42:27 -0500
Received: from localhost
        by e14.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-next@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
        Wed, 6 Dec 2017 23:42:26 -0500
Content-Disposition: inline
In-Reply-To: <20171207152521.0036b131@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Bart Van Assche <Bart.VanAssche@wdc.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, Linus Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, Pavel Tikhomirov <ptikhomirov@virtuozzo.com>, Josh Triplett <josh@joshtriplett.org>

On Thu, Dec 07, 2017 at 03:25:21PM +1100, Stephen Rothwell wrote:
> Hi Bart,
> 
> [cc'ing some RCU people ...]
> 
> On Thu, 7 Dec 2017 03:59:30 +0000 Bart Van Assche <Bart.VanAssche@wdc.com> wrote:
> >
> > On Thu, 2017-12-07 at 14:57 +1100, Stephen Rothwell wrote:
> > > After merging the scsi-mkp tree, today's linux-next build (x86_64
> > > allmodconfig) failed like this:
> > > 
> > > ERROR: "init_rcu_head" [drivers/scsi/scsi_mod.ko] undefined!
> > > ERROR: "destroy_rcu_head" [drivers/scsi/scsi_mod.ko] undefined!
> > > 
> > > Caused by commit
> > > 
> > >   ac90420f17c9 ("scsi: core: Ensure that the SCSI error handler gets woken up")
> > > 
> > > I have used the scsi-mkp tree from next-20171206 for today.  
> > 
> > Does that mean I'm the first one who added RCU code to the SCSI core?
> 
> The only other uses of init_rcu_head() are in drivers/iommu/intel-svm.c
> and kernel/irq/irqdesc.c.  destroy_rcu_head() appears to not be used
> anywhere ...

The key point is that Bart appears to be the first to try using them in
a module, for which exports are needed.  Does the patch below help?

							Thanx, Paul

------------------------------------------------------------------------

commit cde4691a3a4591e7355295dd62610e3262159002
Author: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
Date:   Wed Dec 6 20:39:38 2017 -0800

    rcu: Export init_rcu_head() and destroy_rcu_head() to GPL modules
    
    Use of init_rcu_head() and destroy_rcu_head() from modules results in
    the following build-time error:
    
    	ERROR: "init_rcu_head" [drivers/scsi/scsi_mod.ko] undefined!
    	ERROR: "destroy_rcu_head" [drivers/scsi/scsi_mod.ko] undefined!
    
    This commit therefore adds EXPORT_SYMBOL_GPL() for each to allow them
    to be used by GPL-licensed kernel modules.
    
    Reported-by: Bart Van Assche <Bart.VanAssche@wdc.com>
    Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
    Signed-off-by: Paul E. McKenney <paulmck@linux.vnet.ibm.com>

diff --git a/kernel/rcu/update.c b/kernel/rcu/update.c
index 8d591d8411fe..4c4d26e9a67b 100644
--- a/kernel/rcu/update.c
+++ b/kernel/rcu/update.c
@@ -422,11 +422,13 @@ void init_rcu_head(struct rcu_head *head)
 {
 	debug_object_init(head, &rcuhead_debug_descr);
 }
+EXPORT_SYMBOL_GPL(init_rcu_head);
 
 void destroy_rcu_head(struct rcu_head *head)
 {
 	debug_object_free(head, &rcuhead_debug_descr);
 }
+EXPORT_SYMBOL_GPL(destroy_rcu_head);
 
 static bool rcuhead_is_static_object(void *addr)
 {
