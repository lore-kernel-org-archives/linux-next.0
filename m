From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the akpm-current tree
Date: Wed, 29 Jul 2015 17:03:59 +1000
Message-ID: <20150729170359.1a8e05cf@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:36304 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751891AbbG2HEB (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 29 Jul 2015 03:04:01 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>

Hi Andrew,

After merging the akpm-current tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

kernel/watchdog.c:654:6: error: redefinition of 'watchdog_nmi_enable_all'
 void watchdog_nmi_enable_all(void) {}
      ^
In file included from kernel/watchdog.c:16:0:
include/linux/nmi.h:34:20: note: previous definition of 'watchdog_nmi_enable_all' was here
 static inline void watchdog_nmi_enable_all(void) {}
                    ^
kernel/watchdog.c:655:6: error: redefinition of 'watchdog_nmi_disable_all'
 void watchdog_nmi_disable_all(void) {}
      ^
In file included from kernel/watchdog.c:16:0:
include/linux/nmi.h:33:20: note: previous definition of 'watchdog_nmi_disable_all' was here
 static inline void watchdog_nmi_disable_all(void) {}
                    ^

Caused by commit

  7e6e3bfa2820 ("kernel/watchdog: move NMI function header declarations from watchdog.h to nmi.h")

I have reverted that commit for today.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
