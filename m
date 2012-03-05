From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: linux-next: Tree for Mar 5 (of/irqs)
Date: Mon, 05 Mar 2012 09:45:32 -0800
Message-ID: <4F54FBBC.5060809@xenotime.net>
References: <20120305181024.d396adb4fefdf6d269657606@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from oproxy8-pub.bluehost.com ([69.89.22.20]:45798 "HELO
	oproxy8-pub.bluehost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1757213Ab2CERpW (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 5 Mar 2012 12:45:22 -0500
In-Reply-To: <20120305181024.d396adb4fefdf6d269657606@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Grant Likely <grant.likely@secretlab.ca>

On 03/04/2012 11:10 PM, Stephen Rothwell wrote:

> Hi all,
> 
> Changes since 20120302:



Still have both of these build errors (on i386/X86_32;
2 different builds):


drivers/mfd/twl-core.c:1262:2: error: implicit declaration of function 'irq_alloc_descs'
drivers/mfd/twl-core.c:1357:3: error: implicit declaration of function 'of_platform_populate'


and:

drivers/gpio/gpio-sodaville.c:130:2: error: unknown field 'dt_translate' specified in initializer
drivers/gpio/gpio-sodaville.c:130:2: warning: initialization from incompatible pointer type
drivers/gpio/gpio-sodaville.c:152:8: error: 'struct irq_domain' has no member named 'irq_base'
drivers/gpio/gpio-sodaville.c:182:2: error: implicit declaration of function 'irq_domain_add'
drivers/gpio/gpio-sodaville.c:263:2: error: implicit declaration of function 'irq_domain_del'




~Randy
