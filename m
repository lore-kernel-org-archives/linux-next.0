From: Matthew McClintock <msm@freescale.com>
Subject: [PATCH] powerpc/hugepage: Fix missing header file for parse_args
Date: Wed, 15 Feb 2012 17:28:34 -0600
Message-ID: <1329348514-13262-1-git-send-email-msm@freescale.com>
References: <14174.1329347321@neuling.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
In-Reply-To: <14174.1329347321@neuling.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Errors-To: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
Sender: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
To: linuxppc-dev@ozlabs.org
Cc: linux-next@vger.kernel.org
List-Id: linux-next.vger.kernel.org

This seems to fix the following issue:

arch/powerpc/mm/hugetlbpage.c: In function 'reserve_hugetlb_gpages':
arch/powerpc/mm/hugetlbpage.c:313: error: passing argument 5 of 'parse_args' makes integer from pointer without a cast
include/linux/moduleparam.h:317: note: expected 's16' but argument is of type 'int (*)(char *, char *)'
arch/powerpc/mm/hugetlbpage.c:313: error: too few arguments to function 'parse_args'

Signed-off-by: Matthew McClintock <msm@freescale.com>
---
 arch/powerpc/mm/hugetlbpage.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/arch/powerpc/mm/hugetlbpage.c b/arch/powerpc/mm/hugetlbpage.c
index 79c575d..a8b3cc7 100644
--- a/arch/powerpc/mm/hugetlbpage.c
+++ b/arch/powerpc/mm/hugetlbpage.c
@@ -15,6 +15,7 @@
 #include <linux/of_fdt.h>
 #include <linux/memblock.h>
 #include <linux/bootmem.h>
+#include <linux/moduleparam.h>
 #include <asm/pgtable.h>
 #include <asm/pgalloc.h>
 #include <asm/tlb.h>
-- 
1.7.6.1
