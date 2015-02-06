From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH v2] drm/nouveau/clk: Change rate from u32 to u64 in gk20a_pllg_calc_rate()
Date: Fri,  6 Feb 2015 10:20:58 +0100
Message-ID: <1423214458-23033-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from baptiste.telenet-ops.be ([195.130.132.51]:51531 "EHLO
	baptiste.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754614AbbBFJVC (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 6 Feb 2015 04:21:02 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Airlie <airlied@linux.ie>, Alexandre Courbot <acourbot@nvidia.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>

On 32-bit platforms using asm-generic/div64.h:

drivers/gpu/drm/nouveau/nvkm/subdev/clk/gk20a.c: In function 'gk20a_pllg_calc_rate':
drivers/gpu/drm/nouveau/nvkm/subdev/clk/gk20a.c:147:79: warning: comparison of distinct pointer types lacks a cast
  do_div(rate, divider);
                                                                               ^
drivers/gpu/drm/nouveau/nvkm/subdev/clk/gk20a.c:147:2: warning: right shift count >= width of type
  do_div(rate, divider);
  ^
drivers/gpu/drm/nouveau/nvkm/subdev/clk/gk20a.c:147:238: warning: passing argument 1 of '__div64_32' from incompatible pointer type
  do_div(rate, divider);
                                                                                                                                                                                                                                              ^
In file included from arch/parisc/include/generated/asm/div64.h:1:0,
                 from include/linux/kernel.h:124,
                 from include/linux/list.h:8,
                 from include/linux/preempt.h:10,
                 from include/linux/spinlock.h:50,
                 from include/linux/mmzone.h:7,
                 from include/linux/gfp.h:5,
                 from include/linux/slab.h:14,
                 from drivers/gpu/drm/nouveau/include/nvif/os.h:5,
                 from drivers/gpu/drm/nouveau/include/nvkm/core/os.h:3,
                 from drivers/gpu/drm/nouveau/include/nvkm/core/object.h:3,
                 from drivers/gpu/drm/nouveau/include/nvkm/core/subdev.h:3,
                 from drivers/gpu/drm/nouveau/include/nvkm/subdev/clk.h:3,
                 from drivers/gpu/drm/nouveau/nvkm/subdev/clk/gk20a.c:25:
include/asm-generic/div64.h:35:17: note: expected 'uint64_t *' but argument is of type 'u32 *'
 extern uint32_t __div64_32(uint64_t *dividend, uint32_t divisor);
                 ^

do_div() is meant for 64-bit by 32-bit division, but both the dividend
and divisor are 32-bit here, causing the warning.

As the product of priv->parent_rate and priv->n may no longer fit in u32
soon, change rate from u32 to u64, which also fixes the warning.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
Compile-tested only.

This is v2 of "drm/nouveau/clk: Use plain "/" for 32-bit division".

v2:
  - Change rate from u32 to u64 instead of changing the division.

parisc/allmodconfig:
http://kisskb.ellerman.id.au/kisskb/buildresult/12358386/
---
 drivers/gpu/drm/nouveau/nvkm/subdev/clk/gk20a.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/clk/gk20a.c b/drivers/gpu/drm/nouveau/nvkm/subdev/clk/gk20a.c
index 65c532742b08d1c6..e87a964b8bea4d30 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/clk/gk20a.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/clk/gk20a.c
@@ -139,7 +139,7 @@ gk20a_pllg_read_mnp(struct gk20a_clk_priv *priv)
 static u32
 gk20a_pllg_calc_rate(struct gk20a_clk_priv *priv)
 {
-	u32 rate;
+	u64 rate;
 	u32 divider;
 
 	rate = priv->parent_rate * priv->n;
-- 
1.9.1
