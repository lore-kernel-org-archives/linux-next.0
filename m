From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the kbuild tree
Date: Thu, 15 Sep 2016 16:08:39 +1000
Message-ID: <20160915160839.037798db@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Michal Marek <mmarek@suse.cz>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>, Nicholas Piggin <npiggin@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>, linux-kbuild@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Hi all,

After merging the dax-misc tree, today's linux-next build (powerpc
ppc44x_defconfig) failed like this:

arch/powerpc/kernel/built-in.o: In function `__ksymtab_clear_pages':
(___ksymtab+clear_pages+0x0): undefined reference to `clear_pages'

Caused by commit

  9445aa1a3062 ("ppc: move exports to definitions")

I applied the following fix patch:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 15 Sep 2016 16:04:12 +1000
Subject: [PATCH] ppc: there is no clear_pages to export

Fixes: 9445aa1a3062 ("ppc: move exports to definitions")
Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 arch/powerpc/kernel/misc_32.S | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/powerpc/kernel/misc_32.S b/arch/powerpc/kernel/misc_32.S
index ea26a9181586..f5156105c5f3 100644
--- a/arch/powerpc/kernel/misc_32.S
+++ b/arch/powerpc/kernel/misc_32.S
@@ -453,7 +453,6 @@ END_FTR_SECTION_IFSET(CPU_FTR_COHERENT_ICACHE)
 	stw	r7,8(r3);	\
 	stw	r8,12(r3);	\
 	stwu	r9,16(r3)
-EXPORT_SYMBOL(clear_pages)
 
 _GLOBAL(copy_page)
 	addi	r3,r3,-4
-- 
2.8.1

-- 
Cheers,
Stephen Rothwell
