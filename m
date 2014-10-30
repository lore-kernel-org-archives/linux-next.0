From: Michal Hocko <mhocko@suse.cz>
Subject: [PATCH] mm-cma-make-kmemleak-ignore-cma-regions-fix
Date: Thu, 30 Oct 2014 09:47:04 +0100
Message-ID: <1414658824-16480-1-git-send-email-mhocko@suse.cz>
References: <54515a25.46WrYSce5BExT3V4%akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <owner-linux-mm@kvack.org>
In-Reply-To: <54515a25.46WrYSce5BExT3V4%akpm@linux-foundation.org>
Sender: owner-linux-mm@kvack.org
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Thierry Reding <treding@nvidia.com>, Michal Nazarewicz <mina86@mina86.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Joonsoo Kim <iamjoonsoo.kim@lge.com>, "Aneesh Kumar K.V" <aneesh.kumar@linux.vnet.ibm.com>, Catalin Marinas <catalin.marinas@arm.com>, mm-commits@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-next@vger.kernel.org, sfr@canb.auug.org.au
List-Id: linux-next.vger.kernel.org

include linux/io.h to get phys_to_virt declaration and fix the following
compile error:
mm/cma.c:288:4: error: implicit declaration of function =E2=80=98phys_to_=
virt=E2=80=99 [-Werror=3Dimplicit-function-declaration]
    kmemleak_ignore(phys_to_virt(addr));

Signed-off-by: Michal Hocko <mhocko@suse.cz>
---
 mm/cma.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/mm/cma.c b/mm/cma.c
index 9bc687a20495..daec407d1057 100644
--- a/mm/cma.c
+++ b/mm/cma.c
@@ -33,6 +33,7 @@
 #include <linux/log2.h>
 #include <linux/cma.h>
 #include <linux/highmem.h>
+#include <linux/io.h>
=20
 struct cma {
 	unsigned long	base_pfn;
--=20
2.1.1

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=3Dmailto:"dont@kvack.org"> email@kvack.org </a>
