From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
Date: Mon, 6 Jun 2016 13:22:45 -0700
Message-ID: <20160606132245.721921fdc49586f236ff3177@linux-foundation.org>
References: <20160606140327.09e40ec6@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:37292 "EHLO
	mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751755AbcFFUWq (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 6 Jun 2016 16:22:46 -0400
In-Reply-To: <20160606140327.09e40ec6@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Russell King <rmk+kernel@arm.linux.org.uk>

On Mon, 6 Jun 2016 14:03:27 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> In file included from include/linux/crash_dump.h:5:0,
>                  from arch/powerpc/kernel/crash_dump.c:14:
> include/linux/kexec.h:358:9: note: previous implicit declaration of 'phys_to_virt' was here
>   return phys_to_virt(boot_phys_to_phys(entry));
>          ^
> 
> Caused by commit
> 
>   4382eb9055be ("kexec: allow architectures to override boot mapping")
> 
> Architecture seem to define phys_to_virt() in either asm/io.h or
> asm/memory.h or asm/virtconvert.h or asm/page*.h ... or asm-generic/io.h.
> :-(
> 
> I have reverted that commit for today (and commit c9aaeae038fa ("ARM:
> kexec: fix kexec for Keystone 2")).

Let's see how this gets along.

From: Andrew Morton <akpm@linux-foundation.org>
Subject: kexec-allow-architectures-to-override-boot-mapping-fix

kexec.h needs asm/io.h for phys_to_virt()

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Russell King <rmk+kernel@arm.linux.org.uk>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

--- a/include/linux/kexec.h~kexec-allow-architectures-to-override-boot-mapping-fix
+++ a/include/linux/kexec.h
@@ -14,6 +14,8 @@
 
 #if !defined(__ASSEMBLY__)
 
+#include <asm/io.h>
+
 #include <uapi/linux/kexec.h>
 
 #ifdef CONFIG_KEXEC_CORE
