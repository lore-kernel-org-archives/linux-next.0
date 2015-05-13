From: Johan Hovold <johan@kernel.org>
Subject: Re: linux-next: build failure after merge of the gpio tree
Date: Wed, 13 May 2015 09:36:13 +0200
Message-ID: <20150513073613.GA1907@localhost>
References: <20150513165516.66a0dbbb@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150513165516.66a0dbbb@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>
List-Id: linux-next.vger.kernel.org

On Wed, May 13, 2015 at 04:55:16PM +1000, Stephen Rothwell wrote:
> Hi Linus,
> 
> After merging the gpio tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> drivers/gpio/gpio-dln2.c: In function 'dln2_gpio_probe':
> drivers/gpio/gpio-dln2.c:469:12: error: 'struct gpio_chip' has no member named 'exported'
>   dln2->gpio.exported = true;
>             ^
> 
> Caused by commit 6a4b6b0a3b55 ("gpio: sysfs: clean up chip class-device
> handling").
> 
> I have used the gpio tree from next-20150512 for today.

A fix for this was posted yesterday (when detected by the kbuild test
robot):

	https://lkml.org/lkml/2015/5/12/437

Johan
