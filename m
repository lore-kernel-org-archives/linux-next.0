From: Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH] x86/build: Build VSMP support only if selected
Date: Thu, 1 Nov 2018 10:36:51 +0100 (CET)
Message-ID: <alpine.DEB.2.21.1811011032190.1642@nanos.tec.linutronix.de>
References: <20181030230905.xHZmM%akpm@linux-foundation.org> <9e14d183-55a4-8299-7a18-0404e50bf004@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <9e14d183-55a4-8299-7a18-0404e50bf004@infradead.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, broonie@kernel.org, mhocko@suse.cz, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, LKML <linux-kernel@vger.kernel.org>, mm-commits@vger.kernel.org, Ravikiran Thirumalai <kiran@scalemp.com>, Shai Fultheim <shai@scalemp.com>, X86 ML <x86@kernel.org>
List-Id: linux-next.vger.kernel.org

VSMP support is built even if CONFIG_X86_VSMP is not set. This leads to a build
breakage when CONFIG_PCI is disabled as well.

Build VSMP code only when selected.

Reported-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>

---
diff --git a/arch/x86/include/asm/setup.h b/arch/x86/include/asm/setup.h
index ae13bc974416..b6b911c4c7f3 100644
--- a/arch/x86/include/asm/setup.h
+++ b/arch/x86/include/asm/setup.h
@@ -33,7 +33,7 @@
 extern u64 relocated_ramdisk;
 
 /* Interrupt control for vSMPowered x86_64 systems */
-#ifdef CONFIG_X86_64
+#if defined(CONFIG_X86_64) && defined(CONFIG_X86_VSMP)
 void vsmp_init(void);
 #else
 static inline void vsmp_init(void) { }
diff --git a/arch/x86/kernel/Makefile b/arch/x86/kernel/Makefile
index 8824d01c0c35..647ce52b17d5 100644
--- a/arch/x86/kernel/Makefile
+++ b/arch/x86/kernel/Makefile
@@ -148,5 +148,5 @@ ifeq ($(CONFIG_X86_64),y)
 	obj-$(CONFIG_CALGARY_IOMMU)	+= pci-calgary_64.o tce_64.o
 
 	obj-$(CONFIG_MMCONF_FAM10H)	+= mmconf-fam10h_64.o
-	obj-y				+= vsmp_64.o
+	obj-$(CONFIG_X86_VSMP)		+= vsmp_64.o
 endif
