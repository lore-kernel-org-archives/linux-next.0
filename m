From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH 2/2] misc: fastrpc: Fix device_open when no session is available
Date: Fri, 15 Feb 2019 10:40:07 +0000
Message-ID: <20190215104007.27103-3-srinivas.kandagatla@linaro.org>
References: <20190215104007.27103-1-srinivas.kandagatla@linaro.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190215104007.27103-1-srinivas.kandagatla@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, Thierry Escande <thierry.escande@linaro.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
List-Id: linux-next.vger.kernel.org

From: Thierry Escande <thierry.escande@linaro.org>

This change fixes fastrpc_device_open() when no session is available and
return an error in such case.

Signed-off-by: Thierry Escande <thierry.escande@linaro.org>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/misc/fastrpc.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 4b0db33896df..89aec17738ef 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -1016,10 +1016,19 @@ static int fastrpc_device_open(struct inode *inode, struct file *filp)
 	INIT_LIST_HEAD(&fl->user);
 	fl->tgid = current->tgid;
 	fl->cctx = cctx;
+
+	fl->sctx = fastrpc_session_alloc(cctx);
+	if (!fl->sctx) {
+		dev_err(&cctx->rpdev->dev, "No session available\n");
+		mutex_destroy(&fl->mutex);
+		kfree(fl);
+
+		return -EBUSY;
+	}
+
 	spin_lock(&cctx->lock);
 	list_add_tail(&fl->user, &cctx->users);
 	spin_unlock(&cctx->lock);
-	fl->sctx = fastrpc_session_alloc(cctx);
 
 	return 0;
 }
-- 
2.20.1
