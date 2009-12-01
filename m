From: Masami Hiramatsu <mhiramat@redhat.com>
Subject: [PATCH -next] [Cleanup] x86: Fix comments of register/stack access 	functions
Date: Mon, 30 Nov 2009 19:02:22 -0500
Message-ID: <20091201000222.7669.7477.stgit@harusame>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <systemtap-return-14503-gls-systemtap=m.gmane.org@sourceware.org>
List-Unsubscribe: <mailto:systemtap-unsubscribe-gls-systemtap=m.gmane.org@sourceware.org>
List-Subscribe: <mailto:systemtap-subscribe@sourceware.org>
List-Post: <mailto:systemtap@sourceware.org>
List-Help: <mailto:systemtap-help@sourceware.org>, <http://sourceware.org/lists.html#faqs>
Sender: systemtap-owner@sourceware.org
To: linux-next@vger.kernel.org
Cc: lkml <linux-kernel@vger.kernel.org>, systemtap <systemtap@sources.redhat.com>, DLE <dle-develop@lists.sourceforge.net>, Wenji Huang <wenji.huang@oracle.com>, Mahesh J Salgaonkar <mahesh@linux.vnet.ibm.com>, Masami Hiramatsu <mhiramat@redhat.com>
List-Id: linux-next.vger.kernel.org

Fix typos and some redundant comments of register/stack access functions
in asm/ptrace.h.

Signed-off-by: Masami Hiramatsu <mhiramat@redhat.com>
Suggested-by: Wenji Huang <wenji.huang@oracle.com>
---

 arch/x86/include/asm/ptrace.h |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/x86/include/asm/ptrace.h b/arch/x86/include/asm/ptrace.h
index a3d49dd..3d11fd0 100644
--- a/arch/x86/include/asm/ptrace.h
+++ b/arch/x86/include/asm/ptrace.h
@@ -227,8 +227,8 @@ extern const char *regs_query_register_name(unsigned int offset);
  * @regs:	pt_regs from which register value is gotten.
  * @offset:	offset number of the register.
  *
- * regs_get_register returns the value of a register whose offset from @regs
- * is @offset. The @offset is the offset of the register in struct pt_regs.
+ * regs_get_register returns the value of a register. The @offset is the
+ * offset of the register in struct pt_regs address which specified by @regs.
  * If @offset is bigger than MAX_REG_OFFSET, this returns 0.
  */
 static inline unsigned long regs_get_register(struct pt_regs *regs,
@@ -244,7 +244,7 @@ static inline unsigned long regs_get_register(struct pt_regs *regs,
  * @regs:	pt_regs which contains kernel stack pointer.
  * @addr:	address which is checked.
  *
- * regs_within_kenel_stack() checks @addr is within the kernel stack page(s).
+ * regs_within_kernel_stack() checks @addr is within the kernel stack page(s).
  * If @addr is within the kernel stack, it returns true. If not, returns false.
  */
 static inline int regs_within_kernel_stack(struct pt_regs *regs,
@@ -260,7 +260,7 @@ static inline int regs_within_kernel_stack(struct pt_regs *regs,
  * @n:		stack entry number.
  *
  * regs_get_kernel_stack_nth() returns @n th entry of the kernel stack which
- * is specifined by @regs. If the @n th entry is NOT in the kernel stack,
+ * is specified by @regs. If the @n th entry is NOT in the kernel stack,
  * this returns 0.
  */
 static inline unsigned long regs_get_kernel_stack_nth(struct pt_regs *regs,


-- 
Masami Hiramatsu

Software Engineer
Hitachi Computer Products (America), Inc.
Software Solutions Division

e-mail: mhiramat@redhat.com
