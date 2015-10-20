From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the tip tree with the dt-rh tree
Date: Tue, 20 Oct 2015 13:10:43 +1100
Message-ID: <20151020131043.140d6d04@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:46459 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751182AbbJTCKq (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 19 Oct 2015 22:10:46 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Rob Herring <robherring2@gmail.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jonas Gorski <jogo@openwrt.org>, David Daney <david.daney@cavium.com>, Marc Zyngier <marc.zyngier@arm.com>

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  include/linux/of_irq.h

between commits:

  f9f9f11dcf0f ("of/irq: move of_msi_configure to the right guard and add a dummy")
  52493d446141 ("of/irq: make of_irq_find_parent static")

from the dt-rh tree and commit:

  8db02d8b4089 ("of/irq: Add new function of_msi_map_rid()")
  48ae34fb39b0 ("of/irq: Add support code for multi-parent version of "msi-parent"")
  82b9b4243c6d ("of/irq: Use the msi-map property to provide device-specific MSI domain")

from the tip tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc include/linux/of_irq.h
index 580818d90475,65d969246a4d..000000000000
--- a/include/linux/of_irq.h
+++ b/include/linux/of_irq.h
@@@ -46,7 -46,11 +46,12 @@@ extern int of_irq_get(struct device_nod
  extern int of_irq_get_byname(struct device_node *dev, const char *name);
  extern int of_irq_to_resource_table(struct device_node *dev,
  		struct resource *res, int nr_irqs);
 +extern void of_msi_configure(struct device *dev, struct device_node *np);
+ extern struct irq_domain *of_msi_get_domain(struct device *dev,
+ 					    struct device_node *np,
+ 					    enum irq_domain_bus_token token);
+ extern struct irq_domain *of_msi_map_get_device_domain(struct device *dev,
+ 						       u32 rid);
  #else
  static inline int of_irq_count(struct device_node *dev)
  {
@@@ -65,25 -69,47 +70,43 @@@ static inline int of_irq_to_resource_ta
  {
  	return 0;
  }
 +static inline void of_msi_configure(struct device *dev, struct device_node *np)
 +{
 +}
+ static inline struct irq_domain *of_msi_get_domain(struct device *dev,
+ 						   struct device_node *np,
+ 						   enum irq_domain_bus_token token)
+ {
+ 	return NULL;
+ }
+ static inline struct irq_domain *of_msi_map_get_device_domain(struct device *dev,
+ 							      u32 rid)
+ {
+ 	return NULL;
+ }
  #endif
  
 -#if defined(CONFIG_OF)
 +#if defined(CONFIG_OF_IRQ) || defined(CONFIG_SPARC)
  /*
   * irq_of_parse_and_map() is used by all OF enabled platforms; but SPARC
   * implements it differently.  However, the prototype is the same for all,
   * so declare it here regardless of the CONFIG_OF_IRQ setting.
   */
  extern unsigned int irq_of_parse_and_map(struct device_node *node, int index);
 -extern struct device_node *of_irq_find_parent(struct device_node *child);
 -extern void of_msi_configure(struct device *dev, struct device_node *np);
+ u32 of_msi_map_rid(struct device *dev, struct device_node *msi_np, u32 rid_in);
  
 -#else /* !CONFIG_OF */
 +#else /* !CONFIG_OF && !CONFIG_SPARC */
  static inline unsigned int irq_of_parse_and_map(struct device_node *dev,
  						int index)
  {
  	return 0;
  }
+ 
 -static inline void *of_irq_find_parent(struct device_node *child)
 -{
 -	return NULL;
 -}
 -
+ static inline u32 of_msi_map_rid(struct device *dev,
+ 				 struct device_node *msi_np, u32 rid_in)
+ {
+ 	return rid_in;
+ }
  #endif /* !CONFIG_OF */
  
  #endif /* __OF_IRQ_H */
