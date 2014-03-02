From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH -next] cris: cpuinfo_op should depend on CONFIG_PROC_FS
Date: Sun,  2 Mar 2014 11:34:39 +0100
Message-ID: <1393756479-12530-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mikael Starvik <starvik@axis.com>, Jesper Nilsson <jesper.nilsson@axis.com>
Cc: linux-cris-kernel@axis.com, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>
List-Id: linux-next.vger.kernel.org

Now allnoconfig started disabling CONFIG_PROC_FS:

    arch/cris/kernel/built-in.o:(.rodata+0xc): undefined reference to `show_cpuinfo'
    make: *** [vmlinux] Error 1

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
http://kisskb.ellerman.id.au/kisskb/buildresult/10665698/

 arch/cris/kernel/setup.c |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/cris/kernel/setup.c b/arch/cris/kernel/setup.c
index 32c3d248868e..905b70ea9939 100644
--- a/arch/cris/kernel/setup.c
+++ b/arch/cris/kernel/setup.c
@@ -165,6 +165,7 @@ void __init setup_arch(char **cmdline_p)
 	strcpy(init_utsname()->machine, cris_machine_name);
 }
 
+#ifdef CONFIG_PROC_FS
 static void *c_start(struct seq_file *m, loff_t *pos)
 {
 	return *pos < nr_cpu_ids ? (void *)(int)(*pos + 1) : NULL;
@@ -188,6 +189,7 @@ const struct seq_operations cpuinfo_op = {
 	.stop  = c_stop,
 	.show  = show_cpuinfo,
 };
+#endif /* CONFIG_PROC_FS */
 
 static int __init topology_init(void)
 {
-- 
1.7.9.5
