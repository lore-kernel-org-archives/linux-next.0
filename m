From: Stehle Vincent-B46079 <B46079@freescale.com>
Subject: RE: next-20130627 breaks i.MX6 sabre sd UART console
Date: Mon, 1 Jul 2013 13:22:56 +0000
Message-ID: <F7C43F8B2814514CA05F3436BC68046EF2F708@039-SN2MPN1-011.039d.mgd.msft.net>
References: <F7C43F8B2814514CA05F3436BC68046EF1EB72@039-SN2MPN1-013.039d.mgd.msft.net>
 <alpine.DEB.2.02.1306281403530.4013@ionos.tec.linutronix.de>
 <51CDB26A.9060500@codeaurora.org>
 <F7C43F8B2814514CA05F3436BC68046EF2297D@039-SN2MPN1-013.039d.mgd.msft.net>
 <51CDC2B3.1030907@codeaurora.org> <20130629020738.GG11625@codeaurora.org>
 <F7C43F8B2814514CA05F3436BC68046EF2EF29@039-SN2MPN1-011.039d.mgd.msft.net>
 <alpine.DEB.2.02.1307011425500.4013@ionos.tec.linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ch1ehsobe002.messaging.microsoft.com ([216.32.181.182]:49326
	"EHLO ch1outboundpool.messaging.microsoft.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753440Ab3GANW6 convert rfc822-to-8bit
	(ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 1 Jul 2013 09:22:58 -0400
In-Reply-To: <alpine.DEB.2.02.1307011425500.4013@ionos.tec.linutronix.de>
Content-Language: en-US
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Stephen Boyd <sboyd@codeaurora.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, John Stultz <john.stultz@linaro.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>

From: Thomas Gleixner [mailto:tglx@linutronix.de] 
> (..) Can you please apply the patch below and provide the output?

Sure; thanks for the patch. The kernel seems to be in a loop, as it prints many messages and never stops. I copy only the first ones:

...
Switched to clocksource mxc_timer1
next 800000000098967f nevt 7fffffffffffffff per 989680 nxtp 1c03a180 now 1c553a59
next 800000000098967f nevt 7fffffffffffffff per 989680 nxtp 1c9c3800 now 1c71e40f
------------[ cut here ]------------
WARNING: CPU: 2 PID: 0 at kernel/time/clockevents.c:212 clockevents_program_event+0x134/0x148()
next 80000000e01d0bff nevt 7fffffffffffffff per 989680 nxtp 1d34ce80 now 1ca4a301
next 80000002c250a67f nevt 7fffffffffffffff per 989680 nxtp 1d34ce80 now 1d05af1c
next 80000004a64e047f nevt 7fffffffffffffff per 989680 nxtp 1dcd6500 now 1d729c96
next 800000068cadbc7f nevt 7fffffffffffffff per 989680 nxtp 1e65fb80 now 1de16ecb
next 80000008730d747f nevt 7fffffffffffffff per 989680 nxtp 1e65fb80 now 1e5173b3
next 8000000a583bff7f nevt 7fffffffffffffff per 989680 nxtp 1efe9200 now 1ec10b4a
next 8000000c3c395d7f nevt 7fffffffffffffff per 989680 nxtp 1f972880 now 1f306de8
next 8000000e2167e87f nevt 7fffffffffffffff per 989680 nxtp 202fbf00 now 1f9fe9db
next 800000100565467f nevt 7fffffffffffffff per 989680 nxtp 202fbf00 now 200f2ff3
next 80000011e831777f nevt 7fffffffffffffff per 989680 nxtp 20c85580 now 207e6fc4
next 80000013cc2ed57f nevt 7fffffffffffffff per 989680 nxtp 2160ec00 now 20edf2c2
next 80000015aefb067f nevt 7fffffffffffffff per 989680 nxtp 2160ec00 now 215d58fd
next 80000017925fcdff nevt 7fffffffffffffff per 989680 nxtp 21f98280 now 21ccfde5
...

Best regards,

V.
