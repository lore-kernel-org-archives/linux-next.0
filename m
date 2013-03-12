From: Daniel Hellstrom <daniel@gaisler.com>
Subject: Re: linux-next: build failure after merge of the final tree
Date: Tue, 12 Mar 2013 10:31:09 +0100
Message-ID: <513EF5DD.2010501@gaisler.com>
References: <20130312153047.dc10eb2392d07af8822e45f1@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from vsp-authed02.binero.net ([195.74.38.226]:44250 "HELO
	vsp-authed-03-02.binero.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with SMTP id S1755039Ab3CLJd6 (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Tue, 12 Mar 2013 05:33:58 -0400
In-Reply-To: <20130312153047.dc10eb2392d07af8822e45f1@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hello,

APBPS2 driver is missing linux/slab.h required on at least PowerPC. See patch below. How do you want me to proceed?

Thanks,
Daniel


diff --git a/drivers/input/serio/apbps2.c b/drivers/input/serio/apbps2.c
index 611aac0..858b0c9 100644
--- a/drivers/input/serio/apbps2.c
+++ b/drivers/input/serio/apbps2.c
@@ -30,6 +30,7 @@
  #include <linux/string.h>
  #include <linux/kernel.h>
  #include <linux/io.h>
+#include <linux/slab.h>

  struct apbps2_regs {
         u32 __iomem data;       /* 0x00 */


On 03/12/2013 05:30 AM, Stephen Rothwell wrote:
> Hi all,
>
> After merging the final tree, today's linux-next build (powerpc
> allyesconfig) failed like this:
>
> drivers/input/serio/apbps2.c: In function 'apbps2_of_probe':
> drivers/input/serio/apbps2.c:176:2: error: implicit declaration of function 'kzalloc' [-Werror=implicit-function-declaration]
> drivers/input/serio/apbps2.c:176:11: warning: assignment makes pointer from integer without a cast [enabled by default]
>
> Caused by commit 928a48c9e40e ("Input: add support for GRLIB APBPS2 PS/2
> Keyboard/Mouse") from the input tree.
>
> I have reverted that commit for today.
