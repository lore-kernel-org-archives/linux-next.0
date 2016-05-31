From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warnings after merge of the rtc tree
Date: Tue, 31 May 2016 12:52:13 +1000
Message-ID: <20160531125213.20d3eaa2@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:57886 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1161732AbcEaCwQ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 30 May 2016 22:52:16 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>

Hi Alexandre,

After merging the rtc tree, today's linux-next build (x86_64 allmodconfig)
produced these warnings:

In file included from drivers/char/mwave/smapi.c:51:0:
drivers/char/mwave/smapi.h:52:0: warning: "TRUE" redefined
 #define TRUE 1
 ^
In file included from include/acpi/acpi.h:58:0,
                 from include/linux/acpi.h:33,
                 from include/linux/mc146818rtc.h:21,
                 from drivers/char/mwave/smapi.c:50:
include/acpi/actypes.h:438:0: note: this is the location of the previous definition
 #define TRUE                            (1 == 1)
 ^
In file included from drivers/char/mwave/smapi.c:51:0:
drivers/char/mwave/smapi.h:53:0: warning: "FALSE" redefined
 #define FALSE 0
 ^
In file included from include/acpi/acpi.h:58:0,
                 from include/linux/acpi.h:33,
                 from include/linux/mc146818rtc.h:21,
                 from drivers/char/mwave/smapi.c:50:
include/acpi/actypes.h:433:0: note: this is the location of the previous definition
 #define FALSE                           (1 == 0)
 ^

Introduced by commit

  fd09cc80165c ("rtc: cmos: move mc146818rtc code out of asm-generic/rtc.h")

Why the hell do we have any definitions of TRUE and FALSE, anyway?
There are a few more (I counted 4 in header files before stopping).

Hmmm, those 2 static inline functions in include/linux/mc146818rtc.h
that reference ACPI stuff are probably to big to be inline and in a header
file anyway, right?

-- 
Cheers,
Stephen Rothwell
