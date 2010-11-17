From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: build warning after merge of the usb tree
Date: Tue, 16 Nov 2010 20:20:34 -0800
Message-ID: <20101117042034.GA2999@kroah.com>
References: <20101117131427.fd26efd8.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from kroah.org ([198.145.64.141]:59752 "EHLO coco.kroah.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932332Ab0KQE0f (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 16 Nov 2010 23:26:35 -0500
Content-Disposition: inline
In-Reply-To: <20101117131427.fd26efd8.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Michal Nazarewicz <mina86@mina86.com>

On Wed, Nov 17, 2010 at 01:14:27PM +1100, Stephen Rothwell wrote:
> Hi Greg,
> 
> After merging the usb tree, today's linux-next build (x86_64 allmodconfig)
> produced this warning:
> 
> In file included from drivers/usb/gadget/g_ffs.c:64:
> drivers/usb/gadget/f_fs.c:30:1: warning: "pr_fmt" redefined
> In file included from include/linux/kernel.h:20,
>                  from arch/x86/include/asm/percpu.h:44,
>                  from arch/x86/include/asm/current.h:5,
>                  from arch/x86/include/asm/processor.h:15,
>                  from include/linux/prefetch.h:14,
>                  from include/linux/list.h:7,
>                  from include/linux/module.h:9,
>                  from drivers/usb/gadget/g_ffs.c:22:
> include/linux/printk.h:161:1: warning: this is the location of the previous definition
> 
> Introduced by commit d8df0b611c66db3b7afd0678213979209616681a ("usb:
> gadget: f_fs: remove custom printk() wrappers").

Thanks, I told Michal about this, he should be sending me a patch for it
soon.

greg k-h
