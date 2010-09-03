From: Wu Fengguang <fengguang.wu@intel.com>
Subject: Re: linux-next: build warning after merge of the tip tree
Date: Fri, 3 Sep 2010 17:04:07 +0800
Message-ID: <20100903090407.GA19771@localhost>
References: <20100903121023.54c40e73.sfr@canb.auug.org.au>
 <20100903121201.336c4ba8.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20100903121201.336c4ba8.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Haicheng Li <haicheng.li@linux.intel.com>, Andi Kleen <ak@linux.intel.com>
List-Id: linux-next.vger.kernel.org

On Fri, Sep 03, 2010 at 10:12:01AM +0800, Stephen Rothwell wrote:
> On Fri, 3 Sep 2010 12:10:23 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > After merging the tip tree, today's linux-next build (x86_64 allmodconfig)
> > produced this warning:
> > 
> > arch/x86/mm/init_64.c: In function 'kernel_physical_mapping_init':
> > arch/x86/mm/init_64.c:601: warning: 'addr' may be used uninitialized in this function
> > 
> > The code does look suspicious ... 'addr' gets declared and then passed to
> > a function, but is not set anywhere ...
> 
> Forgot to say:
> 
> Introduced by commit 9b861528a8012e7bc4d1f7bae07395b225331477 ("x86-64,
> mem: Update all PGDs for direct mapping and vmemmap mapping changes").


The original patch has the following line, however get lost some time
later:

        http://www.spinics.net/lists/linux-mm/msg08152.html

===
x86, mm: fix uninitialized addr in kernel_physical_mapping_init()

This re-adds the lost chunk in commit 9b861528a80.

CC: Haicheng Li <haicheng.li@linux.intel.com>
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Wu Fengguang <fengguang.wu@intel.com>
---
diff --git a/arch/x86/mm/init_64.c b/arch/x86/mm/init_64.c
index 64e7bc2..74f0f35 100644
--- a/arch/x86/mm/init_64.c
+++ b/arch/x86/mm/init_64.c
@@ -570,6 +570,7 @@ kernel_physical_mapping_init(unsigned long start,
 
 	start = (unsigned long)__va(start);
 	end = (unsigned long)__va(end);
+	addr = start;
 
 	for (; start < end; start = next) {
 		pgd_t *pgd = pgd_offset_k(start);
