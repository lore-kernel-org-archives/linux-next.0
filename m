From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the gpio tree
Date: Fri, 29 Jan 2016 12:45:57 +1100
Message-ID: <20160129124557.30f3f73f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Liu Gang <Gang.Liu@nxp.com>
List-Id: linux-next.vger.kernel.org

Hi Linus,

After merging the gpio tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/gpio/gpio-mpc8xxx.c: In function 'mpc8xxx_gpio_save_regs':
drivers/gpio/gpio-mpc8xxx.c:57:21: error: implicit declaration of function 'in_be32' [-Werror=implicit-function-declaration]
  mpc8xxx_gc->data = in_be32(mm->regs + GPIO_DAT);
                     ^
drivers/gpio/gpio-mpc8xxx.c: In function 'mpc8xxx_gpio_set':
drivers/gpio/gpio-mpc8xxx.c:100:2: error: implicit declaration of function 'out_be32' [-Werror=implicit-function-declaration]
  out_be32(mm->regs + GPIO_DAT, mpc8xxx_gc->data);
  ^
drivers/gpio/gpio-mpc8xxx.c: In function 'mpc8xxx_gpio_dir_in':
drivers/gpio/gpio-mpc8xxx.c:139:2: error: implicit declaration of function 'clrbits32' [-Werror=implicit-function-declaration]
  clrbits32(mm->regs + GPIO_DIR, mpc8xxx_gpio2mask(gpio));
  ^
drivers/gpio/gpio-mpc8xxx.c: In function 'mpc8xxx_gpio_dir_out':
drivers/gpio/gpio-mpc8xxx.c:156:2: error: implicit declaration of function 'setbits32' [-Werror=implicit-function-declaration]
  setbits32(mm->regs + GPIO_DIR, mpc8xxx_gpio2mask(gpio));
  ^
drivers/gpio/gpio-mpc8xxx.c: In function 'mpc512x_irq_set_type':
drivers/gpio/gpio-mpc8xxx.c:289:3: error: implicit declaration of function 'clrsetbits_be32' [-Werror=implicit-function-declaration]
   clrsetbits_be32(reg, 3 << shift, 2 << shift);
   ^
drivers/gpio/gpio-mpc8xxx.c: In function 'mpc8xxx_probe':
drivers/gpio/gpio-mpc8xxx.c:419:26: error: 'NO_IRQ' undeclared (first use in this function)
  if (mpc8xxx_gc->irqn == NO_IRQ)   
                          ^
drivers/gpio/gpio-mpc8xxx.c:419:26: note: each undeclared identifier is reported only once for each function it appears in

Exposed by commit

  5df7fd46b70b ("pio/qoriq: Add qoriq platforms support")

The COMPILE_TEST dependency has revealed several implicit includes ...

I have used the gpio tree from next-20160128 for today.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
