From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the gpio tree
Date: Fri, 9 Sep 2016 14:36:17 +1000
Message-ID: <20160909143617.7106762e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Marc Zyngier <marc.zyngier@arm.com>
List-Id: linux-next.vger.kernel.org

Hi Linus,

After merging the gpio tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

drivers/gpio/gpiolib.c: In function '_gpiochip_irqchip_add':
drivers/gpio/gpiolib.c:1622:62: error: macro "WARN_ON" passed 3 arguments, but takes just 1
       "%s: Ignoring %d default trigger\n", of_node->full_name))
                                                              ^
drivers/gpio/gpiolib.c:1621:6: error: 'WARN_ON' undeclared (first use in this function)
  if (WARN_ON(of_node && type != IRQ_TYPE_NONE,
      ^

Caused by commit

  1ded8b1dafe6 ("gpio/gpiolib: Forbid irqchip default trigger if probed over DT")

I used the version of the gpio tree from next-20160908 for today.

-- 
Cheers,
Stephen Rothwell
