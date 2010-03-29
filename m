From: Dan Williams <dan.j.williams@intel.com>
Subject: Re: linux-next: build failure after merge of the slabh tree
Date: Mon, 29 Mar 2010 15:33:25 -0700
Message-ID: <e9c3a7c21003291533w3c672371o87db6aad8bac7ef2@mail.gmail.com>
References: <20100329160251.702d2c60.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pw0-f46.google.com ([209.85.160.46]:60919 "EHLO
	mail-pw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752422Ab0C2Wd0 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 29 Mar 2010 18:33:26 -0400
In-Reply-To: <20100329160251.702d2c60.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Tejun Heo <tj@kernel.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, =?ISO-8859-1?Q?=22Richard_R=F6jfors=22?= <richard.rojfors@pelagicore.com>

On Sun, Mar 28, 2010 at 10:02 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Tejun,
>
> After merging the slabh tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>
> drivers/dma/timb_dma.c: In function 'td_alloc_init_desc':
> drivers/dma/timb_dma.c:381: error: implicit declaration of function 'kzalloc'
> drivers/dma/timb_dma.c:381: warning: assignment makes pointer from integer without a cast
> drivers/dma/timb_dma.c:389: warning: assignment makes pointer from integer without a cast
> drivers/dma/timb_dma.c:410: error: implicit declaration of function 'kfree'
> drivers/dma/timb_dma.c: In function 'td_probe':
> drivers/dma/timb_dma.c:710: warning: assignment makes pointer from integer without a cast
>
> Caused by commit d103d3b3e8512312b5254950035366d4422a479a ("percpu: don't
> implicitly include slab.h from percpu.h") from the slabh tree interacting
> with commit de5d4453c5b224eefd02b6a141ed411a76d458af ("dma: Add
> timb-dma") from the async_tx tree.
>
> I applied the following merge fixup patch which should be applied to the
> async_tx tree (see Documentation/SubmitChecklist Rule #1 :-)).

Thanks, noted and applied.
