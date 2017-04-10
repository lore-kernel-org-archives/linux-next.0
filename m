From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the rtc tree
Date: Mon, 10 Apr 2017 16:04:54 +1000
Message-ID: <20170410160454.3741cce8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>
List-Id: linux-next.vger.kernel.org

Hi Alexandre,

After merging the rtc tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

ERROR: "legacy_pic" [drivers/rtc/rtc-cmos.ko] undefined!

Caused by commit

  d3e3a65c6a96 ("rtc: cmos: Do not assume irq 8 for rtc when there are no legacy irqs")

"legacy_pic" is not exported to modules.

I have used the rtc tree from next-20170407 for today.

-- 
Cheers,
Stephen Rothwell
