From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: build warning after merge of the staging tree
Date: Thu, 8 Nov 2018 03:17:31 -0800
Message-ID: <20181108111731.GA32115@kroah.com>
References: <20181108133307.5cca74cb@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181108133307.5cca74cb@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Ioannis Valasakis <code@wizofe.uk>
List-Id: linux-next.vger.kernel.org

On Thu, Nov 08, 2018 at 01:33:07PM +1100, Stephen Rothwell wrote:
> Hi Greg,
> 
> After merging the staging tree, today's linux-next build (x86_64
> allmodconfig) produced this warning:
> 
> In file included from include/linux/printk.h:336,
>                  from include/linux/kernel.h:14,
>                  from include/linux/clk.h:16,
>                  from drivers/staging/media/tegra-vde/tegra-vde.c:12:
> drivers/staging/media/tegra-vde/tegra-vde.c: In function 'tegra_vde_setup_iram_tables':
> drivers/staging/media/tegra-vde/tegra-vde.c:265:5: warning: format '%d' expects argument of type 'int', but argument 6 has type 'long unsigned int' [-Wformat=]
>      "\tFrame %d: frame_num = %d B_frame = %d\n",
>      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> include/linux/dynamic_debug.h:135:39: note: in definition of macro 'dynamic_dev_dbg'
>    __dynamic_dev_dbg(&descriptor, dev, fmt, \
>                                        ^~~
> include/linux/device.h:1463:23: note: in expansion of macro 'dev_fmt'
>   dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
>                        ^~~~~~~
> drivers/staging/media/tegra-vde/tegra-vde.c:264:4: note: in expansion of macro 'dev_dbg'
>     dev_dbg(vde->miscdev.parent,
>     ^~~~~~~
> 
> Introduced by commit
> 
>   42e764d05712 ("staging: tegravde: replace bit assignment with macro")

I saw this warning, and ignored it, my fault.  Colin just sent a patch
for this so I'll queue that up now, thanks.

greg k-h
