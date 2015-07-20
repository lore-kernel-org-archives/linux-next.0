From: Oleg Nesterov <oleg@redhat.com>
Subject: Re: [PATCH]
	mm-move-mremap-from-file_operations-to-vm_operations_struct-fix
Date: Mon, 20 Jul 2015 21:24:40 +0200
Message-ID: <20150720192440.GA20573@redhat.com>
References: <20150716231405.GA25147@redhat.com> <20150716162444.26425f5e227387f1166a6d16@linux-foundation.org> <20150716235227.GA26551@redhat.com> <20150717140615.GA2779@kvack.org> <20150717223147.GA13259@redhat.com> <x49h9oysyct.fsf@segfault.boston.devel.redhat.com> <20150720173311.GA4379@redhat.com> <20150720175145.GH21558@kvack.org> <20150720183150.GA6868@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150720183150.GA6868@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Benjamin LaHaise <bcrl@kvack.org>
Cc: Jeff Moyer <jmoyer@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Joonsoo Kim <js1304@gmail.com>, Fengguang Wu <fengguang.wu@intel.com>, Johannes Weiner <hannes@cmpxchg.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On 07/20, Oleg Nesterov wrote:
>
> But again, again, please ignore. This all is off-topic and my understanding
> is very limited.

Yes, yes, but sorry for noise and let me repeat...

This memory lives in page-cache/lru, it is visible for shrinker which
will unmap these pages for no reason on memory shortage. IOW, aio fools
the kernel, this memory looks reclaimable but it is not. And we only do
this for migration.

Even if this is not a problem, this does not look right. So perhaps at
least mapping_set_unevictable() makes sense. But I simply do not know
if migration will work with this change.


And I should have changes the subject a long ago... So what do you think
we should do with the build failure?

Oleg.
