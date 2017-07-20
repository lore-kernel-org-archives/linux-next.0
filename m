From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: build warning after merge of the char-misc tree
Date: Thu, 20 Jul 2017 11:14:51 +0200
Message-ID: <20170720091451.GA27647@kroah.com>
References: <20170720141203.53dff686@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170720141203.53dff686@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Arnd Bergmann <arnd@arndb.de>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Vitaly Kuznetsov <vkuznets@redhat.com>, "K. Y. Srinivasan" <kys@microsoft.com>, Andy Shevchenko <andy.shevchenko@gmail.com>
List-Id: linux-next.vger.kernel.org

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

Now reverted from my tree, thanks.

greg k-h
