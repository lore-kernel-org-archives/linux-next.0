From: Subrata Modak <subrata@linux.vnet.ibm.com>
Subject: [next-20100722] drivers/input/serio/i8042.ko undefined error & Bad
	Relocations warning
Date: Fri, 23 Jul 2010 15:45:12 +0530
Message-ID: <1279880113.11936.7.camel@subratamodak.linux.ibm.com>
Reply-To: subrata@linux.vnet.ibm.com
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e35.co.us.ibm.com ([32.97.110.153]:54506 "EHLO
	e35.co.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756234Ab0GWKQJ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 23 Jul 2010 06:16:09 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Vojtech Pavlik <vojtech@suse.cz>
Cc: linux-next <linux-next@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Linuxppc-dev <Linuxppc-dev@ozlabs.org>, Paul Mackerras <paulus@au1.ibm.com>, sachinp <sachinp@linux.vnet.ibm.com>, Kamalesh Babulal <kamalesh@linux.vnet.ibm.com>, "divya.vikas" <divya.vikas@in.ibm.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>

With linux-next-20100722 on Power7 and allmodconfig, i get the following
undefined error and Bad relocation warning:

ERROR: "of_i8042_kbd_irq" [drivers/input/serio/i8042.ko] undefined!
ERROR: "of_i8042_aux_irq" [drivers/input/serio/i8042.ko] undefined!

...
and
...

WARNING: 3 bad relocations
c000000000008590 R_PPC64_ADDR32    .text+0x4000000000008460
c000000000008594 R_PPC64_ADDR32    .text+0x4000000000008598
c000000000add890 R_PPC64_ADDR64    __crc_softirq_work_list

I reported the above on 2.6.35-rc5 alone few days back:
http://marc.info/?t=127919383300002&r=1&w=2,

However,
c000000000add890 R_PPC64_ADDR64    __crc_softirq_work_list

is newly seen apart from:
c000000000008590 R_PPC64_ADDR32    .text+0x4000000000008460
c000000000008594 R_PPC64_ADDR32    .text+0x4000000000008598

Regards--
Subrata
