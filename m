From: Steven Rostedt <rostedt@goodmis.org>
Subject: [PATCH] KVM: Only export kvm_ple_window for x86_64
Date: Mon, 25 Aug 2014 19:10:35 -0400
Message-ID: <20140825191035.59673878@gandalf.local.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Gleb Natapov <gleb@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>, Andrew Morton <akpm@linux-foundation.org>, Jim Davis <jim.epost@gmail.com>, linux-next <linux-next@vger.kernel.org>
List-Id: linux-next.vger.kernel.org


Commit 7b46268d2954 "KVM: trace kvm_ple_window grow/shrink"
Added the tracepoint kvm_ple_window under a #ifdef CONFIG_X86_64 but
left the export for that tracepoint unprotected, which would cause it
to fail to compile when X86_32 is set.

Link: http://lkml.kernel.org/p/20140825172204.769ab4e6@gandalf.local.home

Reported-by: Jim Davis <jim.epost@gmail.com>
tested-by: Jim Davis <jim.epost@gmail.com>
Signed-off-by: Steven Rostedt <rostedt@goodmis.org>
---
 arch/x86/kvm/x86.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index c10408ef9ab1..3da45a3ecaa4 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -7673,4 +7673,6 @@ EXPORT_TRACEPOINT_SYMBOL_GPL(kvm_invlpga);
 EXPORT_TRACEPOINT_SYMBOL_GPL(kvm_skinit);
 EXPORT_TRACEPOINT_SYMBOL_GPL(kvm_nested_intercepts);
 EXPORT_TRACEPOINT_SYMBOL_GPL(kvm_write_tsc_offset);
+#ifdef CONFIG_X86_64
 EXPORT_TRACEPOINT_SYMBOL_GPL(kvm_ple_window);
+#endif
-- 
1.8.1.4
