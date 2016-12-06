From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the pinctrl tree
Date: Wed, 7 Dec 2016 08:31:02 +1100
Message-ID: <20161207083102.093fdf96@canb.auug.org.au>
References: <20161205100038.30581ee1@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:57229 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752673AbcLFVbG (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 6 Dec 2016 16:31:06 -0500
In-Reply-To: <20161205100038.30581ee1@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Linus,

On Mon, 5 Dec 2016 10:00:38 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> After merging the pinctrl tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
> 
> drivers/gpio/gpio-pl061.c: In function 'pl061_irq_set_wake':
> drivers/gpio/gpio-pl061.c:280:28: error: 'struct gpio_chip' has no member named 'irq_parent'
>   return irq_set_irq_wake(gc->irq_parent, state);
>                             ^
> drivers/gpio/gpio-pl061.c:281:1: warning: control reaches end of non-void function [-Wreturn-type]
>  }
>  ^
> 
> Caused by commit
> 
>   d245b3f9bd36 ("gpio: simplify adding threaded interrupts")
> 
> I have used the pinctrl tree from next-20161202 for today.

I am still getting this.

-- 
Cheers,
Stephen Rothwell
