From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the vfs tree with the ext4 tree
Date: Thu, 19 May 2016 11:26:11 +1000
Message-ID: <20160519112611.56d6ff64@canb.auug.org.au>
References: <20160517102355.4be4af45@canb.auug.org.au>
	<3539720.FHqN9VOtTL@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:52196 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752035AbcESB0Q (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 18 May 2016 21:26:16 -0400
In-Reply-To: <3539720.FHqN9VOtTL@wuerfel>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Al Viro <viro@zeniv.linux.org.uk>, Theodore Ts'o <tytso@mit.edu>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>, Jan Kara <jack@suse.cz>

Hi Arnd,

On Wed, 18 May 2016 16:25:39 +0200 Arnd Bergmann <arnd@arndb.de> wrote:
>
> I'm getting a warning here because the 'offset' variable is no longer
> used, I've fixed it up on my test box like this:

Thanks.  I have applied that to linux-next today and fixed up the merge
fix patch from tomorrow.

> commit 21fffc41b151a6146981487a3fee974e33c7005e
> Author: Arnd Bergmann <arnd@arndb.de>
> Date:   Tue May 17 13:23:39 2016 +0200
> 
>     ext4: fix linux-next mismerge
>     
>     fs/ext4/inode.c: In function 'ext4_direct_IO_read':
>     fs/ext4/inode.c:3502:9: error: unused variable 'offset' [-Werror=unused-variable]
>       loff_t offset = iocb->ki_pos;
>     
>     Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> 
> diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
> index cd72f208c405..f7140ca66e3b 100644
> --- a/fs/ext4/inode.c
> +++ b/fs/ext4/inode.c
> @@ -3499,7 +3499,6 @@ static ssize_t ext4_direct_IO_read(struct kiocb *iocb, struct iov_iter *iter)
>  {
>  	int unlocked = 0;
>  	struct inode *inode = iocb->ki_filp->f_mapping->host;
> -	loff_t offset = iocb->ki_pos;
>  	ssize_t ret;
>  
>  	if (ext4_should_dioread_nolock(inode)) {

-- 
Cheers,
Stephen Rothwell
