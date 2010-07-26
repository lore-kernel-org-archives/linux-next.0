From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: [PATCH] Fix xfs build when CONFIG_XFS_POSIX_ACL=n
Date: Mon, 26 Jul 2010 08:48:29 -0700
Message-ID: <20100726084829.b173ffe3.randy.dunlap@oracle.com>
References: <4c3f42cf1240489af5@agluck-desktop.sc.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet10.oracle.com ([148.87.113.121]:56862 "EHLO
	rcsinet10.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752960Ab0GZPu3 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 26 Jul 2010 11:50:29 -0400
In-Reply-To: <4c3f42cf1240489af5@agluck-desktop.sc.intel.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Luck, Tony" <tony.luck@intel.com>
Cc: Alex Elder <aelder@sgi.com>, xfs-masters@oss.sgi.com, linux-next@vger.kernel.org, Christoph Hellwig <hch@lst.de>, Dave Chinner <dchinner@redhat.com>

On Thu, 15 Jul 2010 10:18:07 -0700 Luck, Tony wrote:

> When CONFIG_XFS_POSIX_ACL is not set "xfs_check_acl" is #defined
> to NULL - which breaks the code attempting to add a tracepoint
> on this function.
> 
> Only define the tracepoint when the function exists.
> 
> Signed-off-by: Tony Luck <tony.luck@intel.com>

Acked-by: Randy Dunlap <randy.dunlap@oracle.com>

Alex, can we get this merged for linux-next, please?
This problem causes lots of xfs build errors in linux-next without this patch.


> ---
> 
> Broken in linux-next for a few days by the "xfs: split xfs_itrace_entry"
> commit. This patch should go after it (or better, should be merged into
> it before this goes upstream).
> 
> diff --git a/fs/xfs/linux-2.6/xfs_trace.h b/fs/xfs/linux-2.6/xfs_trace.h
> index 76de133..bb4803c 100644
> --- a/fs/xfs/linux-2.6/xfs_trace.h
> +++ b/fs/xfs/linux-2.6/xfs_trace.h
> @@ -568,7 +568,9 @@ DEFINE_INODE_EVENT(xfs_readlink);
>  DEFINE_INODE_EVENT(xfs_alloc_file_space);
>  DEFINE_INODE_EVENT(xfs_free_file_space);
>  DEFINE_INODE_EVENT(xfs_readdir);
> +#ifdef CONFIG_XFS_POSIX_ACL
>  DEFINE_INODE_EVENT(xfs_check_acl);
> +#endif
>  DEFINE_INODE_EVENT(xfs_vm_bmap);
>  DEFINE_INODE_EVENT(xfs_file_ioctl);
>  DEFINE_INODE_EVENT(xfs_file_compat_ioctl);
> --
> To unsubscribe from this list: send the line "unsubscribe linux-next" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html


---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
