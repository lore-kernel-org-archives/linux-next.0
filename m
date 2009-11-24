From: Eric Paris <eparis@redhat.com>
Subject: Re: [PATCH -next] fanotify: select ANON_INODES.
Date: Tue, 24 Nov 2009 08:25:31 -0500
Message-ID: <1259069132.10772.332.camel@dhcp231-106.rdu.redhat.com>
References: <20091124060256.GA30779@linux-sh.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:60184 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1758064AbZKXNZ2 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 24 Nov 2009 08:25:28 -0500
In-Reply-To: <20091124060256.GA30779@linux-sh.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Mundt <lethal@linux-sh.org>
Cc: linux-next@vger.kernel.org

On Tue, 2009-11-24 at 15:02 +0900, Paul Mundt wrote:
> fanotify references anon_inode_getfd(), which is only available with
> ANON_INODES enabled. Presently this bails out with the following:
> 
>   LD      vmlinux
> fs/built-in.o: In function `sys_fanotify_init':
> (.text+0x26d1c): undefined reference to `anon_inode_getfd'
> make: *** [vmlinux] Error 1
> 
> which is trivially corrected by adding an ANON_INODES select.
> 
> Signed-off-by: Paul Mundt <lethal@linux-sh.org>

Thanks, applied!


> ---
> 
>  fs/notify/fanotify/Kconfig |    1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/fs/notify/fanotify/Kconfig b/fs/notify/fanotify/Kconfig
> index f9d7ae0..668e5df 100644
> --- a/fs/notify/fanotify/Kconfig
> +++ b/fs/notify/fanotify/Kconfig
> @@ -1,6 +1,7 @@
>  config FANOTIFY
>  	bool "Filesystem wide access notification"
>  	select FSNOTIFY
> +	select ANON_INODES
>  	default y
>  	---help---
>  	   Say Y here to enable fanotify suport.  fanotify is a file access
