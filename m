From: Fabio Estevam <festevam@gmail.com>
Subject: Re: Linux next: boot on Wandboard broken by gic related change
Date: Mon, 1 Dec 2014 22:11:09 -0200
Message-ID: <CAOMZO5B=9B_RuPjWQ1B5ONyHVY29fRc1=ag4A4RqKGLKw81sJA@mail.gmail.com>
References: <547D00CE.4050705@bergerie>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-la0-f53.google.com ([209.85.215.53]:58853 "EHLO
	mail-la0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752934AbaLBALL (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 1 Dec 2014 19:11:11 -0500
In-Reply-To: <547D00CE.4050705@bergerie>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Vincent <vincent.stehle@laposte.net>
Cc: Yingjoe Chen <yingjoe.chen@mediatek.com>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, Marc Zyngier <marc.zyngier@arm.com>, Jason Cooper <jason@lakedaemon.net>, Thomas Gleixner <tglx@linutronix.de>, linux-kernel <linux-kernel@vger.kernel.org>

Hi Vincent,

On Mon, Dec 1, 2014 at 9:59 PM, Vincent <vincent.stehle@laposte.net> wrote:
> Hi,
>
> FYI, I noticed that Linux next would not boot anymore on Wandboard i.MX6
> quad. This, since next-20141127.
>
> After bisecting for a while, `git bisect run' pointed at this very commit:
>
>   9a1091ef0017c40ab63e7fc0326b2dcfd4dde3a4
>   irqchip: gic: Support hierarchy irq domain.
>
> Indeed, reverting this commit on top of Linux next-20141201 repairs the
> boot.
>
> I am afraid I cannot debug this, but I would gladly help test patches :)

Marc fixed this problem with these patches:

http://www.spinics.net/lists/arm-kernel/msg382778.html

and

http://www.spinics.net/lists/arm-kernel/msg382802.html
