From: Yendapally Reddy Dhananjaya Reddy <yrdreddy@broadcom.com>
Subject: RE: linux-next: build failure after merge of the gpio tree
Date: Wed, 16 Dec 2015 03:55:03 +0000
Message-ID: <1B315A1C295D4642836F090C3F8FEB76042593B8@SJEXCHMB13.corp.ad.broadcom.com>
References: <20151216143755.67915348@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20151216143755.67915348@canb.auug.org.au>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Hi Stephen,

  Sorry. It's my mistake. In the first patch set, I tested it with "irq_clear_status_flags(irq, IRQ_NOREQUEST);" and in the v2 patch set the old one got in.

Regards
Dhananjay
 
-----Original Message-----
From: Stephen Rothwell [mailto:sfr@canb.auug.org.au] 
Sent: Wednesday, December 16, 2015 9:08 AM
To: Linus Walleij
Cc: linux-next@vger.kernel.org; linux-kernel@vger.kernel.org; Yendapally Reddy Dhananjaya Reddy
Subject: linux-next: build failure after merge of the gpio tree

Hi Linus,

After merging the gpio tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

drivers/pinctrl/bcm/pinctrl-nsp-gpio.c: In function 'nsp_gpio_probe':
drivers/pinctrl/bcm/pinctrl-nsp-gpio.c:699:4: error: implicit declaration of function 'set_irq_flags' [-Werror=implicit-function-declaration]
    set_irq_flags(irq, IRQF_VALID);
    ^
drivers/pinctrl/bcm/pinctrl-nsp-gpio.c:699:23: error: 'IRQF_VALID' undeclared (first use in this function)
    set_irq_flags(irq, IRQF_VALID);
                       ^

Caused by commit

  8bfcbbbcabe0 ("pinctrl: nsp: add gpio-a driver support for Broadcom NSP SoC")

set_irq_flags was removed before v4.3-rc2 ...

I have used the gpio tree from next-20151215 for today.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
