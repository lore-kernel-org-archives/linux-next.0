From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: [PATCH 08/11] frv: fix warnings in mb93090-mb00/pci-dma.c about implicit EXPORT_SYMBOL
Date: Sun,  1 Apr 2012 16:38:44 -0400
Message-ID: <1333312727-11428-9-git-send-email-paul.gortmaker@windriver.com>
References: <1333312727-11428-1-git-send-email-paul.gortmaker@windriver.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1333312727-11428-1-git-send-email-paul.gortmaker@windriver.com>
Sender: linux-kernel-owner@vger.kernel.org
To: dhowells@redhat.com
Cc: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, Paul Gortmaker <paul.gortmaker@windriver.com>
List-Id: linux-next.vger.kernel.org

To fix:

arch/frv/mb93090-mb00/pci-dma.c:31:1: warning: data definition has no type or storage class [enabled by default]
arch/frv/mb93090-mb00/pci-dma.c:31:1: warning: type defaults to 'int' in declaration of 'EXPORT_SYMBOL' [-Wimplicit-int]
arch/frv/mb93090-mb00/pci-dma.c:31:1: warning: parameter names (without types) in function declaration [enabled by default]
arch/frv/mb93090-mb00/pci-dma.c:38:1: warning: data definition has no type or storage class [enabled by default]

Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---
 arch/frv/mb93090-mb00/pci-dma.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/arch/frv/mb93090-mb00/pci-dma.c b/arch/frv/mb93090-mb00/pci-dma.c
index 41098a3..4f8d8bc 100644
--- a/arch/frv/mb93090-mb00/pci-dma.c
+++ b/arch/frv/mb93090-mb00/pci-dma.c
@@ -13,6 +13,7 @@
 #include <linux/dma-mapping.h>
 #include <linux/list.h>
 #include <linux/pci.h>
+#include <linux/export.h>
 #include <linux/highmem.h>
 #include <linux/scatterlist.h>
 #include <asm/io.h>
-- 
1.7.9.1
