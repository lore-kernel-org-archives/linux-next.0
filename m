From: Stehle Vincent-B46079 <B46079@freescale.com>
Subject: next-20130627 breaks i.MX6 sabre sd UART console
Date: Thu, 27 Jun 2013 18:49:36 +0000
Message-ID: <F7C43F8B2814514CA05F3436BC68046EF1EB72@039-SN2MPN1-013.039d.mgd.msft.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from co9ehsobe004.messaging.microsoft.com ([207.46.163.27]:47430
	"EHLO co9outboundpool.messaging.microsoft.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752593Ab3F0Stn convert rfc822-to-8bit
	(ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 27 Jun 2013 14:49:43 -0400
Content-Language: en-US
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, John Stultz <john.stultz@linaro.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Hi,

FYI I remark that today's Linux next 'next-20130627' breaks i.MX6 sabre sd UART console with ARM config imx_v6_v7_defconfig.

This was working fine yesterday with 'next-20130626'.

Bisecting gave me this commit:

  064706514ec3fea740c2656e03c4f01f6a551ac4  clocksource: Add generic dummy timer driver

If I revert it I do indeed get the boot messages on the UART console again, but the kernel then crashes in wm8962_probe(). So there is more to find out...

Best regards,

V.
