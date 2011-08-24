From: Cong Wang <amwang@redhat.com>
Subject: [Patch] numa: introduce CONFIG_NUMA_SYSFS for drivers/base/node.c
Date: Wed, 24 Aug 2011 11:34:45 +0800
Message-ID: <4E547155.8090709@redhat.com>
References: <20110804145834.3b1d92a9eeb8357deb84bf83@canb.auug.org.au>	<20110804152211.ea10e3e7.rdunlap@xenotime.net> <20110823143912.0691d442.akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------080905050501060202020708"
Return-path: <owner-linux-mm@kvack.org>
In-Reply-To: <20110823143912.0691d442.akpm@linux-foundation.org>
Sender: owner-linux-mm@kvack.org
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Randy Dunlap <rdunlap@xenotime.net>, Stephen Rothwell <sfr@canb.auug.org.au>, gregkh@suse.de, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, linux-mm@kvack.org
List-Id: linux-next.vger.kernel.org

This is a multi-part message in MIME format.
--------------080905050501060202020708
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi, Andrew,

Do you think my patch below is better?

Thanks!

------------->

--------------080905050501060202020708
Content-Type: text/plain;
 name="numa-depends-on-sysfs.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="numa-depends-on-sysfs.diff"

Introduce a new Kconfig CONFIG_NUMA_SYSFS for drivers/base/node.c
which just provides sysfs interface, so that when we select
CONFIG_NUMA, we don't have to enable the sysfs interface too.

This by the way fixes a randconfig build error when NUMA && !SYSFS.

Signed-off-by: WANG Cong <amwang@redhat.com>

---
diff --git a/drivers/base/Makefile b/drivers/base/Makefile
index 99a375a..e382338 100644
--- a/drivers/base/Makefile
+++ b/drivers/base/Makefile
@@ -10,7 +10,7 @@ obj-$(CONFIG_HAS_DMA)	+= dma-mapping.o
 obj-$(CONFIG_HAVE_GENERIC_DMA_COHERENT) += dma-coherent.o
 obj-$(CONFIG_ISA)	+= isa.o
 obj-$(CONFIG_FW_LOADER)	+= firmware_class.o
-obj-$(CONFIG_NUMA)	+= node.o
+obj-$(CONFIG_NUMA_SYSFS)	+= node.o
 obj-$(CONFIG_MEMORY_HOTPLUG_SPARSE) += memory.o
 obj-$(CONFIG_SMP)	+= topology.o
 ifeq ($(CONFIG_SYSFS),y)
diff --git a/mm/Kconfig b/mm/Kconfig
index f2f1ca1..77345e7 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -340,6 +340,16 @@ choice
 	  benefit.
 endchoice
 
+config NUMA_SYSFS
+	bool "Enable NUMA sysfs interface for user-space"
+	depends on NUMA
+	depends on SYSFS
+	default y
+	help
+	  This enables NUMA sysfs interface, /sys/devices/system/node/*
+	  files, for user-space tools, like numactl. If you have enabled
+	  NUMA, probably you also need this one.
+
 #
 # UP and nommu archs use km based percpu allocator
 #

--------------080905050501060202020708--

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Fight unfair telecom internet charges in Canada: sign http://stopthemeter.ca/
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>
