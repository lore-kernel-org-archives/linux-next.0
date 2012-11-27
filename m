From: Peter Hurley <peter@hurleysoftware.com>
Subject: [PATCH -next] staging/fwserial: Fix build breakage when !CONFIG_BUG
Date: Tue, 27 Nov 2012 02:11:07 -0500
Message-ID: <1354000267.3284.4.camel@thor>
References: <20121127011738.9ecd7971a7ea2e3d09a9450d@canb.auug.org.au>
	 <50B3D767.70604@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <50B3D767.70604@infradead.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Randy Dunlap <rdunlap@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>, Andrew Morton <akpm@linux-foundation.org>
List-Id: linux-next.vger.kernel.org

Use WARN() as intended.

Signed-off-by: Peter Hurley <peter@hurleysoftware.com>
---
 drivers/staging/fwserial/dma_fifo.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/staging/fwserial/dma_fifo.c b/drivers/staging/fwserial/dma_fifo.c
index 72aa053..5e84634 100644
--- a/drivers/staging/fwserial/dma_fifo.c
+++ b/drivers/staging/fwserial/dma_fifo.c
@@ -33,10 +33,7 @@
 
 #define FAIL(fifo, condition, format...) ({				\
 	fifo->corrupt = !!(condition);					\
-	if (unlikely(fifo->corrupt)) {					\
-		__WARN_printf(format);					\
-	}								\
-	unlikely(fifo->corrupt);					\
+	WARN(fifo->corrupt, format);					\
 })
 
 /*
-- 
1.8.0
