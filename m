From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
Date: Mon, 21 Sep 2015 09:24:11 -0700
Message-ID: <20150921162411.GD17389@dtor-ws>
References: <20150921141810.298d07b2@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150921141810.298d07b2@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Mon, Sep 21, 2015 at 02:18:10PM +1000, Stephen Rothwell wrote:
> Hi Andrew,
> 
> After merging the akpm-current tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> drivers/input/joystick/walkera0701.c:153:4: error: implicit declaration of function 'abs64' [-Werror=implicit-function-declaration]
>     if (abs64(pulse_time - SYNC_PULSE) < RESERVE) /* new frame sync */
>     ^
> 
> Caused by commit
> 
>   ea91f9c72512 ("Remove abs64()")
> 
> interacting with commit
> 
>   46b018fa9500 ("Input: walkera0701 - fix abs() calculations on 64 bit values")
> 
> from the input-current tree.
> 
> I just reverted 46b018fa9500 as ti will no longer be needed.

Hmm, I plan on sending it to Linus in 4.3 merge window. I saw more
patches switching to abs64 flying by so I guess removal will have to add
walkera to the list needing adjusting.

Thanks.

-- 
Dmitry
