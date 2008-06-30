From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: build failure
Date: Mon, 30 Jun 2008 09:44:34 -0700
Message-ID: <20080630094434.75b65742.randy.dunlap@oracle.com>
References: <20080630232248.8d993f1d.sfr@canb.auug.org.au>
	<20080630161020.GA20736@uranus.ravnborg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rgminet01.oracle.com ([148.87.113.118]:22087 "EHLO
	rgminet01.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757490AbYF3Quy (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 30 Jun 2008 12:50:54 -0400
In-Reply-To: <20080630161020.GA20736@uranus.ravnborg.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>

On Mon, 30 Jun 2008 18:10:20 +0200 Sam Ravnborg wrote:

> On Mon, Jun 30, 2008 at 11:22:48PM +1000, Stephen Rothwell wrote:
> > Hi Sam,
> > 
> > Today's linux-next build (i386 defconfig) failed like this:
> > 
> >   GEN     /scratch/sfr/i386_defconfig/Makefile
> >   GEN     /scratch/sfr/i386_defconfig/Makefile
> >   SYMLINK include/asm -> include/asm-x86
> >   Using /scratch/sfr/next as source for kernel
> > /bin/sh: include/asm/asm-offsets.h: No such file or directory
> > 
> > I can only guess that this is a kbuild problem.  The object include directory
> > looked like this:
> > 
> > /scratch/sfr/i386_defconfig/include$ ls -la
> > total 24
> > drwxr-xr-x   5 sfr users 4096 2008-06-30 23:06 .
> > drwxr-xr-x   8 sfr users 4096 2008-06-30 23:06 ..
> > lrwxrwxrwx   1 sfr users    7 2008-06-30 23:06 asm -> asm-x86
> > drwxr-xr-x   2 sfr users 4096 2008-06-30 23:06 asm-i386
> > drwxr-xr-x 184 sfr users 8192 2008-06-30 23:06 config
> > drwxr-xr-x   2 sfr users 4096 2008-06-30 23:06 linux
> 
> The directory "asm-i386" should have been asm-x86.
> My bad.
> 
> This fixes it for me:
> 
> diff --git a/Makefile b/Makefile
> index 9edbdab..f2c181a 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -968,8 +968,8 @@ endef
>  define create-symlink
>  	if [ ! -L include/asm ]; then                                      \
>  			echo '  SYMLINK $@ -> include/asm-$(SRCARCH)';     \
> -			if [ ! -d include/asm-$(ARCH) ]; then              \
> -				mkdir -p include/asm-$(ARCH);              \
> +			if [ ! -d include/asm-$(SRCARCH) ]; then           \
> +				mkdir -p include/asm-$(SRCARCH);           \
>  			fi;                                                \
>  			ln -fsn asm-$(SRCARCH) $@;                         \
>  	fi
> 
> 
> I have tested arm with O=... but i386 I tested without O=...
> and I obviosuly forgot to think when I did the above :-(
> 
> I will rebase kbuild-next.git later today to integrate this fix.

Thanks.  That fix is working for me.

---
~Randy
Linux Plumbers Conference, 17-19 September 2008, Portland, Oregon USA
http://linuxplumbersconf.org/
