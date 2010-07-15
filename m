From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: [PATCH] Fix xfs build when CONFIG_XFS_POSIX_ACL=n
Date: Thu, 15 Jul 2010 11:06:41 -0700
Message-ID: <4C3F4E31.90102@oracle.com>
References: <4c3f42cf1240489af5@agluck-desktop.sc.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet10.oracle.com ([148.87.113.121]:57104 "EHLO
	rcsinet10.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933730Ab0GOSIL (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 15 Jul 2010 14:08:11 -0400
In-Reply-To: <4c3f42cf1240489af5@agluck-desktop.sc.intel.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Luck, Tony" <tony.luck@intel.com>
Cc: Alex Elder <aelder@sgi.com>, xfs-masters@oss.sgi.com, linux-next@vger.kernel.org, Christoph Hellwig <hch@lst.de>, Dave Chinner <dchinner@redhat.com>, Randy Dunlap <randy.dunlap@oracle.com>

Luck, Tony wrote:
> When CONFIG_XFS_POSIX_ACL is not set "xfs_check_acl" is #defined
> to NULL - which breaks the code attempting to add a tracepoint
> on this function.
> 
> Only define the tracepoint when the function exists.
> 
> Signed-off-by: Tony Luck <tony.luck@intel.com>

Acked-by: Randy Dunlap <randy.dunlap@oracle.com>

Thanks, Tony.

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
