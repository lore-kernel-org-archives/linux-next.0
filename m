From: Guenter Roeck <linux@roeck-us.net>
Subject: arm64 crash in today's next due to 'blk-mq: fix use of incorrect
 goto label in blk_mq_init_queue error path'
Date: Fri, 13 Mar 2015 02:40:02 -0700
Message-ID: <5502B072.4080108@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:38236 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752768AbbCMJkP (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 13 Mar 2015 05:40:15 -0400
Received: from mailnull by bh-25.webhostbox.net with sa-checked (Exim 4.82)
	(envelope-from <linux@roeck-us.net>)
	id 1YWM4j-003I3Z-M3
	for linux-next@vger.kernel.org; Fri, 13 Mar 2015 09:40:13 +0000
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: Mike Snitzer <snitzer@redhat.com>, Ming Lei <ming.lei@canonical.com>

I see an arm64 crash in today's -next.

[<ffffffc0002d3214>] blk_mq_freeze_queue_start+0x38/0x54
[<ffffffc0002d3284>] blk_mq_update_tag_set_depth+0x2c/0xb8
[<ffffffc0002d39f4>] blk_mq_init_allocated_queue+0x6e4/0x71c
[<ffffffc0002d3a58>] blk_mq_init_queue+0x2c/0x6c
[<ffffffc00036b9b8>] loop_add+0xc0/0x24c
[<ffffffc0006b3af8>] loop_init+0x134/0x190
[<ffffffc0000828b4>] do_one_initcall+0x88/0x1a8
[<ffffffc000696ad4>] kernel_init_freeable+0x140/0x1e8
[<ffffffc0004db960>] kernel_init+0xc/0xdc

See http://server.roeck-us.net:8010/builders/qemu-arm64-next/builds/132/steps/qemubuildcommand/logs/stdio
for a complete log.

Bisect results:

# bad: [4516740d361710d8a554749c63a75b410edd2fdc] fs: btrfs: Add missing include file
# good: [9eccca0843205f87c00404b663188b88eb248051] Linux 4.0-rc3
git bisect start 'HEAD' 'v4.0-rc3'
# good: [07534ed768c6b5d4ffa048e643597e7d0690b572] Merge remote-tracking branch 'sound/for-next'
git bisect good 07534ed768c6b5d4ffa048e643597e7d0690b572
# bad: [b27544a5a14c901833f254f8bd17bdc132a7a765] Merge remote-tracking branch 'tty/tty-next'
git bisect bad b27544a5a14c901833f254f8bd17bdc132a7a765
# bad: [a16a3cc1cb1e956e294b5e36d1f9e082406676a5] Merge remote-tracking branch 'spi/for-next'
git bisect bad a16a3cc1cb1e956e294b5e36d1f9e082406676a5
# bad: [c4b2457b90df42abe46e463d5da149c9a4515262] Merge remote-tracking branch 'md/for-next'
git bisect bad c4b2457b90df42abe46e463d5da149c9a4515262
# good: [c96db850880a5f76d727725607ab82c4733d1c60] Merge remote-tracking branch 'input/next'
git bisect good c96db850880a5f76d727725607ab82c4733d1c60
# bad: [b083904c28374ec4d1f4bbeafb7faa68985e289f] Merge remote-tracking branch 'device-mapper/for-next'
git bisect bad b083904c28374ec4d1f4bbeafb7faa68985e289f
# good: [c7b1fb7cfa638bdcb9ff71a55ce0a9b8554bf927] Merge branch 'for-3.20/core' into for-next
git bisect good c7b1fb7cfa638bdcb9ff71a55ce0a9b8554bf927
# good: [40852b59c07610139755a707fde327c4b33b8b26] dm: remove request-based logic from make_request_fn wrapper
git bisect good 40852b59c07610139755a707fde327c4b33b8b26
# bad: [716452cd27b145d611e4399e7cc35df6c943686e] blk-mq: add blk_mq_init_allocated_queue and export blk_mq_register_disk
git bisect bad 716452cd27b145d611e4399e7cc35df6c943686e
# good: [8124ec8334d7ffa0ca496a52c7351b9ed610fa03] dm: don't start current request if it would've merged with the previous
git bisect good 8124ec8334d7ffa0ca496a52c7351b9ed610fa03
# good: [5013e29ef8a49fd276150f566880766938dc0e20] dm: impose configurable deadline for dm_request_fn's merge heuristic
git bisect good 5013e29ef8a49fd276150f566880766938dc0e20
# bad: [c9e8c91f8a279b87eb0d94b037504ea9fc1bef7c] blk-mq: fix use of incorrect goto label in blk_mq_init_queue error path
git bisect bad c9e8c91f8a279b87eb0d94b037504ea9fc1bef7c
# first bad commit: [c9e8c91f8a279b87eb0d94b037504ea9fc1bef7c] blk-mq: fix use of incorrect goto label in blk_mq_init_queue error path

Looking into the patch, this is not surprising, since 'q' is now used before it is allocated.

Guenter
