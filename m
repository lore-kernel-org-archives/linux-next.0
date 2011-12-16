From: Jens Axboe <axboe@kernel.dk>
Subject: Re: linux-next: build failure after merge of the block tree
Date: Fri, 16 Dec 2011 09:20:27 +0100
Message-ID: <4EEAFF4B.6000802@kernel.dk>
References: <20111216125001.33635d34b5397292e6190b9a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20111216125001.33635d34b5397292e6190b9a@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Tejun Heo <tj@kernel.org>, majianpeng <majianpeng@gmail.com>
List-Id: linux-next.vger.kernel.org

On 2011-12-16 02:50, Stephen Rothwell wrote:
> Hi Jens,
> 
> After merging the block tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> block/cfq-iosched.c: In function 'cfq_init_queue':
> block/cfq-iosched.c:3690:14: error: 'cic_index_lock' undeclared (first use in this function)
> block/cfq-iosched.c:3691:15: error: 'cic_index_ida' undeclared (first use in this function)
> block/cfq-iosched.c:3691:34: error: 'struct cfq_data' has no member named 'cic_index'
> 
> Presumably this was not build tested with CONFIG_CFQ_GROUP_IOSCHED set.
> 
> Caused by commit a73f730d013f ("block, cfq: move cfqd->cic_index to
> q->id") interacting with commit 2984ff38ccf6 ("cfq-iosched: free
> cic_index if blkio_alloc_blkg_stats fails").
> 
> I have used the block tree from next-20111215 for today.

Sorry Stephen, I'll get this merge problem fixed up.

-- 
Jens Axboe
