From: Lee Jones <lee.jones@linaro.org>
Subject: Re: linux-next: build warning after merge of the mfd tree
Date: Thu, 30 Nov 2017 08:28:33 +0000
Message-ID: <20171130082833.uxs7gnlmurwopigh@dell>
References: <20171130113516.42c8bde2@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20171130113516.42c8bde2@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Jacek Anaszewski <j.anaszewski@samsung.com>, Bjorn Andersson <bjorn.andersson@linaro.org>
List-Id: linux-next.vger.kernel.org

On Thu, 30 Nov 2017, Stephen Rothwell wrote:

> Hi Lee,
> 
> After merging the mfd tree, today's linux-next build (x86_64 allmodconfig)
> produced this warning:
> 
> drivers/leds/leds-pm8058.c: In function 'pm8058_led_probe':
> drivers/leds/leds-pm8058.c:109:17: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
>   led->ledtype = (u32)of_device_get_match_data(&pdev->dev);

Linuuuuusssssss ...

Please fix.  I'm happy to squash.

> Exposed by commit
> 
>   deed10c2d603 ("mfd: pm8xxx: Make elegible for COMPILE_TEST")
> 
> CONFIG_LEDS_PM8058 depends on CONFIG_MFD_PM8XXX which is now turned on
> by allmodconfig.
> 
> The actual problematic commit is:
> 
>   7f866986e705 ("leds: add PM8058 LEDs driver")
> 
> from v4.9-rc1.
> 

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
