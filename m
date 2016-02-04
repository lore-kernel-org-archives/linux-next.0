From: Benjamin LaHaise <bcrl@kvack.org>
Subject: Re: linux-next: build failure after merge of the aio tree
Date: Thu, 4 Feb 2016 11:01:01 -0500
Message-ID: <20160204160101.GD16315@kvack.org>
References: <20160127134024.0fababf6@canb.auug.org.au> <20160129113056.GP10826@n2100.arm.linux.org.uk> <CAMuHMdUy-cqeN8COO4rdpY-mOH+6gth40wB31-edkj8CO5PFCw@mail.gmail.com> <20160204131959.6695c7bf@canb.auug.org.au> <20160204134142.GA16315@kvack.org> <20160204135056.GE10826@n2100.arm.linux.org.uk> <20160204140822.GB16315@kvack.org> <20160204141253.GF10826@n2100.arm.linux.org.uk> <20160204143204.GC16315@kvack.org> <20160204143907.GG10826@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160204143907.GG10826@n2100.arm.linux.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Geert Uytterhoeven <geert@linux-m68k.org>, Linux-Next <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-next.vger.kernel.org

On Thu, Feb 04, 2016 at 02:39:07PM +0000, Russell King - ARM Linux wrote:
> However, this one should warn:
> 
> int test_wrong(char **v, const char **p)
> { return __get_user(*v, p); }
> 
> Good luck (I think you'll need lots of it to get a working solution)! :)

This works with your test cases on x86-32.  Note that it's only compile + 
link tested at present.

		-ben
-- 
"Thought is the essence of where you are now."

diff --git a/arch/x86/include/asm/uaccess.h b/arch/x86/include/asm/uaccess.h
index 09b1b0a..d8834c2 100644
--- a/arch/x86/include/asm/uaccess.h
+++ b/arch/x86/include/asm/uaccess.h
@@ -326,7 +326,21 @@ do {									\
 } while (0)
 
 #ifdef CONFIG_X86_32
-#define __get_user_asm_u64(x, ptr, retval, errret)	(x) = __get_user_bad()
+#define __get_user_asm_u64(x, addr, err, errret)			\
+	asm volatile(ASM_STAC "\n"					\
+		     "1:	movl %2,%%eax\n"			\
+		     "		movl %3,%%edx\n"			\
+		     "2: " ASM_CLAC "\n"				\
+		     ".section .fixup,\"ax\"\n"				\
+		     "3:	mov %4,%0\n"				\
+		     "	xorl %%eax,%%eax\n"				\
+		     "	xorl %%edx,%%edx\n"				\
+		     "	jmp 2b\n"					\
+		     ".previous\n"					\
+		     _ASM_EXTABLE(1b, 3b)				\
+		     : "=r" (err), "=A"(x)				\
+		     : "m" (__m(addr)), "m" __m(((u32 *)addr) + 1), "i" (errret), "0" (err))
+
 #define __get_user_asm_ex_u64(x, ptr)			(x) = __get_user_bad()
 #else
 #define __get_user_asm_u64(x, ptr, retval, errret) \
