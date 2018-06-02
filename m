From: "Darrick J. Wong" <darrick.wong@oracle.com>
Subject: Re: linux-next: manual merge of the nvdimm tree with the xfs tree
Date: Fri, 1 Jun 2018 17:59:48 -0700
Message-ID: <20180602005948.GH7825@magnolia>
References: <20180601185846.1c5b7d0a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180601185846.1c5b7d0a@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Dan Williams <dan.j.williams@intel.com>, David Chinner <david@fromorbit.com>, linux-xfs@vger.kernel.org, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Dave Jiang <dave.jiang@intel.com>
List-Id: linux-next.vger.kernel.org

On Fri, Jun 01, 2018 at 06:58:46PM +1000, Stephen Rothwell wrote:
> Hi Dan,
> 
> Today's linux-next merge of the nvdimm tree got a conflict in:
> 
>   drivers/dax/super.c
> 
> between commits:
> 
>   ba23cba9b3bd ("fs: allow per-device dax status checking for filesystems")
>   80660f20252d ("dax: change bdev_dax_supported() to support boolean returns")
> 
> from the xfs tree and commit:
> 
>   e76384884344 ("mm: introduce MEMORY_DEVICE_FS_DAX and CONFIG_DEV_PAGEMAP_OPS")
> 
> from the nvdimm tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 
> -- 
> Cheers,
> Stephen Rothwell
> diff --cc drivers/dax/super.c
> index 1d7bd96511f0,88672b6f6252..000000000000
> --- a/drivers/dax/super.c
> +++ b/drivers/dax/super.c
> @@@ -80,11 -80,13 +80,12 @@@ EXPORT_SYMBOL_GPL(fs_dax_get_by_bdev)
>    * This is a library function for filesystems to check if the block device
>    * can be mounted with dax option.
>    *
>  - * Return: negative errno if unsupported, 0 if supported.
>  + * Return: true if supported, false if unsupported
>    */
>  -int __bdev_dax_supported(struct super_block *sb, int blocksize)
>  +bool __bdev_dax_supported(struct block_device *bdev, int blocksize)
>   {
>  -	struct block_device *bdev = sb->s_bdev;
>   	struct dax_device *dax_dev;
> + 	bool dax_enabled = false;
>   	pgoff_t pgoff;
>   	int err, id;
>   	void *kaddr;
> @@@ -134,15 -135,22 +135,22 @@@
>   		 * on being able to do (page_address(pfn_to_page())).
>   		 */
>   		WARN_ON(IS_ENABLED(CONFIG_ARCH_HAS_PMEM_API));
> + 		dax_enabled = true;
>   	} else if (pfn_t_devmap(pfn)) {
> - 		/* pass */;
> - 	} else {
> + 		struct dev_pagemap *pgmap;
> + 
> + 		pgmap = get_dev_pagemap(pfn_t_to_pfn(pfn), NULL);
> + 		if (pgmap && pgmap->type == MEMORY_DEVICE_FS_DAX)
> + 			dax_enabled = true;
> + 		put_dev_pagemap(pgmap);
> + 	}
> + 
> + 	if (!dax_enabled) {
>  -		pr_debug("VFS (%s): error: dax support not enabled\n",
>  -				sb->s_id);
>  +		pr_debug("%s: error: dax support not enabled\n",
>  +				bdevname(bdev, buf));
> - 		return false;
> + 		return -EOPNOTSUPP;

Hang on a sec, the changes in the xfs tree make this function return a
boolean (true for dax-is-supported, false for dax-not-supported), but
this change partially reverts the boolean return values.

>   	}
> - 
> - 	return true;
> + 	return 0;

The merge should retain the 'return false' above and the 'return true'
here... or possibly just return dax_enabled:

if (!dax_enabled) {
	pr_debug(...);
	pr_debug(...);
}

return dax_enabled;

--D

>   }
>   EXPORT_SYMBOL_GPL(__bdev_dax_supported);
>   #endif
