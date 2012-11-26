From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH -next] mfd: fix stmpe.c build when OF is not enabled
Date: Mon, 26 Nov 2012 11:21:33 -0800
Message-ID: <50B3C13D.1050704@infradead.org>
References: <20121112164431.8bcfe78d2a2ec73271733db4@canb.auug.org.au>	<50A12FF1.4000800@infradead.org> <CACRpkdZj5iuyXAfynF-5r65dnakxxm2A1O602P4Lc6it8=fU9g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from casper.infradead.org ([85.118.1.10]:34225 "EHLO
	casper.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752472Ab2KZTVw (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 26 Nov 2012 14:21:52 -0500
In-Reply-To: <CACRpkdZj5iuyXAfynF-5r65dnakxxm2A1O602P4Lc6it8=fU9g@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Rabin Vincent <rabin.vincent@stericsson.com>, Samuel Ortiz <sameo@linux.intel.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On 11/13/2012 05:35 AM, Linus Walleij wrote:

> On Mon, Nov 12, 2012 at 6:20 PM, Randy Dunlap <rdunlap@infradead.org> wrote:
> 
>> From: Randy Dunlap <rdunlap@infradead.org>
>>
>> Fix build errors when CONFIG_OF is not enabled by including
>> <linux/of.h> (needs to be added in any case).
>> An alternative fix could be to make the driver depend on OF.
>>
>> drivers/mfd/stmpe.c:1025:2: error: implicit declaration of function 'of_property_read_u32'
>> drivers/mfd/stmpe.c:1030:2: error: implicit declaration of function 'for_each_child_of_node'
>> drivers/mfd/stmpe.c:1030:36: error: expected ';' before '{' token
>>
>> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
>> Cc: Rabin Vincent <rabin.vincent@stericsson.com>
>> Cc: Samuel Ortiz <sameo@linux.intel.com>
> 
> Acked-by: Linus Walleij <linus.walleij@linaro.org>




ping?

This patch is still needed in linux-next.

---
From: Randy Dunlap <rdunlap@infradead.org>

Fix build errors when CONFIG_OF is not enabled by including
<linux/of.h> (needs to be added in any case).
An alternative fix could be to make the driver depend on OF.

drivers/mfd/stmpe.c:1025:2: error: implicit declaration of function 'of_property_read_u32'
drivers/mfd/stmpe.c:1030:2: error: implicit declaration of function 'for_each_child_of_node'
drivers/mfd/stmpe.c:1030:36: error: expected ';' before '{' token

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Rabin Vincent <rabin.vincent@stericsson.com>
Cc: Samuel Ortiz <sameo@linux.intel.com>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/mfd/stmpe.c |    1 +
 1 file changed, 1 insertion(+)

--- linux-next-20121112.orig/drivers/mfd/stmpe.c
+++ linux-next-20121112/drivers/mfd/stmpe.c
@@ -13,6 +13,7 @@
 #include <linux/interrupt.h>
 #include <linux/irq.h>
 #include <linux/irqdomain.h>
+#include <linux/of.h>
 #include <linux/pm.h>
 #include <linux/slab.h>
 #include <linux/mfd/core.h>
