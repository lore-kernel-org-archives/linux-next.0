From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the arm tree with the arm-current tree
Date: Mon, 16 Feb 2009 10:39:47 +1100
Message-ID: <20090216103947.12d84612.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:57976 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753242AbZBOXjy (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 15 Feb 2009 18:39:54 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Russell King <rmk@arm.linux.org.uk>
Cc: linux-next@vger.kernel.org, Ryan Mallon <ryan@bluewatersys.com>, Andrew Victor <linux@maxim.org.za>, Marc Pignat <marc.pignat@hevs.ch>

Hi Russell,

Today's linux-next merge of the arm tree got a conflict in
arch/arm/mach-at91/gpio.c between commit
2b768b6cdbcf7fa0761e6c35c6ea288297582c43 ("[ARM] 5391/1: AT91: Enable
GPIO clocks earlier") from the arm-current tree and commit
f373e8c0639f1720d2d0fe414990f504e113c2ba ("[ARM] 5373/2: Add gpiolib
support to AT91") from the arm tree.

Overlapping changes.  I fixed it up as below (which may not be correct,
so needs checking) and can carry the fix for a while.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc arch/arm/mach-at91/gpio.c
index 2f7d497,028e4f7..0000000
--- a/arch/arm/mach-at91/gpio.c
+++ b/arch/arm/mach-at91/gpio.c
@@@ -430,68 -437,7 +437,8 @@@ static void gpio_irq_handler(unsigned i
  
  /*--------------------------------------------------------------------------*/
  
- #ifdef CONFIG_DEBUG_FS
- 
- static int at91_gpio_show(struct seq_file *s, void *unused)
- {
- 	int bank, j;
- 
- 	/* print heading */
- 	seq_printf(s, "Pin\t");
- 	for (bank = 0; bank < gpio_banks; bank++) {
- 		seq_printf(s, "PIO%c\t", 'A' + bank);
- 	};
- 	seq_printf(s, "\n\n");
- 
- 	/* print pin status */
- 	for (j = 0; j < 32; j++) {
- 		seq_printf(s, "%i:\t", j);
- 
- 		for (bank = 0; bank < gpio_banks; bank++) {
- 			unsigned	pin  = PIN_BASE + (32 * bank) + j;
- 			void __iomem	*pio = pin_to_controller(pin);
- 			unsigned	mask = pin_to_mask(pin);
- 
- 			if (__raw_readl(pio + PIO_PSR) & mask)
- 				seq_printf(s, "GPIO:%s", __raw_readl(pio + PIO_PDSR) & mask ? "1" : "0");
- 			else
- 				seq_printf(s, "%s", __raw_readl(pio + PIO_ABSR) & mask ? "B" : "A");
- 
- 			seq_printf(s, "\t");
- 		}
- 
- 		seq_printf(s, "\n");
- 	}
- 
- 	return 0;
- }
- 
- static int at91_gpio_open(struct inode *inode, struct file *file)
- {
- 	return single_open(file, at91_gpio_show, NULL);
- }
- 
- static const struct file_operations at91_gpio_operations = {
- 	.open		= at91_gpio_open,
- 	.read		= seq_read,
- 	.llseek		= seq_lseek,
- 	.release	= single_release,
- };
- 
- static int __init at91_gpio_debugfs_init(void)
- {
- 	/* /sys/kernel/debug/at91_gpio */
- 	(void) debugfs_create_file("at91_gpio", S_IFREG | S_IRUGO, NULL, NULL, &at91_gpio_operations);
- 	return 0;
- }
- postcore_initcall(at91_gpio_debugfs_init);
- 
- #endif
- 
- /*--------------------------------------------------------------------------*/
- 
 -/* This lock class tells lockdep that GPIO irqs are in a different
 +/*
 + * This lock class tells lockdep that GPIO irqs are in a different
   * category than their parents, so it won't report false recursion.
   */
  static struct lock_class_key gpio_lock_class;
@@@ -502,17 -448,20 +449,17 @@@
  void __init at91_gpio_irq_setup(void)
  {
  	unsigned		pioc, pin;
- 	struct at91_gpio_bank	*this, *prev;
+ 	struct at91_gpio_chip	*this, *prev;
  
- 	for (pioc = 0, pin = PIN_BASE, this = gpio, prev = NULL;
+ 	for (pioc = 0, pin = PIN_BASE, this = gpio_chip, prev = NULL;
  			pioc++ < gpio_banks;
  			prev = this, this++) {
- 		unsigned	id = this->id;
+ 		unsigned	id = this->bank->id;
  		unsigned	i;
  
 -		/* enable PIO controller's clock */
 -		clk_enable(this->bank->clock);
 -
  		__raw_writel(~0, this->regbase + PIO_IDR);
  
- 		for (i = 0, pin = this->chipbase; i < 32; i++, pin++) {
+ 		for (i = 0, pin = this->chip.base; i < 32; i++, pin++) {
  			lockdep_set_class(&irq_desc[pin].lock, &gpio_lock_class);
  
  			/*
@@@ -547,22 -579,21 +577,28 @@@ void __init at91_gpio_init(struct at91_
  
  	BUG_ON(nr_banks > MAX_GPIO_BANKS);
  
- 	gpio = data;
  	gpio_banks = nr_banks;
  
- 	for (i = 0, last = NULL; i < nr_banks; i++, last = data, data++) {
- 		data->chipbase = PIN_BASE + i * 32;
- 		data->regbase = data->offset + (void __iomem *)AT91_VA_BASE_SYS;
+ 	for (i = 0; i < nr_banks; i++) {
+ 		at91_gpio = &gpio_chip[i];
+ 
+ 		at91_gpio->bank = &data[i];
+ 		at91_gpio->chip.base = PIN_BASE + i * 32;
+ 		at91_gpio->regbase = at91_gpio->bank->offset +
+ 			(void __iomem *)AT91_VA_BASE_SYS;
  
 -		/* AT91SAM9263_ID_PIOCDE groups PIOC, PIOD, PIOE */
 +		/* enable PIO controller's clock */
- 		clk_enable(data->clock);
++		clk_enable(at91_gpio->bank->clock);
 +
 +		/*
 +		 * Some processors share peripheral ID between multiple GPIO banks.
 +		 *  SAM9263 (PIOC, PIOD, PIOE)
 +		 *  CAP9 (PIOA, PIOB, PIOC, PIOD)
 +		 */
- 		if (last && last->id == data->id)
- 			last->next = data;
+ 		if (last && last->bank->id == at91_gpio->bank->id)
+ 			last->next = at91_gpio;
+ 		last = at91_gpio;
+ 
+ 		gpiochip_add(&at91_gpio->chip);
  	}
  }
