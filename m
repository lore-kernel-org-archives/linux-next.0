From: Jeff Moyer <jmoyer@redhat.com>
Subject: Re: [PATCH] mm-move-mremap-from-file_operations-to-vm_operations_struct-fix
Date: Mon, 20 Jul 2015 10:22:10 -0400
Message-ID: <x49h9oysyct.fsf@segfault.boston.devel.redhat.com>
References: <20150716231405.GA25147@redhat.com>
	<20150716162444.26425f5e227387f1166a6d16@linux-foundation.org>
	<20150716235227.GA26551@redhat.com> <20150717140615.GA2779@kvack.org>
	<20150717223147.GA13259@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Oleg Nesterov <oleg@redhat.com>
Cc: Benjamin LaHaise <bcrl@kvack.org>, Andrew Morton <akpm@linux-foundation.org>, Joonsoo Kim <js1304@gmail.com>, Fengguang Wu <fengguang.wu@intel.com>, Johannes Weiner <hannes@cmpxchg.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Hi, Oleg,

Oleg Nesterov <oleg@redhat.com> writes:

> Shouldn't we account aio events/pages somehow, say per-user, or in
> mm->pinned_vm ?

Ages ago I wrote a patch to account the completion ring to a process'
memlock limit:
  "[patch] aio: remove aio-max-nr and instead use the memlock rlimit to
   limit the number of pages pinned for the aio completion ring"
  http://marc.info/?l=linux-aio&m=123661380807041&w=2

The problem with that patch is that it modifies the user/kernel
interface.  It could be done over time, as Andrew outlined in that
thread, but I've been reluctant to take that on.

If you just mean we should account the memory so that the right process
can be killed, that sounds like a good idea to me.

Cheers,
Jeff
