From: Oleg Nesterov <oleg@redhat.com>
Subject: Re: [PATCH]
	mm-move-mremap-from-file_operations-to-vm_operations_struct-fix
Date: Sat, 18 Jul 2015 00:31:47 +0200
Message-ID: <20150717223147.GA13259@redhat.com>
References: <20150716231405.GA25147@redhat.com> <20150716162444.26425f5e227387f1166a6d16@linux-foundation.org> <20150716235227.GA26551@redhat.com> <20150717140615.GA2779@kvack.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150717140615.GA2779@kvack.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Benjamin LaHaise <bcrl@kvack.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Joonsoo Kim <js1304@gmail.com>, Fengguang Wu <fengguang.wu@intel.com>, Jeff Moyer <jmoyer@redhat.com>, Johannes Weiner <hannes@cmpxchg.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On 07/17, Benjamin LaHaise wrote:
>
> it should have worked before the page
> migration code was added,

This is off-topic, but the whole "vm" logic in aio_setup_ring()
looks sub-optimal. I do not mean the code, just it seems to me it
is pointless to pollute the page cache, and expose the pages we
can not swap/free to lru. Afaics we _only_ need this for migration.

Perhaps I missed something, doesn't matter. But this means that
this memory is not accounted, so if I increase aio-max-nr then
this test-case

	#define __NR_io_setup	206

	int main(void)
	{
		int nr;

		for (nr = 0; ;++nr) {
			void *ctx = NULL;
			int ret = syscall(__NR_io_setup, 1, &ctx);
			if (ret) {
				printf("failed %d %m: ", nr);
				getchar();
			}
		}

		return 0;
	}

triggers OOM-killer which kills sshd and other daemons on my machine.
These pages were not even faulted in (or the shrinker can unmap them),
the kernel can not know who should be blamed.

Shouldn't we account aio events/pages somehow, say per-user, or in
mm->pinned_vm ?

I do not think this is unkown, and probably this all is fine. IOW,
this is just a question, not a bug-report or something like this.

And of course, this is not exploitable because aio-max-nr limits
the number of pages you can steal.

But otoh, aio_max_nr is system-wide, so the unpriviliged user can
ddos (say) mysqld. And this leads to the same question: shouldn't
we account nr_events at least?

Oleg.
