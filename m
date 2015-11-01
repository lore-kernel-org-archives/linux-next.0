From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
Date: Mon, 2 Nov 2015 08:48:11 +1100
Message-ID: <20151102084811.52bf5f29@canb.auug.org.au>
References: <20151102031508.59636627@canb.auug.org.au>
	<20151101182645.GA32642@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20151101182645.GA32642@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Oleg Nesterov <oleg@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Markus Pargmann <mpa@pengutronix.de>, Jens Axboe <axboe@fb.com>
List-Id: linux-next.vger.kernel.org

Hi Oleg,

On Sun, 1 Nov 2015 19:26:46 +0100 Oleg Nesterov <oleg@redhat.com> wrote:
>
> On 11/02, Stephen Rothwell wrote:
> >
> > After merging the akpm-current tree, today's linux-next build (powerpc
> > ppc64_defconfig) failed like this:
> >
> > drivers/block/nbd.c: In function 'nbd_thread_send':
> > drivers/block/nbd.c:592:3: error: implicit declaration of function 'dequeue_signal_lock' [-Werror=implicit-function-declaration]
> >    dequeue_signal_lock(current, &current->blocked, &info);
> >    ^
> >
> > Caused by commit
> >
> >   ffcb8dc55a97 ("signal: turn dequeue_signal_lock() into kernel_dequeue_signal()")
> >
> > interacting with commit
> >
> >   dcc909d90ccd ("nbd: Add locking for tasks")
> >
> > from Linus' tree.  
> 
> Yes, thanks, this should be fixed by
> 
> 	signal-turn-dequeue_signal_lock-into-kernel_dequeue_signal-fix.patch

But not published yet ... but thanks for the confirmation.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
