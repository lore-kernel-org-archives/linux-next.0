From: Fengguang Wu <lkp@intel.com>
Subject: Re: [kbuild-all] linux-next: build failure after merge of the
 akpm-current tree
Date: Mon, 2 Nov 2015 10:43:09 +0800
Message-ID: <20151102024309.GA7966@wfg-t540p.sh.intel.com>
References: <20151102031508.59636627@canb.auug.org.au>
 <201511020011.5wu2fYbn%fengguang.wu@intel.com>
 <20151101183754.GB32642@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga14.intel.com ([192.55.52.115]:49474 "EHLO mga14.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750884AbbKBCn2 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 1 Nov 2015 21:43:28 -0500
Content-Disposition: inline
In-Reply-To: <20151101183754.GB32642@redhat.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Oleg Nesterov <oleg@redhat.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-kernel@vger.kernel.org, Jens Axboe <axboe@fb.com>, linux-next@vger.kernel.org, kbuild-all@01.org, Markus Pargmann <mpa@pengutronix.de>, Andrew Morton <akpm@linux-foundation.org>

On Sun, Nov 01, 2015 at 07:37:55PM +0100, Oleg Nesterov wrote:
> On 11/02, kbuild test robot wrote:
> >
> > Hi Stephen,
> >
> > [auto build test ERROR on v4.3-rc7 -- if it's inappropriate base, please suggest rules for selecting the more suitable base]
> >
> > url:    https://github.com/0day-ci/linux/commits/Stephen-Rothwell/linux-next-build-failure-after-merge-of-the-akpm-current-tree/20151102-001657
> > config: i386-randconfig-x004-11010709 (attached as .config)
> > reproduce:
> >         # save the attached .config to linux build tree
> >         make ARCH=i386
> >
> > All errors (new ones prefixed by >>):
> >
> >    drivers/block/nbd.c: In function 'nbd_thread_send':
> > >> drivers/block/nbd.c:596:3: error: implicit declaration of function 'kernel_dequeue_signal' [-Werror=implicit-function-declaration]
> >       kernel_dequeue_signal(NULL);
> >       ^
> >    cc1: some warnings being treated as errors
> >
> > vim +/kernel_dequeue_signal +596 drivers/block/nbd.c
> >
> >    590		spin_lock_irqsave(&nbd->tasks_lock, flags);
> >    591		nbd->task_send = NULL;
> >    592		spin_unlock_irqrestore(&nbd->tasks_lock, flags);
> >    593
> >    594		/* Clear maybe pending signals */
> >    595		if (signal_pending(current))
> >  > 596			kernel_dequeue_signal(NULL);
> >    597
> >    598		return 0;
> >    599	}
> 
> Yes, de90fc653be60b4cec1a4d40f0e82164ec79f077 ("linux-next: build failure
> after merge of the akpm-current tree") should be applied on top of -mm.

Yes, sorry for the noise! I'll skip testing Stephen's linux-next fixup
patches. It turns out to be time sensitive: the robot might see the
build fix patch in mailing list before see the updated linux-next git
tree, which makes git-am to linux-next failed and fallback to git-am
to RC release.

Thanks,
Fengguang
