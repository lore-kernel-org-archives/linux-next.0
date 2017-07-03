From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the tip tree with the block tree
Date: Mon, 3 Jul 2017 14:03:50 +1000
Message-ID: <20170703140350.7a29fd4b@canb.auug.org.au>
References: <20170703135616.3e49cab1@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170703135616.3e49cab1@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Jens Axboe <axboe@kernel.dk>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Max Gurtovoy <maxg@mellanox.com>, Christoph Hellwig <hch@lst.de>
List-Id: linux-next.vger.kernel.org

Hi all,

On Mon, 3 Jul 2017 13:56:16 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
>  +		if (cpu < nr_queues) {
> - 			map[cpu] = cpu_to_queue_index(nr_queues, cpu, online_mask);
> ++			map[cpu] = cpu_to_queue_index(nr_queues, cpu)
>  +		} else {
>  +			first_sibling = get_first_sibling(cpu);
>  +			if (first_sibling == cpu)
> - 				map[cpu] = cpu_to_queue_index(nr_queues, cpu, online_mask);
> ++				map[cpu] = cpu_to_queue_index(nr_queues, cpu)

Clearly, I dropped a couple of semicolons here ... I added them to the
merge resolution.

-- 
Cheers,
Stephen Rothwell
