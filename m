From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: linux-next: manual merge of the rcu tree with Linus' tree
Date: Tue, 15 May 2018 10:44:16 -0700
Message-ID: <20180515174416.GJ26088@linux.vnet.ibm.com>
References: <20180514134636.61831bcc@canb.auug.org.au>
Reply-To: paulmck@linux.vnet.ibm.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180514134636.61831bcc@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Nitzan Carmi <nitzanc@mellanox.com>, Jianchao Wang <jianchao.w.wang@oracle.com>, Keith Busch <keith.busch@intel.com>
List-Id: linux-next.vger.kernel.org

On Mon, May 14, 2018 at 01:46:36PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the rcu tree got a conflict in:
> 
>   drivers/nvme/host/core.c
> 
> between commit:
> 
>   12d9f07022dc ("nvme: fix use-after-free in nvme_free_ns_head")
> 
> from Linus' tree and commit:
> 
>   d9cf21bae6cf ("nvme: Avoid flush dependency in delete controller flow")
> 
> from the rcu tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Thank you, Stephen!!!

							Thanx, Paul

> -- 
> Cheers,
> Stephen Rothwell
> 
> diff --cc drivers/nvme/host/core.c
> index 99b857e5a7a9,c3cea8a29843..000000000000
> --- a/drivers/nvme/host/core.c
> +++ b/drivers/nvme/host/core.c
> @@@ -351,8 -349,7 +351,8 @@@ static void nvme_free_ns_head(struct kr
>   	nvme_mpath_remove_disk(head);
>   	ida_simple_remove(&head->subsys->ns_ida, head->instance);
>   	list_del_init(&head->entry);
> - 	cleanup_srcu_struct(&head->srcu);
> + 	cleanup_srcu_struct_quiesced(&head->srcu);
>  +	nvme_put_subsystem(head->subsys);
>   	kfree(head);
>   }
>   
