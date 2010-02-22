From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH -next] i2c: fix xiic build error
Date: Mon, 22 Feb 2010 08:36:31 -0800
Message-ID: <4B82B28F.10104@oracle.com>
References: <20100204185736.6628ab9a.sfr@canb.auug.org.au>	<4B6B29DD.7060502@oracle.com>	<4B7AC2A9.4070203@oracle.com> <20100216173326.091c1c77@hyperion.delvare> <4B7AC999.3060103@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from acsinet12.oracle.com ([141.146.126.234]:36968 "EHLO
	acsinet12.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751126Ab0BVQh2 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 22 Feb 2010 11:37:28 -0500
In-Reply-To: <4B7AC999.3060103@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: ben-linux@fluff.org
Cc: Jean Delvare <khali@linux-fr.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On 02/16/10 08:36, Randy Dunlap wrote:
> On 02/16/10 08:33, Jean Delvare wrote:
>> Hi Randy,
>>
>> On Tue, 16 Feb 2010 08:07:05 -0800, Randy Dunlap wrote:
>>> On 02/04/10 12:11, Randy Dunlap wrote:
>>>
>>>
>>> This patch is still needed in linux-next-20100216.
>>
>> Nothing I can do about it, as the i2c-xiic driver is neither upstream
>> nor in my tree.
>>
> 
> Thanks, Jean.
> 
> Next/merge.log tells me:
> Merge remote branch 'bjdooks-i2c/next-i2c'
> 
> Ben??
> 

ping Ben.

Here's the patch again.

---
From: Randy Dunlap <randy.dunlap@oracle.com>

Add header file to fix build error:

drivers/i2c/busses/i2c-xiic.c:493: error: implicit declaration of function 'mdelay'

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
Cc: "Ben Dooks (embedded platforms)" <ben-linux@fluff.org>
Cc: linux-i2c@vger.kernel.org
---
 drivers/i2c/busses/i2c-xiic.c |    1 +
 1 file changed, 1 insertion(+)

--- linux-next-20100204.orig/drivers/i2c/busses/i2c-xiic.c
+++ linux-next-20100204/drivers/i2c/busses/i2c-xiic.c
@@ -31,6 +31,7 @@
 #include <linux/module.h>
 #include <linux/init.h>
 #include <linux/errno.h>
+#include <linux/delay.h>
 #include <linux/platform_device.h>
 #include <linux/i2c.h>
 #include <linux/interrupt.h>
