From: Qiang Yu <yuq825@gmail.com>
Subject: [PATCH] drm/lima: adopt xa_alloc API change
Date: Tue,  2 Apr 2019 21:45:47 +0800
Message-ID: <20190402134547.15314-1-yuq825@gmail.com>
References: <CAKGbVbt4W8UUST8HZ0tPuHyGv4qx98hMqmkhWmJB5K-TbReg5A@mail.gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAKGbVbt4W8UUST8HZ0tPuHyGv4qx98hMqmkhWmJB5K-TbReg5A@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: dri-devel@lists.freedesktop.org
Cc: lima@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, eric@anholt.net, Qiang Yu <yuq825@gmail.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Matthew Wilcox <willy@infradead.org>, Daniel Vetter <daniel@ffwll.ch>
List-Id: linux-next.vger.kernel.org

Cc: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Matthew Wilcox <willy@infradead.org>
Cc: Daniel Vetter <daniel@ffwll.ch>
Signed-off-by: Qiang Yu <yuq825@gmail.com>
---
 drivers/gpu/drm/lima/lima_ctx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/lima/lima_ctx.c b/drivers/gpu/drm/lima/lima_ctx.c
index c8d12f7c6894..22fff6caa961 100644
--- a/drivers/gpu/drm/lima/lima_ctx.c
+++ b/drivers/gpu/drm/lima/lima_ctx.c
@@ -23,7 +23,7 @@ int lima_ctx_create(struct lima_device *dev, struct lima_ctx_mgr *mgr, u32 *id)
 			goto err_out0;
 	}
 
-	err = xa_alloc(&mgr->handles, id, UINT_MAX, ctx, GFP_KERNEL);
+	err = xa_alloc(&mgr->handles, id, ctx, xa_limit_32b, GFP_KERNEL);
 	if (err < 0)
 		goto err_out0;
 
-- 
2.17.1
