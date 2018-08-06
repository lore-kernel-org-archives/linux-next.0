From: Jason Gunthorpe <jgg@mellanox.com>
Subject: Re: linux-next: manual merge of the rdma tree with Linus' tree
Date: Mon, 6 Aug 2018 13:41:42 -0600
Message-ID: <20180806194142.GK5007@mellanox.com>
References: <20180806120131.169f70f3@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180806120131.169f70f3@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Doug Ledford <dledford@redhat.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Mon, Aug 06, 2018 at 12:01:31PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the rdma tree got a conflict in:
> 
>   drivers/infiniband/core/uverbs_main.c
> 
> between commit:
> 
>   1eb9364ce81d ("IB/uverbs: Fix ordering of ucontext check in ib_uverbs_write")
> 
> from Linus' tree and commit:
> 
>   a9b66d6453d7 ("IB/uverbs: Do not block disassociate during write()")
> 
> from the rdma tree.
> 
> I fixed it up (I am not entirely sure this is correct, but see below) and
> can carry the fix as necessary. This is now fixed as far as linux-next
> is concerned, but any non trivial conflicts should be mentioned to your
> upstream maintainer when your tree is submitted for merging.  You may
> also want to consider cooperating with the maintainer of the conflicting
> tree to minimise any particularly complex conflicts.

> diff --cc drivers/infiniband/core/uverbs_main.c
> index 2094d136513d,6f62146e9738..000000000000
> --- a/drivers/infiniband/core/uverbs_main.c
> +++ b/drivers/infiniband/core/uverbs_main.c
> @@@ -748,24 -758,8 +758,18 @@@ static ssize_t ib_uverbs_write(struct f
>   		return ret;
>   
>   	srcu_key = srcu_read_lock(&file->device->disassociate_srcu);
> - 	ib_dev = srcu_dereference(file->device->ib_dev,
> - 				  &file->device->disassociate_srcu);
> - 	if (!ib_dev) {
> - 		ret = -EIO;
> - 		goto out;
> - 	}
>   
>  +	/*
>  +	 * Must be after the ib_dev check, as once the RCU clears ib_dev ==
>  +	 * NULL means ucontext == NULL
>  +	 */
>  +	if (!file->ucontext &&
>  +	    (command != IB_USER_VERBS_CMD_GET_CONTEXT || extended)) {
>  +		ret = -EINVAL;
>  +		goto out;
>  +	}
>  +
> - 	if (!verify_command_mask(ib_dev, command, extended)) {
> + 	if (!verify_command_mask(file, command, extended)) {
>   		ret = -EOPNOTSUPP;
>   		goto out;
>   	}

The resolution should end up like this:

        srcu_key = srcu_read_lock(&file->device->disassociate_srcu);

        if (!verify_command_mask(file, command, extended)) {
                ret = -EOPNOTSUPP;
                goto out;
        }

(ie take the hunk from for-next, discard the for-rc stuff)

As commit 22fa27fbc64d01cbbe1e4da751e64cc22d24a6e4 also removed the
'file->ucontext' stuff

Thanks,
Jason
