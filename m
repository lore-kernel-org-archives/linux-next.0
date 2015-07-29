From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
Date: Wed, 29 Jul 2015 00:08:27 -0700
Message-ID: <55B87BEB.1080608@roeck-us.net>
References: <20150729170359.1a8e05cf@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:42407 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752012AbbG2HIa (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 29 Jul 2015 03:08:30 -0400
In-Reply-To: <20150729170359.1a8e05cf@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Andrew Morton <akpm@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On 07/29/2015 12:03 AM, Stephen Rothwell wrote:
> Hi Andrew,
>
> After merging the akpm-current tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
>
> kernel/watchdog.c:654:6: error: redefinition of 'watchdog_nmi_enable_all'
>   void watchdog_nmi_enable_all(void) {}
>        ^
> In file included from kernel/watchdog.c:16:0:
> include/linux/nmi.h:34:20: note: previous definition of 'watchdog_nmi_enable_all' was here
>   static inline void watchdog_nmi_enable_all(void) {}
>                      ^
> kernel/watchdog.c:655:6: error: redefinition of 'watchdog_nmi_disable_all'
>   void watchdog_nmi_disable_all(void) {}
>        ^
> In file included from kernel/watchdog.c:16:0:
> include/linux/nmi.h:33:20: note: previous definition of 'watchdog_nmi_disable_all' was here
>   static inline void watchdog_nmi_disable_all(void) {}
>                      ^
>
> Caused by commit
>
>    7e6e3bfa2820 ("kernel/watchdog: move NMI function header declarations from watchdog.h to nmi.h")
>
> I have reverted that commit for today.
>


v2 with a fix submitted already, after the zero day build bots alerted me.

Sorry for the trouble; I didn't expect that there would be two sets of dummy functions.
No excuse, of course :-(.

Guenter
