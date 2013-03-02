From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: mmotm 2013-03-01-15-50 uploaded (strict user copy)
Date: Fri, 01 Mar 2013 19:42:55 -0800
Message-ID: <5131753F.3070302@codeaurora.org>
References: <20130301235135.E9F105A41B2@corp2gmr1-2.hot.corp.google.com> <51316B64.90102@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254]:45517 "EHLO
	wolverine01.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751483Ab3CBDm4 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 1 Mar 2013 22:42:56 -0500
In-Reply-To: <51316B64.90102@infradead.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: akpm@linux-foundation.org, linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-next@vger.kernel.org

On 03/01/13 19:00, Randy Dunlap wrote:
> On 03/01/13 15:51, akpm@linux-foundation.org wrote:
>> The mm-of-the-moment snapshot 2013-03-01-15-50 has been uploaded to
>>
>>    http://www.ozlabs.org/~akpm/mmotm/
>>
>
> on i386:
>
> ERROR: "copy_from_user_overflow" [fs/binfmt_misc.ko] undefined!
>
> which I don't understand.
> lib/usercopy.o is built and building binfmt_misc.c says:
>
>   CC [M]  fs/binfmt_misc.o
> In file included from arch/x86/include/asm/uaccess.h:537:0,
>                  from include/linux/uaccess.h:5,
>                  from include/linux/highmem.h:8,
>                  from include/linux/pagemap.h:10,
>                  from fs/binfmt_misc.c:27:
> arch/x86/include/asm/uaccess_32.h: In function 'parse_command.part.1':
> arch/x86/include/asm/uaccess_32.h:211:26: warning: call to 'copy_from_user_overflow' declared with attribute warning: copy_from_user() buffer size is not provably correct [enabled by default]

Hm.. That's because it's part of lib and not obj, right?

diff --git a/lib/Makefile b/lib/Makefile
index 59fabd0..4c55104 100644
--- a/lib/Makefile
+++ b/lib/Makefile
@@ -15,7 +15,7 @@ lib-y := ctype.o string.o vsprintf.o cmdline.o \
         is_single_threaded.o plist.o decompress.o kobject_uevent.o \
         earlycpio.o percpu-refcount.o
 
-lib-$(CONFIG_ARCH_HAS_DEBUG_STRICT_USER_COPY_CHECKS) += usercopy.o
+obj-$(CONFIG_ARCH_HAS_DEBUG_STRICT_USER_COPY_CHECKS) += usercopy.o
 lib-$(CONFIG_MMU) += ioremap.o
 lib-$(CONFIG_SMP) += cpumask.o
 

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
hosted by The Linux Foundation
