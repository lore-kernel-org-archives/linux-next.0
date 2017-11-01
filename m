From: Jens Axboe <axboe@kernel.dk>
Subject: Re: linux-next: manual merge of the tip tree with the block tree
Date: Wed, 1 Nov 2017 08:25:00 -0600
Message-ID: <bc21c070-3a7d-b469-62fd-1258ab265e3b@kernel.dk>
References: <20171101171007.6a340098@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171101171007.6a340098@canb.auug.org.au>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Kees Cook <keescook@chromium.org>
List-Id: linux-next.vger.kernel.org

On 11/01/2017 12:10 AM, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the tip tree got a conflict in:
> 
>   drivers/block/amiflop.c
> 
> between commit:
> 
>   f37ecbfc238b ("amifloppy: Convert timers to use timer_setup()")
> 
> from the block tree and commit:
> 
>   3c557df67257 ("timer: Remove meaningless .data/.function assignments")
> 
> from the tip tree.
> 
> I fixed it up (I just used the former version of the motor_on_callback
> definition) and can carry the fix as necessary. This is now fixed as
> far as linux-next is concerned, but any non trivial conflicts should be
> mentioned to your upstream maintainer when your tree is submitted for
> merging.  You may also want to consider cooperating with the maintainer
> of the conflicting tree to minimise any particularly complex conflicts.

Kees, why are we in this situation? Making similar timer fixups in the
same driver and submitting it through two different trees is a mess.

-- 
Jens Axboe
