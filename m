From: Jason Gunthorpe <jgg@mellanox.com>
Subject: Re: linux-next: manual merge of the tip tree with the rdma tree
Date: Mon, 6 Aug 2018 13:45:26 -0600
Message-ID: <20180806194526.GL5007@mellanox.com>
References: <20180806145331.68538a0b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180806145331.68538a0b@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Doug Ledford <dledford@redhat.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: linux-next.vger.kernel.org

On Mon, Aug 06, 2018 at 02:53:31PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the tip tree got a conflict in:
> 
>   drivers/infiniband/core/rdma_core.c
> 
> between commit:
> 
>   9867f5c6695f ("IB/uverbs: Convert 'bool exclusive' into an enum")
> 
> from the rdma tree and commit:
> 
>   bfc18e389c7a ("atomics/treewide: Rename __atomic_add_unless() => atomic_fetch_add_unless()")
> 
> from the tip tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Gaaagh that is a big conflict

I was going to do this next cycle.. But I'll try to push a commit
consolidating this crazy use of __atomic_add_unless into one function
so this conflict should become easier to handle.

Jason
