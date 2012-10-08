From: Maxim Levitsky <maximlevitsky@gmail.com>
Subject: [PATCH 1/2] memstick: remove unused field from state struct.
Date: Mon,  8 Oct 2012 17:36:21 +0200
Message-ID: <1349710582-5410-2-git-send-email-maximlevitsky@gmail.com>
References: <CAMuHMdW7zfM1CxkXTCq2=ErkaAAxGVFyQSZdH3jwvUXr_8oOsg@mail.gmail.com>
 <1349710582-5410-1-git-send-email-maximlevitsky@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1349710582-5410-1-git-send-email-maximlevitsky@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, Alex Dubov <oakad@yahoo.com>, Linux-Next <linux-next@vger.kernel.org>, Jens Axboe <axboe@kernel.dk>, Maxim Levitsky <maximlevitsky@gmail.com>
List-Id: linux-next.vger.kernel.org

Oops, I forgot that I have thet field there already.
Just save memory by not allocating it.

Signed-off-by: Maxim Levitsky <maximlevitsky@gmail.com>
---
 drivers/memstick/core/ms_block.h |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/memstick/core/ms_block.h b/drivers/memstick/core/ms_block.h
index 6b5b83e..a2b2765 100644
--- a/drivers/memstick/core/ms_block.h
+++ b/drivers/memstick/core/ms_block.h
@@ -162,7 +162,6 @@ struct msb_data {
 	struct workqueue_struct		*io_queue;
 	bool				io_queue_stopped;
 	struct work_struct		io_work;
-	struct scatterlist		prealloc_sg[MS_BLOCK_MAX_SEGS+1];
 	bool				card_dead;
 
 	/* Media properties */
@@ -194,7 +193,7 @@ struct msb_data {
 
 	/* Preallocated buffers */
 	unsigned char			*block_buffer;
-	struct scatterlist		sg[MS_BLOCK_MAX_SEGS+1];
+	struct scatterlist		prealloc_sg[MS_BLOCK_MAX_SEGS+1];
 
 
 	/* handler's local data */
-- 
1.7.9.5
