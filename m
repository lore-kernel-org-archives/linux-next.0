From: Mikulas Patocka <mpatocka@redhat.com>
Subject: Re: [PATCH -next] sysfs: add unsigned long cast to prevent compile
 warning
Date: Thu, 22 Sep 2011 10:16:51 -0400 (EDT)
Message-ID: <Pine.LNX.4.64.1109221014240.28236@hs20-bc2-1.build.redhat.com>
References: <1316675701-5230-1-git-send-email-heiko.carstens@de.ibm.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:52728 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752254Ab1IVORD (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 22 Sep 2011 10:17:03 -0400
In-Reply-To: <1316675701-5230-1-git-send-email-heiko.carstens@de.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Heiko Carstens <heiko.carstens@de.ibm.com>
Cc: Greg Kroah-Hartman <gregkh@suse.de>, linux-next@vger.kernel.org

Hi

> "sysfs: use rb-tree for inode number lookup" added a new printk which
> causes a new compile warning on s390 (and few other architectures):
> 
> fs/sysfs/dir.c: In function 'sysfs_link_sibling':
> fs/sysfs/dir.c:63:4: warning: format '%lx' expects argument of type
>   'long unsigned int', but argument 2 has type 'ino_t' [-Wform
> 
> Add an explicit unsigned long cast since ino_t is an unsigned long on
> most architectures.
> 
> Cc: Mikulas Patocka <mpatocka@redhat.com>
> Signed-off-by: Heiko Carstens <heiko.carstens@de.ibm.com>
> ---
>  fs/sysfs/dir.c |    3 ++-
>  1 files changed, 2 insertions(+), 1 deletions(-)
> 
> diff --git a/fs/sysfs/dir.c b/fs/sysfs/dir.c
> index c3646d9..9a6e020 100644
> --- a/fs/sysfs/dir.c
> +++ b/fs/sysfs/dir.c
> @@ -60,7 +60,8 @@ static void sysfs_link_sibling(struct sysfs_dirent *sd)
>  		} else if (sd->s_ino > node->s_ino) {
>  			p = &node->inode_node.rb_right;
>  		} else {
> -			printk(KERN_CRIT "sysfs: inserting duplicate inode '%lx'\n", sd->s_ino);
> +			printk(KERN_CRIT "sysfs: inserting duplicate inode '%lux'\n",

This change is wrong. Leave the format string as it was ... "%lux" 
actually prints a decimal long unsigned integer followed by the character 
"x". "%lx" prints the hexadecimal unsigned long string.

> +			       (unsigned long) sd->s_ino);

OK, this is good.

>  			BUG();
>  		}
>  #undef node
> -- 
> 1.7.5.4

Mikulas
