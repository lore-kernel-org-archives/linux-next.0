From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the nvdimm tree
Date: Sun, 27 Mar 2016 20:50:18 +1100
Message-ID: <20160327205018.6a587705@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Dan Williams <dan.j.williams@intel.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Ross Zwisler <ross.zwisler@linux.intel.com>, Andrew Morton <akpm@linux-foundation.org>, Linus Torvalds <torvalds@linux-foundation.org>, Borislav Petkov <bp@alien8.de>, Ingo Molnar <mingo@kernel.org>, Tony Luck <tony.luck@intel.com>, Thomas Gleixner <tglx@linutronix.de>, Andy Lutomirski <luto@amacapital.net>, Peter Zijlstra <peterz@infradead.org>
List-Id: linux-next.vger.kernel.org

Hi Dan,

After merging the nvdimm tree, today's linux-next build (powerpc
allyesconfig) failed like this:

In file included from /home/sfr/next/next/fs/dax.c:28:0:
include/linux/pmem.h: In function 'memcpy_from_pmem':
include/linux/pmem.h:79:9: error: implicit declaration of function 'arch_memcpy_from_pmem' [-Werror=implicit-function-declaration]
  return arch_memcpy_from_pmem(dst, src, size);
         ^

Caused by commit

  a2b056ea291d ("x86, pmem: use memcpy_mcsafe() for memcpy_from_pmem()")

I used the nvdimm tree from next-20160324 for today.

-- 
Cheers,
Stephen Rothwell
