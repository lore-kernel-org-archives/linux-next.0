From: Vincent <vincent.stehle@laposte.net>
Subject: Linux next: boot on Wandboard broken by gic related change
Date: Tue, 02 Dec 2014 00:59:10 +0100
Message-ID: <547D00CE.4050705@bergerie>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Yingjoe Chen <yingjoe.chen@mediatek.com>, linux-next@vger.kernel.org
Cc: Marc Zyngier <marc.zyngier@arm.com>, Jason Cooper <jason@lakedaemon.net>, Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Hi,

FYI, I noticed that Linux next would not boot anymore on Wandboard i.MX6
quad. This, since next-20141127.

After bisecting for a while, `git bisect run' pointed at this very commit:

  9a1091ef0017c40ab63e7fc0326b2dcfd4dde3a4
  irqchip: gic: Support hierarchy irq domain.

Indeed, reverting this commit on top of Linux next-20141201 repairs the
boot.

I am afraid I cannot debug this, but I would gladly help test patches :)

Best regard,

V.
