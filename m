From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
Date: Wed, 23 Aug 2017 15:13:26 -0700
Message-ID: <20170823151326.a32b42a27b016b4705d0e98c@linux-foundation.org>
References: <20170823204159.3d706699@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:45538 "EHLO
        mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751003AbdHWWN2 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 23 Aug 2017 18:13:28 -0400
In-Reply-To: <20170823204159.3d706699@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Matthew Wilcox <mawilcox@microsoft.com>

On Wed, 23 Aug 2017 20:41:59 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> After merging the akpm-current tree, today's linux-next build (mips
> defconfig) failed like this:
> 
> In file included from include/linux/selection.h:11:0,
>                  from drivers/video/console/newport_con.c:16:
> include/linux/vt_buffer.h: In function 'scr_memsetw':
> include/linux/vt_buffer.h:34:2: error: implicit declaration of function 'memset16' [-Werror=implicit-function-declaration]
> include/linux/vt_buffer.h: In function 'scr_memcpyw':
> include/linux/vt_buffer.h:47:2: error: implicit declaration of function 'memcpy' [-Werror=implicit-function-declaration]
> include/linux/vt_buffer.h: In function 'scr_memmovew':
> include/linux/vt_buffer.h:66:2: error: implicit declaration of function 'memmove' [-Werror=implicit-function-declaration]
> In file included from include/linux/string.h:18:0,

This?

--- a/include/linux/vt_buffer.h~vga-optimise-console-scrolling-fix
+++ a/include/linux/vt_buffer.h
@@ -13,6 +13,7 @@
 #ifndef _LINUX_VT_BUFFER_H_
 #define _LINUX_VT_BUFFER_H_
 
+#include <linux/string.h>
 
 #if defined(CONFIG_VGA_CONSOLE) || defined(CONFIG_MDA_CONSOLE)
 #include <asm/vga.h>
_
