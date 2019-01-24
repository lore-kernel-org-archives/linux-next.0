From: YueHaibing <yuehaibing@huawei.com>
Subject: Re: linux-next: build warning after merge of the gpio-brgl tree
Date: Thu, 24 Jan 2019 13:42:51 +0800
Message-ID: <df1743f8-71c8-3b18-1e8a-94198d99477d@huawei.com>
References: <20190124151837.1ca96816@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190124151837.1ca96816@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On 2019/1/24 12:18, Stephen Rothwell wrote:
> Hi Bartosz,
> 
> After merging the gpio-brgl tree, today's linux-next build (arm
> multi_v7_defconfig) produced this warning:
> 
> drivers/gpio/gpio-davinci.c: In function 'davinci_gpio_get_irq_chip':
> drivers/gpio/gpio-davinci.c:472:9: warning: function returns address of local variable [-Wreturn-local-addr]
>   return &gpio_unbanked.chip;
>          ^~~~~~~~~~~~~~~~~~~
> drivers/gpio/gpio-davinci.c: In function 'keystone_gpio_get_irq_chip':
> drivers/gpio/gpio-davinci.c:480:9: warning: function returns address of local variable [-Wreturn-local-addr]
>   return &gpio_unbanked;
>          ^~~~~~~~~~~~~~
> 
> Introduced by commit
> 
>   ee5e87158e63 ("gpio: davinci: drop pointless static qualifier")

I'm very sorry for this.

I misread the code, Pls revert this.

> 
