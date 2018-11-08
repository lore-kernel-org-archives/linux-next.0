From: Jens Axboe <axboe@kernel.dk>
Subject: Re: linux-next: build warning after merge of the block tree
Date: Wed, 7 Nov 2018 21:19:46 -0700
Message-ID: <b299906b-8169-cb58-a002-526126515c0e@kernel.dk>
References: <20181108143109.7dcc0a3b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181108143109.7dcc0a3b@canb.auug.org.au>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Hannes Reinecke <hare@suse.com>, Ming Lei <ming.lei@redhat.com>, Omar Sandoval <osandov@fb.com>, David Miller <davem@davemloft.net>
List-Id: linux-next.vger.kernel.org

On 11/7/18 8:31 PM, Stephen Rothwell wrote:
> Hi Jens,
> 
> After merging the block tree, today's linux-next build (sparc64 defconfig)
> produced this warning:
> 
> /home/sfr/next/next/drivers/block/sunvdc.c: In function 'init_queue':
> /home/sfr/next/next/drivers/block/sunvdc.c:788:6: warning: unused variable 'ret' [-Wunused-variable]
>   int ret;
>       ^~~
> 
> Introduced by commit
> 
>   fa182a1fa97d ("sunvdc: convert to blk-mq")

Thanks, leftover from v2 of the conversion that switched to the
sq init queue helper. I'll fix it.

-- 
Jens Axboe
