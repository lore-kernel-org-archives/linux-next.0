From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the percpu tree
Date: Wed, 21 Jun 2017 15:20:20 +1000
Message-ID: <20170621152020.47cacaf6@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:34857 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751154AbdFUFUX (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 21 Jun 2017 01:20:23 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@linux-foundation.org>, Ingo Molnar <mingo@elte.hu>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Dennis Zhou <dennisz@fb.com>

Hi all,

After merging the percpu tree, today's linux-next build (arm
multi_v7_defconfig) produced this warning:

In file included from include/linux/kernel.h:13:0,
                 from include/linux/bitmap.h:9,
                 from mm/percpu.c:58:
mm/percpu.c: In function 'pcpu_alloc':
include/linux/printk.h:303:2: warning: 'err' may be used uninitialized in this function [-Wmaybe-uninitialized]
  printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
  ^
mm/percpu.c:864:14: note: 'err' was declared here
  const char *err;
              ^

I am not sure which commit introduced this, although the

	if (is_atomic)
		goto fail;

in pcpu_alloc() looks suspicious.

-- 
Cheers,
Stephen Rothwell
