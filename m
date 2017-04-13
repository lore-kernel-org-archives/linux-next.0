From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: [PATCH 4/4] mm/hmm: exclude 64 bit arch that explicitly fail to work.
Date: Wed, 12 Apr 2017 20:30:14 -0400
Message-ID: <20170413003014.4052-5-paul.gortmaker@windriver.com>
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

On sparc64, we see:

  mm/hmm.c: In function 'hmm_vma_walk_pmd':
  mm/hmm.c:371:53: error: macro "pte_index" requires 2 arguments, but only 1 given
  mm/hmm.c:371:39: error: 'pte_index' undeclared (first use in this function)

...and on MIPS 64, we see:

  mm/hmm.c:57:22: error: field 'mmu_notifier' has incomplete type
  mm/hmm.c: In function 'hmm_register':
  mm/hmm.c:98:2: error: implicit declaration of function '__mmu_notifier_register' [-Werror=implicit-function-declaration]
  mm/hmm.c:111:3: error: implicit declaration of function 'mmu_notifier_unregister' [-Werror=implicit-function-declaration]

...and on Alpha, we see:

  mm/hmm.c: In function 'hmm_vma_walk_pmd':
  mm/hmm.c:371:4: error: implicit declaration of function 'pmd_pfn'
  mm/hmm.c:371:4: error: implicit declaration of function 'pte_index'

...and on PaRISC 64 we see:

  include/linux/hmm.h:405:7: warning: 'struct migrate_vma_ops' declared inside parameter list
  include/linux/hmm.h:405:7: warning: its scope is only this definition or declaration, which is probably not what you want
  mm/hmm.c: In function 'hmm_vma_walk_pmd':
  mm/hmm.c:371:4: error: implicit declaration of function 'pmd_pfn'
  [...]

Set the dependency to the three arch that currently seem to build
without issue -- ARM_64, X86_64 and S390.

Since ia64 and ppc64 don't set CONFIG_64BIT, they were already
excluded by the original dependency.

The failing arch can be re-added as demand dictates, if/when they
have been validated to build and function.

Cc: Jérôme Glisse <jglisse@redhat.com>
Cc: Evgeny Baskakov <ebaskakov@nvidia.com>
Cc: John Hubbard <jhubbard@nvidia.com>
Cc: Mark Hairgrove <mhairgrove@nvidia.com>
Cc: Sherry Cheung <SCheung@nvidia.com>
Cc: Subhash Gutti <sgutti@nvidia.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---
 mm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/mm/Kconfig b/mm/Kconfig
index 3e9c31bf9aaa..6c27d2003a63 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -293,6 +293,7 @@ config ARCH_HAS_HMM
 	bool
 	default y
 	depends on MMU && 64BIT
+	depends on ARM64 || X86_64 || S390
 
 config HMM
 	bool
-- 
2.11.0
