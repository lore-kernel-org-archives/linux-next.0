From: Mike Snitzer <snitzer@redhat.com>
Subject: Re: arm64 crash in today's next due to 'blk-mq: fix use of incorrect
 goto label in blk_mq_init_queue error path'
Date: Fri, 13 Mar 2015 08:31:15 -0400
Message-ID: <20150313123114.GC7312@redhat.com>
References: <5502B072.4080108@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5502B072.4080108@roeck-us.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Guenter Roeck <linux@roeck-us.net>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Ming Lei <ming.lei@canonical.com>
List-Id: linux-next.vger.kernel.org

On Fri, Mar 13 2015 at  5:40am -0400,
Guenter Roeck <linux@roeck-us.net> wrote:

> I see an arm64 crash in today's -next.
> 
> [<ffffffc0002d3214>] blk_mq_freeze_queue_start+0x38/0x54
> [<ffffffc0002d3284>] blk_mq_update_tag_set_depth+0x2c/0xb8
> [<ffffffc0002d39f4>] blk_mq_init_allocated_queue+0x6e4/0x71c
> [<ffffffc0002d3a58>] blk_mq_init_queue+0x2c/0x6c
> [<ffffffc00036b9b8>] loop_add+0xc0/0x24c
> [<ffffffc0006b3af8>] loop_init+0x134/0x190
> [<ffffffc0000828b4>] do_one_initcall+0x88/0x1a8
> [<ffffffc000696ad4>] kernel_init_freeable+0x140/0x1e8
> [<ffffffc0004db960>] kernel_init+0xc/0xdc
> 
> See http://server.roeck-us.net:8010/builders/qemu-arm64-next/builds/132/steps/qemubuildcommand/logs/stdio
> for a complete log.
> 
> Bisect results:
> 
...
> # first bad commit: [c9e8c91f8a279b87eb0d94b037504ea9fc1bef7c] blk-mq: fix use of incorrect goto label in blk_mq_init_queue error path
> 
> Looking into the patch, this is not surprising, since 'q' is now used before it is allocated.

Yes, sorry about this.  Certainly embarrassing, please see:
https://lkml.org/lkml/2015/3/13/299
