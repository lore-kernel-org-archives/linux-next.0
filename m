From: tip-bot for Joerg Roedel <tipbot@zytor.com>
Subject: [tip:x86/pti] x86/relocs: Add __end_rodata_aligned to S_REL
Date: Thu, 9 Aug 2018 11:45:57 -0700
Message-ID: <tip-a29dba161ad1a01bbfbc80aa184b089ddd169a4e@git.kernel.org>
References: <20180809094449.ddmnrkz7qkvo3j2x@suse.de>
Reply-To: linux-kernel@vger.kernel.org, mingo@kernel.org,
          peterz@infradead.org, jroedel@suse.de, hpa@zytor.com,
          sedat.dilek@gmail.com, sfr@canb.auug.org.au, tglx@linutronix.de,
          linux-next@vger.kernel.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180809094449.ddmnrkz7qkvo3j2x@suse.de>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Cc: tglx@linutronix.de, sfr@canb.auug.org.au, linux-next@vger.kernel.org, sedat.dilek@gmail.com, hpa@zytor.com, jroedel@suse.de, peterz@infradead.org, mingo@kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Commit-ID:  a29dba161ad1a01bbfbc80aa184b089ddd169a4e
Gitweb:     https://git.kernel.org/tip/a29dba161ad1a01bbfbc80aa184b089ddd169a4e
Author:     Joerg Roedel <jroedel@suse.de>
AuthorDate: Thu, 9 Aug 2018 11:44:49 +0200
Committer:  Thomas Gleixner <tglx@linutronix.de>
CommitDate: Thu, 9 Aug 2018 20:42:07 +0200

x86/relocs: Add __end_rodata_aligned to S_REL

This new symbol needs to be in the workaround-list for buggy
binutils, otherwise the build with gcc-4.6 fails.

Fixes: 39d668e04eda ('x86/mm/pti: Make pti_clone_kernel_text() compile on 32 bit')
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Joerg Roedel <jroedel@suse.de>
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Tested-by: Sedat Dilek <sedat.dilek@gmail.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>
Link: https://lkml.kernel.org/r/20180809094449.ddmnrkz7qkvo3j2x@suse.de

---
 arch/x86/tools/relocs.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/x86/tools/relocs.c b/arch/x86/tools/relocs.c
index 220e97841e49..3a6c8ebc8032 100644
--- a/arch/x86/tools/relocs.c
+++ b/arch/x86/tools/relocs.c
@@ -67,6 +67,7 @@ static const char * const sym_regex_kernel[S_NSYMTYPES] = {
 	"__tracedata_(start|end)|"
 	"__(start|stop)_notes|"
 	"__end_rodata|"
+	"__end_rodata_aligned|"
 	"__initramfs_start|"
 	"(jiffies|jiffies_64)|"
 #if ELF_BITS == 64
