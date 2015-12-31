From: Al Viro <viro@ZenIV.linux.org.uk>
Subject: Re: linux-next: manual merge of the security tree with the vfs tree
Date: Thu, 31 Dec 2015 04:30:19 +0000
Message-ID: <20151231043019.GD9938@ZenIV.linux.org.uk>
References: <20151231152453.08cfae79@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from zeniv.linux.org.uk ([195.92.253.2]:56924 "EHLO
	ZenIV.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752587AbbLaEaY (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 30 Dec 2015 23:30:24 -0500
Content-Disposition: inline
In-Reply-To: <20151231152453.08cfae79@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: James Morris <jmorris@namei.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Petko Manolov <petkan@mip-labs.com>, Mimi Zohar <zohar@linux.vnet.ibm.com>

On Thu, Dec 31, 2015 at 03:24:53PM +1100, Stephen Rothwell wrote:
> Hi James,
> 
> Today's linux-next merge of the security tree got a conflict in:
> 
>   security/integrity/ima/ima_fs.c
> 
> between commit:
> 
>   3bc8f29b149e ("new helper: memdup_user_nul()")
> 
> from the vfs tree and commit:
> 
>   38d859f991f3 ("IMA: policy can now be updated multiple times")
> 
> from the security tree.
> 
> I fixed it up (hopefully, see below) and can carry the fix as necessary
> (no action is required).
 
> + 	res = mutex_lock_interruptible(&ima_write_mutex);
> + 	if (res)
> + 		return res;
>   
>   	if (datalen >= PAGE_SIZE)
>   		datalen = PAGE_SIZE - 1;
>   
>   	/* No partial writes. */
> + 	result = -EINVAL;
>   	if (*ppos != 0)
> - 		return -EINVAL;
> + 		goto out;
>   
>  -	result = -ENOMEM;
>  -	data = kmalloc(datalen + 1, GFP_KERNEL);
>  -	if (!data)
>  -		goto out;
>  -
>  -	*(data + datalen) = '\0';
>  -
>  -	result = -EFAULT;
>  -	if (copy_from_user(data, buf, datalen))
>  +	data = memdup_user_nul(buf, datalen);
> - 	if (IS_ERR(data))
> - 		return PTR_ERR(data);
> ++	if (IS_ERR(data)) {
> ++		result = PTR_ERR(data);
> + 		goto out;
> ++	}

Why do it in this order?  With or without opencoding memdup_user_nul(),
what's the point of taking the mutex before copying the data from
userland?  All it achieves is holding it longer, over the area that
needs no exclusion whatsoever.
