From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: [PATCH 3/4] mm/hmm: fix Kconfig to have valid usage of "select"
Date: Wed, 12 Apr 2017 20:30:13 -0400
Message-ID: <20170413003014.4052-4-paul.gortmaker@windriver.com>
References: <20170413003014.4052-1-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170413003014.4052-1-paul.gortmaker@windriver.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: linux-next@vger.kernel.org, Paul Gortmaker <paul.gortmaker@windriver.com>, =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>, Evgeny Baskakov <ebaskakov@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, Mark Hairgrove <mhairgrove@nvidia.com>, Sherry Cheung <SCheung@nvidia.com>, Subhash Gutti <sgutti@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>
List-Id: linux-next.vger.kernel.org

The use of "select" like this will most likely cause new
randconfig warnings and failures because the child categories
get chosen, and force select the parent, even though the parent
dependencies are not met.  For further details, see "select"
in Documentation/kbuild/kconfig-language.txt file.

But we also don't want to be duplicating the main feature dependencies
across all the child options, which is annoying when the dependencies
change.  So we use the typical ARCH_HAS as a dependency collector,
and the existing HMM option is now dependency free, and hence a
valid option for use with "select".  It retains its original purpose
which is to be set if and only if any of the child options are set.

Finally, the existing help text is currently orphaned, since the
HMM bool doesn't have a following short description, and hence it
will never be offered to the end user.  So delete it, but ensure
the two child options point to the Documentation/vm/hmm.txt file.

Cc: Jérôme Glisse <jglisse@redhat.com>
Cc: Evgeny Baskakov <ebaskakov@nvidia.com>
Cc: John Hubbard <jhubbard@nvidia.com>
Cc: Mark Hairgrove <mhairgrove@nvidia.com>
Cc: Sherry Cheung <SCheung@nvidia.com>
Cc: Subhash Gutti <sgutti@nvidia.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---
 mm/Kconfig | 22 ++++++++--------------
 1 file changed, 8 insertions(+), 14 deletions(-)

diff --git a/mm/Kconfig b/mm/Kconfig
index 43d000e44424..3e9c31bf9aaa 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -289,23 +289,17 @@ config MIGRATION
 config ARCH_ENABLE_HUGEPAGE_MIGRATION
 	bool
 
-config HMM
+config ARCH_HAS_HMM
 	bool
+	default y
 	depends on MMU && 64BIT
-	help
-	  HMM provides a set of helpers to share a virtual address
-	  space between CPU and a device, so that the device can access any valid
-	  address of the process (while still obeying memory protection). HMM also
-	  provides helpers to migrate process memory to device memory, and back.
-	  Each set of functionality (address space mirroring, and migration to and
-	  from device memory) can be used independently of the other.
 
-	  This is primarily useful for devices like GPU, for GPGPU compute workload,
-	  with APIs such as OpenCL or CUDA. See Documentation/vm/hmm.txt.
+config HMM
+	bool
 
 config HMM_MIRROR
 	bool "HMM mirror CPU page table into a device page table"
-	depends on MMU && 64BIT
+	depends on ARCH_HAS_HMM
 	select HMM
 	select MMU_NOTIFIER
 	help
@@ -313,16 +307,16 @@ config HMM_MIRROR
 	  process into a device page table. Here, mirror means "keep synchronized".
 	  Prerequisites: the device must provide the ability to write-protect its
 	  page tables (at PAGE_SIZE granularity), and must be able to recover from
-	  the resulting potential page faults.
+	  the resulting potential page faults.  See Documentation/vm/hmm.txt.
 
 config HMM_DEVMEM
 	bool "HMM device memory helpers (to leverage ZONE_DEVICE)"
-	depends on MMU && 64BIT
+	depends on ARCH_HAS_HMM
 	select HMM
 	help
 	  HMM devmem is a set of helper routines to leverage the ZONE_DEVICE
 	  feature. This is just to avoid having device drivers to replicating a lot
-	  of boiler plate code.
+	  of boiler plate code.  See Documentation/vm/hmm.txt.
 
 config PHYS_ADDR_T_64BIT
 	def_bool 64BIT || ARCH_PHYS_ADDR_T_64BIT
-- 
2.11.0
