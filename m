From: Benjamin LaHaise <bcrl@kvack.org>
Subject: Re: linux-next: build failure after merge of the aio tree
Date: Tue, 12 Jan 2016 11:38:35 -0500
Message-ID: <20160112163835.GD347@kvack.org>
References: <20160112164034.0fe945a7@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160112164034.0fe945a7@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Tue, Jan 12, 2016 at 04:40:34PM +1100, Stephen Rothwell wrote:
> Hi Benjamin,
> 
> After merging the aio tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
> 
> fs/built-in.o: In function `aio_thread_op_foo_at':
> file.c:(.text+0x43808): undefined reference to `__get_user_bad'
> file.c:(.text+0x43838): undefined reference to `__get_user_bad'

This is very strange.  It seems to imply that __get_user() doesn't 
handle 64 bit values, which is completely broken behaviour on the 
architecture's part if true.  Can any ARM folks comment on the right 
fix here?

		-ben

> Caused by commit
> 
>   150a0b4905f1 ("aio: add support for async openat()")
> 
> I have used the aio tree from next-20160111 for today.
> 
> -- 
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au

-- 
"Thought is the essence of where you are now."
