From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the scsi-mkp tree
Date: Thu, 7 Dec 2017 15:25:21 +1100
Message-ID: <20171207152521.0036b131@canb.auug.org.au>
References: <20171207145728.57cd9ac4@canb.auug.org.au>
        <1512619169.3298.3.camel@wdc.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1512619169.3298.3.camel@wdc.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bart Van Assche <Bart.VanAssche@wdc.com>
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>, Linus Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, Pavel Tikhomirov <ptikhomirov@virtuozzo.com>, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, Josh Triplett <josh@joshtriplett.org>
List-Id: linux-next.vger.kernel.org

Hi Bart,

[cc'ing some RCU people ...]

On Thu, 7 Dec 2017 03:59:30 +0000 Bart Van Assche <Bart.VanAssche@wdc.com> wrote:
>
> On Thu, 2017-12-07 at 14:57 +1100, Stephen Rothwell wrote:
> > After merging the scsi-mkp tree, today's linux-next build (x86_64
> > allmodconfig) failed like this:
> > 
> > ERROR: "init_rcu_head" [drivers/scsi/scsi_mod.ko] undefined!
> > ERROR: "destroy_rcu_head" [drivers/scsi/scsi_mod.ko] undefined!
> > 
> > Caused by commit
> > 
> >   ac90420f17c9 ("scsi: core: Ensure that the SCSI error handler gets woken up")
> > 
> > I have used the scsi-mkp tree from next-20171206 for today.  
> 
> Does that mean I'm the first one who added RCU code to the SCSI core?

The only other uses of init_rcu_head() are in drivers/iommu/intel-svm.c
and kernel/irq/irqdesc.c.  destroy_rcu_head() appears to not be used
anywhere ...

-- 
Cheers,
Stephen Rothwell
