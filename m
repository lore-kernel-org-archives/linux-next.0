From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the kspp tree
Date: Fri, 16 Jun 2017 11:30:32 +1000
Message-ID: <20170616113032.306720bf@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:55367 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751641AbdFPBaf (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 15 Jun 2017 21:30:35 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Kees Cook <keescook@google.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Daniel Micay <danielmicay@gmail.com>, Andrew Morton <akpm@linux-foundation.org>

Hi Kees,

After merging the kspp tree, today's linux-next build (x86_64
allmodconfig) failed like this:

In file included from include/linux/bitmap.h:8:0,
                 from include/linux/cpumask.h:11,
                 from arch/x86/include/asm/cpumask.h:4,
                 from arch/x86/include/asm/msr.h:10,
                 from arch/x86/include/asm/processor.h:20,
                 from arch/x86/include/asm/cpufeature.h:4,
                 from arch/x86/include/asm/thread_info.h:52,
                 from include/linux/thread_info.h:37,
                 from arch/x86/include/asm/preempt.h:6,
                 from include/linux/preempt.h:80,
                 from include/linux/spinlock.h:50,
                 from include/linux/mmzone.h:7,
                 from include/linux/gfp.h:5,
                 from include/linux/slab.h:14,
                 from drivers/scsi/csiostor/csio_lnode.c:37:
In function 'memcpy',
    inlined from 'csio_append_attrib' at drivers/scsi/csiostor/csio_lnode.c:248:2,
    inlined from 'csio_ln_fdmi_dprt_cbfn' at drivers/scsi/csiostor/csio_lnode.c:471:2:
include/linux/string.h:309:4: error: call to '__read_overflow2' declared with attribute error: detected read beyond size of object passed as 2nd parameter
    __read_overflow2();
    ^
In function 'memcpy',
    inlined from 'csio_append_attrib' at drivers/scsi/csiostor/csio_lnode.c:248:2,
    inlined from 'csio_ln_fdmi_rhba_cbfn' at drivers/scsi/csiostor/csio_lnode.c:337:2:
include/linux/string.h:309:4: error: call to '__read_overflow2' declared with attribute error: detected read beyond size of object passed as 2nd parameter
    __read_overflow2();
    ^

Caused by commit

  b90d6eba50d7 ("include/linux/string.h: add the option of fortified string.h functions")

I have reverted that commit for today.

-- 
Cheers,
Stephen Rothwell
