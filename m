From: Oleg Nesterov <oleg@redhat.com>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
Date: Sun, 1 Nov 2015 19:37:55 +0100
Message-ID: <20151101183754.GB32642@redhat.com>
References: <20151102031508.59636627@canb.auug.org.au> <201511020011.5wu2fYbn%fengguang.wu@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:57296 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752375AbbKARlj (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 1 Nov 2015 12:41:39 -0500
Content-Disposition: inline
In-Reply-To: <201511020011.5wu2fYbn%fengguang.wu@intel.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kbuild test robot <lkp@intel.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, kbuild-all@01.org, Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Markus Pargmann <mpa@pengutronix.de>, Jens Axboe <axboe@fb.com>

On 11/02, kbuild test robot wrote:
>
> Hi Stephen,
>
> [auto build test ERROR on v4.3-rc7 -- if it's inappropriate base, please suggest rules for selecting the more suitable base]
>
> url:    https://github.com/0day-ci/linux/commits/Stephen-Rothwell/linux-next-build-failure-after-merge-of-the-akpm-current-tree/20151102-001657
> config: i386-randconfig-x004-11010709 (attached as .config)
> reproduce:
>         # save the attached .config to linux build tree
>         make ARCH=i386
>
> All errors (new ones prefixed by >>):
>
>    drivers/block/nbd.c: In function 'nbd_thread_send':
> >> drivers/block/nbd.c:596:3: error: implicit declaration of function 'kernel_dequeue_signal' [-Werror=implicit-function-declaration]
>       kernel_dequeue_signal(NULL);
>       ^
>    cc1: some warnings being treated as errors
>
> vim +/kernel_dequeue_signal +596 drivers/block/nbd.c
>
>    590		spin_lock_irqsave(&nbd->tasks_lock, flags);
>    591		nbd->task_send = NULL;
>    592		spin_unlock_irqrestore(&nbd->tasks_lock, flags);
>    593
>    594		/* Clear maybe pending signals */
>    595		if (signal_pending(current))
>  > 596			kernel_dequeue_signal(NULL);
>    597
>    598		return 0;
>    599	}

Yes, de90fc653be60b4cec1a4d40f0e82164ec79f077 ("linux-next: build failure
after merge of the akpm-current tree") should be applied on top of -mm.

Hopefully this all was fixed by
signal-turn-dequeue_signal_lock-into-kernel_dequeue_signal-fix.patch
already in -mm.

Oleg.
