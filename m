From: =?UTF-8?B?VmluY2VudCBTdGVobMOp?= <vincent.stehle@laposte.net>
Subject: Re: Linux next: boot on Wandboard broken by gic related change
Date: Tue, 02 Dec 2014 23:39:12 +0100
Message-ID: <547E3F90.50600@bergerie>
References: <547D00CE.4050705@bergerie> <CAOMZO5B=9B_RuPjWQ1B5ONyHVY29fRc1=ag4A4RqKGLKw81sJA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp3-g21.free.fr ([212.27.42.3]:12058 "EHLO smtp3-g21.free.fr"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932984AbaLBWjP (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 2 Dec 2014 17:39:15 -0500
In-Reply-To: <CAOMZO5B=9B_RuPjWQ1B5ONyHVY29fRc1=ag4A4RqKGLKw81sJA@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Fabio Estevam <festevam@gmail.com>
Cc: Yingjoe Chen <yingjoe.chen@mediatek.com>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, Marc Zyngier <marc.zyngier@arm.com>, Jason Cooper <jason@lakedaemon.net>, Thomas Gleixner <tglx@linutronix.de>, linux-kernel <linux-kernel@vger.kernel.org>

On 12/02/2014 01:11 AM, Fabio Estevam wrote:
(..)
> Marc fixed this problem with these patches:
> http://www.spinics.net/lists/arm-kernel/msg382778.html
> and
> http://www.spinics.net/lists/arm-kernel/msg382802.html

Ah! Thanks for pointing that out.

You are right, those two patches repair next-20141201 for me.

Best regards,

V.
