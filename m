From: Kirill Tkhai <tkhai@yandex.ru>
Subject: Re: linux-next: build failure after merge of the final tree (sparc-next tree related)
Date: Mon, 16 Apr 2012 11:45:55 +0400
Message-ID: <273521334562355@web29.yandex.ru>
References: <20120416155907.32c0041caa002f72da4635b7@canb.auug.org.au> <20120416.021613.606704342231219042.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=koi8-r
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from forward19.mail.yandex.net ([95.108.253.144]:50379 "EHLO
	forward19.mail.yandex.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751225Ab2DPHwZ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 16 Apr 2012 03:52:25 -0400
In-Reply-To: <20120416.021613.606704342231219042.davem@davemloft.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>
Cc: "sfr@canb.auug.org.au" <sfr@canb.auug.org.au>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "sam@ravnborg.org" <sam@ravnborg.org>, Tkhai Kirill <tkhai@yandex.ru>



16.04.2012, 10:16, "David Miller" <davem@davemloft.net>:
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Mon, 16 Apr 2012 15:59:07 +1000
>
>> =9AAfter merging the final tree, today's linux-next build (sparc32 d=
efconfig)
>> =9Afailed like this:
>>
>> =9Aarch/sparc/kernel/pcic.c: In function 'pci_time_init':
>> =9Aarch/sparc/kernel/pcic.c:741:2: error: 'timer_cs_period' undeclar=
ed (first use in this function)
>>
>> =9ACaused by commit 62f082830d63 ("sparc32: generic clockevent suppo=
rt").
>>
>> =9AI have reverted that commit for today.
>
> Sam, Tkhai, please fix this.

Hi! This place is a mix from two last patches. The fix is below.

Regards,
KT

P.S. I'm sending the message from a web mail client to answer faster. I=
 hope, it won't be problems.

---
 arch/sparc/kernel/pcic.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)
diff --git a/arch/sparc/kernel/pcic.c b/arch/sparc/kernel/pcic.c
index 118a3f5..866aa34 100644
--- a/arch/sparc/kernel/pcic.c
+++ b/arch/sparc/kernel/pcic.c
@@ -738,7 +738,7 @@ void __init pci_time_init(void)
 	 * It's in SBUS dimension, because timer_cs is in this dimension.
 	 * We take into account this in pcic_cycles_offset()
 	 */
-	timer_cs_period =3D SBUS_CLOCK_RATE / HZ;
+	sparc_config.cs_period =3D SBUS_CLOCK_RATE / HZ;
 	sparc_config.features |=3D FEAT_L10_CLOCKEVENT;
 #endif
 	sparc_config.features |=3D FEAT_L10_CLOCKSOURCE;
