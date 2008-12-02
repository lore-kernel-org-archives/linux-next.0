From: Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: linux-next: sparc tree build failure
Date: Tue, 2 Dec 2008 21:52:25 +1030
Message-ID: <200812022152.25989.rusty@rustcorp.com.au>
References: <20081202172413.f14fe387.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([203.10.76.45]:57077 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752863AbYLBLWb (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 2 Dec 2008 06:22:31 -0500
In-Reply-To: <20081202172413.f14fe387.sfr@canb.auug.org.au>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "David S. Miller" <davem@davemloft.net>, linux-next@vger.kernel.org

On Tuesday 02 December 2008 16:54:13 Stephen Rothwell wrote:
> Hi Dave,
>
> Today's linux-next build (sparc defconfig) failed like this:
>
> lib/find_next_bit.c: In function 'find_last_bit':
> lib/find_next_bit.c:183: error: implicit declaration of function '__fls'

Thanks Stephen... that's a surprise.

Dave, I think this is a sparc issue.

sparc: asm/bitops.h should define __fls

bitops_64.h includes the generic one; pretty sure 32 should too.

(Found by using __fls in generic code and breaking sparc defconfig build:
 thanks Stephen and linux-next!)

Signed-off-by: Rusty Russell <rusty@rustcorp.com.au>

diff --git a/arch/sparc/include/asm/bitops_32.h b/arch/sparc/include/asm/bitops_32.h
--- a/arch/sparc/include/asm/bitops_32.h
+++ b/arch/sparc/include/asm/bitops_32.h
@@ -98,6 +98,7 @@ static inline void change_bit(unsigned l
 #include <asm-generic/bitops/sched.h>
 #include <asm-generic/bitops/ffs.h>
 #include <asm-generic/bitops/fls.h>
+#include <asm-generic/bitops/__fls.h>
 #include <asm-generic/bitops/fls64.h>
 #include <asm-generic/bitops/hweight.h>
 #include <asm-generic/bitops/lock.h>
