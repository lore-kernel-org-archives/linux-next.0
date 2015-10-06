From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the block tree with Linus' tree
Date: Tue, 6 Oct 2015 12:33:28 +1100
Message-ID: <20151006123328.7e65c106@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jens Axboe <axboe@kernel.dk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>, Ming Lei <ming.lei@canonical.com>
List-Id: linux-next.vger.kernel.org

Hi Jens,

Today's linux-next merge of the block tree got a conflict in:

  drivers/block/loop.c

between commit:

  f4829a9b7a61 ("blk-mq: fix racy updates of rq->errors")

from Linus' tree and commit:

  bc07c10a3603 ("block: loop: support DIO & AIO")

from the block tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc drivers/block/loop.c
index 674f800a3b57,23376084a5cb..000000000000
--- a/drivers/block/loop.c
+++ b/drivers/block/loop.c
@@@ -1486,47 -1669,25 +1669,26 @@@ static void loop_handle_cmd(struct loop
  {
  	const bool write = cmd->rq->cmd_flags & REQ_WRITE;
  	struct loop_device *lo = cmd->rq->q->queuedata;
 -	int ret = -EIO;
 +	int ret = 0;
  
 -	if (write && (lo->lo_flags & LO_FLAGS_READ_ONLY))
 +	if (write && (lo->lo_flags & LO_FLAGS_READ_ONLY)) {
 +		ret = -EIO;
  		goto failed;
 +	}
  
  	ret = do_req_filebacked(lo, cmd->rq);
 -
   failed:
- 	blk_mq_complete_request(cmd->rq, ret ? -EIO : 0);
+ 	if (ret)
+ 		cmd->rq->errors = -EIO;
+ 	/* complete non-aio request */
+ 	if (!cmd->use_aio || ret)
 -		blk_mq_complete_request(cmd->rq);
++		blk_mq_complete_request(cmd->rq, ret ? -EIO : 0);
  }
  
- static void loop_queue_write_work(struct work_struct *work)
- {
- 	struct loop_device *lo =
- 		container_of(work, struct loop_device, write_work);
- 	LIST_HEAD(cmd_list);
- 
- 	spin_lock_irq(&lo->lo_lock);
-  repeat:
- 	list_splice_init(&lo->write_cmd_head, &cmd_list);
- 	spin_unlock_irq(&lo->lo_lock);
- 
- 	while (!list_empty(&cmd_list)) {
- 		struct loop_cmd *cmd = list_first_entry(&cmd_list,
- 				struct loop_cmd, list);
- 		list_del_init(&cmd->list);
- 		loop_handle_cmd(cmd);
- 	}
- 
- 	spin_lock_irq(&lo->lo_lock);
- 	if (!list_empty(&lo->write_cmd_head))
- 		goto repeat;
- 	lo->write_started = false;
- 	spin_unlock_irq(&lo->lo_lock);
- }
- 
- static void loop_queue_read_work(struct work_struct *work)
+ static void loop_queue_work(struct kthread_work *work)
  {
  	struct loop_cmd *cmd =
- 		container_of(work, struct loop_cmd, read_work);
+ 		container_of(work, struct loop_cmd, work);
  
  	loop_handle_cmd(cmd);
  }
