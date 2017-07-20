From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: build warning after merge of the char-misc tree
Date: Thu, 20 Jul 2017 07:13:24 +0200
Message-ID: <20170720051324.GA8168@kroah.com>
References: <20170720141203.53dff686@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:48155 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S932563AbdGTFNc (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Thu, 20 Jul 2017 01:13:32 -0400
Content-Disposition: inline
In-Reply-To: <20170720141203.53dff686@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Arnd Bergmann <arnd@arndb.de>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Vitaly Kuznetsov <vkuznets@redhat.com>, "K. Y. Srinivasan" <kys@microsoft.com>, Andy Shevchenko <andy.shevchenko@gmail.com>

On Thu, Jul 20, 2017 at 02:12:03PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the char-misc tree, yesterday's linux-next build (i386
> defconfig) produced this warning:
> 
> In file included from /home/sfr/next/next/arch/x86/entry/vdso/vma.c:25:0:
> /home/sfr/next/next/arch/x86/include/asm/mshyperv.h:181:15: warning: return type defaults to 'int' [-Wreturn-type]  
>  static inline hyperv_cleanup(void) {}
>                ^
> 
> Introduced by commit
> 
>   2e252fbf777d ("x86/hyper-v: include hyperv/ only when CONFIG_HYPERV is set")

Ugh, KY, can you send me a fix for this?

All of these gcc-7 warnings are keeping me from seeing the "real"
problems now :(

thanks,

greg k-h
