From: Wolfgang Grandegger <wg@grandegger.com>
Subject: Re: linux-next: net tree build warning
Date: Wed, 10 Jun 2009 09:38:55 +0200
Message-ID: <4A2F630F.5020602@grandegger.com>
References: <4A2E46A7.6020302@grandegger.com>	<20090609.042625.194310688.davem@davemloft.net>	<4A2E603E.3040603@grandegger.com> <20090609.173806.193714555.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.9]:35196 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754511AbZFJHi4 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 10 Jun 2009 03:38:56 -0400
In-Reply-To: <20090609.173806.193714555.davem@davemloft.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>
Cc: sfr@canb.auug.org.au, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

David Miller wrote:
> From: Wolfgang Grandegger <wg@grandegger.com>
> Date: Tue, 09 Jun 2009 15:14:38 +0200
> 
>> David Miller wrote:
>>> From: Wolfgang Grandegger <wg@grandegger.com>
>>> Date: Tue, 09 Jun 2009 13:25:27 +0200
>>>
>>>> [PATCH] can: sja1000_of_platform: fix build problems with printk format
>>>>
>>>> Variables of type size_t should be printed with the format "%zx".
>>>>
>>>> Signed-off-by: Wolfgang Grandegger <wg@grandegger.com>
>>> It's not a "size_t", it's a "resource_size_t" which can be
>>> "unsigned long long" on some platforms.
>> Right, but I assume that the %zx handles that type properly as well.
> 
> It absolutely does not.b
> 
> resource_size_t is a arch specifically defined type that
> could be anything, it does not conform to the definitions
> of size_t.

Right, I'm now compiling on a x86_64 system and can reproduce the
warnings. Below is a revised patch.

Thanks for your patience.

Wolfgang.


[PATCH v2] can: sja1000_of_platform: fix build problems with printk format

According to "Documentation/printk-formats.txt", if the type is
dependent on a config option for its size, like resource_size_t,
we should use a format specifier of its largest possible type and
explicitly cast to it.

Signed-off-by: Wolfgang Grandegger <wg@grandegger.com>
---
 drivers/net/can/sja1000/sja1000_of_platform.c |   10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

Index: net-next-2.6/drivers/net/can/sja1000/sja1000_of_platform.c
===================================================================
--- net-next-2.6.orig/drivers/net/can/sja1000/sja1000_of_platform.c	2009-06-09 12:45:38.000000000 +0200
+++ net-next-2.6/drivers/net/can/sja1000/sja1000_of_platform.c	2009-06-10 09:23:47.208720083 +0200
@@ -108,15 +108,17 @@
 	res_size = resource_size(&res);
 
 	if (!request_mem_region(res.start, res_size, DRV_NAME)) {
-		dev_err(&ofdev->dev, "couldn't request %#x..%#x\n",
-			res.start, res.end);
+		dev_err(&ofdev->dev, "couldn't request %#llx..%#llx\n",
+			(unsigned long long)res.start,
+			(unsigned long long)res.end);
 		return -EBUSY;
 	}
 
 	base = ioremap_nocache(res.start, res_size);
 	if (!base) {
-		dev_err(&ofdev->dev, "couldn't ioremap %#x..%#x\n",
-			res.start, res.end);
+		dev_err(&ofdev->dev, "couldn't ioremap %#llx..%#llx\n",
+			(unsigned long long)res.start,
+			(unsigned long long)res.end);
 		err = -ENOMEM;
 		goto exit_release_mem;
 	}
