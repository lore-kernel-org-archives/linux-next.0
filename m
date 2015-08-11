From: Vitaly Kuznetsov <vkuznets@redhat.com>
Subject: [PATCH] x86: fix build in !CONFIG_KEXEC_CORE case
Date: Tue, 11 Aug 2015 15:35:35 +0200
Message-ID: <1439300135-10698-1-git-send-email-vkuznets@redhat.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: x86@kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org, Greg KH <gregkh@linuxfoundation.org>, "K. Y. Srinivasan" <kys@microsoft.com>, Jim Davis <jim.epost@gmail.com>, linux-next <linux-next@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Recent changes in Hyper-V driver ("Drivers: hv: vmbus: add special crash
handler") broke the build when CONFIG_KEXEC_CORE is not set. These
changes, however, only reveal the previously existent issue: when
CONFIG_KEXEC_CORE is not defined kernel/kexec.c is not being included in
the build and native_machine_crash_shutdown() defined in asm/reboot.h has
no implementation.

Reported-by: Jim Davis <jim.epost@gmail.com>
Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
---
 arch/x86/include/asm/reboot.h | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/x86/include/asm/reboot.h b/arch/x86/include/asm/reboot.h
index a82c4f1..a6c1124 100644
--- a/arch/x86/include/asm/reboot.h
+++ b/arch/x86/include/asm/reboot.h
@@ -16,8 +16,15 @@ struct machine_ops {
 
 extern struct machine_ops machine_ops;
 
-void native_machine_crash_shutdown(struct pt_regs *regs);
 void native_machine_shutdown(void);
+#ifdef CONFIG_KEXEC_CORE
+void native_machine_crash_shutdown(struct pt_regs *regs);
+#else
+static inline void native_machine_crash_shutdown(struct pt_regs *regs)
+{
+	native_machine_shutdown();
+}
+#endif
 void __noreturn machine_real_restart(unsigned int type);
 /* These must match dispatch in arch/x86/realmore/rm/reboot.S */
 #define MRR_BIOS	0
-- 
2.4.3
