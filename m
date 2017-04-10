From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: linux-next: build failure after merge of the rtc tree
Date: Mon, 10 Apr 2017 09:45:45 +0200
Message-ID: <e5cb6b88-ea66-c874-272e-183bba1a2d7a@redhat.com>
References: <20170410160454.3741cce8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------0005D1F10FB94C85375D2ACB"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:45616 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752829AbdDJHpx (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 10 Apr 2017 03:45:53 -0400
In-Reply-To: <20170410160454.3741cce8@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Alexandre Belloni <alexandre.belloni@free-electrons.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

This is a multi-part message in MIME format.
--------------0005D1F10FB94C85375D2ACB
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 10-04-17 08:04, Stephen Rothwell wrote:
> Hi Alexandre,
>
> After merging the rtc tree, today's linux-next build (x86_64 allmodconfig)
> failed like this:
>
> ERROR: "legacy_pic" [drivers/rtc/rtc-cmos.ko] undefined!
>
> Caused by commit
>
>   d3e3a65c6a96 ("rtc: cmos: Do not assume irq 8 for rtc when there are no legacy irqs")
>
> "legacy_pic" is not exported to modules.
>
> I have used the rtc tree from next-20170407 for today.

I already send out a patch to fix this yesterday. I've attached a copy.

Regards,

Hans

--------------0005D1F10FB94C85375D2ACB
Content-Type: text/x-patch;
 name="0001-x86-i8259-export-legacy_pic-symbol.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-x86-i8259-export-legacy_pic-symbol.patch"

>From e869aedc4f19c17057d936f408998da230b92d2f Mon Sep 17 00:00:00 2001
From: Hans de Goede <hdegoede@redhat.com>
Date: Sat, 8 Apr 2017 19:47:45 +0200
Subject: [RFC] x86: i8259: export legacy_pic symbol

The classic PC rtc-coms driver has a workaround for broken ACPI device
nodes for it which lack an irq resource. This workaround used to
unconditionally hardcode the irq to 8 in these cases.

This was causing irq conflict problems on systems without a legacy-pic
so a recent patch added an if (nr_legacy_irqs()) guard to the
workaround to avoid this irq conflict.

nr_legacy_irqs() uses the legacy_pic symbol under the hood causing
an undefined symbol error if the rtc-cmos code is build as a module.

This commit exports the legacy_pic symbol to fix this.

Cc: rtc-linux@googlegroups.com
Cc: alexandre.belloni@free-electrons.com
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v2:
-Use EXPORT_SYMBOL_GPL instead of EXPORT_SYMBOL
---
 arch/x86/kernel/i8259.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/x86/kernel/i8259.c b/arch/x86/kernel/i8259.c
index be22f5a..0bcf43d 100644
--- a/arch/x86/kernel/i8259.c
+++ b/arch/x86/kernel/i8259.c
@@ -418,6 +418,7 @@ struct legacy_pic default_legacy_pic = {
 };
 
 struct legacy_pic *legacy_pic = &default_legacy_pic;
+EXPORT_SYMBOL_GPL(legacy_pic);
 
 static int __init i8259A_init_ops(void)
 {
-- 
2.9.3


--------------0005D1F10FB94C85375D2ACB--
