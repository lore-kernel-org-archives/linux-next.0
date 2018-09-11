From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: build warning after merge of the usb tree
Date: Tue, 11 Sep 2018 10:12:51 +0200
Message-ID: <20180911081251.GC8963@kroah.com>
References: <20180911124743.558e33dc@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180911124743.558e33dc@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>
List-Id: linux-next.vger.kernel.org

On Tue, Sep 11, 2018 at 12:47:43PM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> After merging the usb tree, today's linux-next build (arm
> multi_v7_defconfig) produced this warning:
> 
> drivers/usb/core/hcd.c: In function '__usb_hcd_giveback_urb':
> drivers/usb/core/hcd.c:1741:16: warning: unused variable 'flags' [-Wunused-variable]
>   unsigned long flags;
>                 ^~~~~
> 
> Introduced by commit
> 
>   ed194d136769 ("usb: core: remove local_irq_save() around ->complete() handler")

Ugh, sorry I missed this :(
