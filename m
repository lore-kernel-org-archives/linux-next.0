From: Josh Poimboeuf <jpoimboe@redhat.com>
Subject: Re: linux-next: build warning after merge of the akpm-current tree
Date: Fri, 29 Apr 2016 08:32:19 -0500
Message-ID: <20160429133219.bhu3picl6jwxdedj@treble>
References: <20160429164543.039df436@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:38731 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753022AbcD2NcV (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 29 Apr 2016 09:32:21 -0400
Content-Disposition: inline
In-Reply-To: <20160429164543.039df436@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Quinn Tran <quinn.tran@qlogic.com>

On Fri, Apr 29, 2016 at 04:45:43PM +1000, Stephen Rothwell wrote:
> Hi Andrew,
> 
> After merging the akpm-current tree, today's linux-next build (x86_64
> allmodconfig) produced this warning:
> 
> drivers/scsi/ipr.c: In function 'ipr_show_device_id':
> drivers/scsi/ipr.c:4462:34: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 4 has type 'long unsigned int' [-Wformat=]
>    len = snprintf(buf, PAGE_SIZE, "0x%llx\n", be64_to_cpu(res->dev_id));
>                                   ^
> 
> Lots and lots like this :-(
> 
> Probably introduced by commit
> 
>   eef17fb79096 ("byteswap: try to avoid __builtin_constant_p gcc bug")
> 
> I guess __builtin_bswap64() has type "unsigned long int" :-(

Hm, I suppose this is cross-compiled on a powerpc host?

We probably need to add a (__u64) cast to the return value of
__builtin_bswap64(), like:

diff --git a/include/uapi/linux/swab.h b/include/uapi/linux/swab.h
index de56fd5..d737804 100644
--- a/include/uapi/linux/swab.h
+++ b/include/uapi/linux/swab.h
@@ -123,7 +123,7 @@ static inline __attribute_const__ __u32 __fswahb32(__u32 val)
  * @x: value to byteswap
  */
 #ifdef __HAVE_BUILTIN_BSWAP64__
-#define __swab64(x) __builtin_bswap64((__u64)(x))
+#define __swab64(x) (__u64)__builtin_bswap64((__u64)(x))
 #else
 #define __swab64(x)				\
 	(__builtin_constant_p((__u64)(x)) ?	\

-- 
Josh
