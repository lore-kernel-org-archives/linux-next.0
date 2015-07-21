From: Oleg Nesterov <oleg@redhat.com>
Subject: Re: [PATCH v2]
	mm-move-mremap-from-file_operations-to-vm_operations_struct-fix
Date: Tue, 21 Jul 2015 18:18:31 +0200
Message-ID: <20150721161831.GA17521@redhat.com>
References: <20150716231405.GA25147@redhat.com> <20150721152903.GA10180@redhat.com> <20150721153851.GK21558@kvack.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:55068 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754146AbbGUQXb (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 21 Jul 2015 12:23:31 -0400
Content-Disposition: inline
In-Reply-To: <20150721153851.GK21558@kvack.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Benjamin LaHaise <bcrl@kvack.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Joonsoo Kim <js1304@gmail.com>, Fengguang Wu <fengguang.wu@intel.com>, Jeff Moyer <jmoyer@redhat.com>, Johannes Weiner <hannes@cmpxchg.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On 07/21, Benjamin LaHaise wrote:
>
> On Tue, Jul 21, 2015 at 05:29:03PM +0200, Oleg Nesterov wrote:
> >
> >  static const struct vm_operations_struct aio_ring_vm_ops = {
> >  	.mremap		= aio_ring_mremap,
> > +#ifdef CONFIG_MMU
> >  	.fault		= filemap_fault,
> >  	.map_pages	= filemap_map_pages,
> >  	.page_mkwrite	= filemap_page_mkwrite,
> > +#endif
> >  };
>
> One nit: using #if IS_ENABLED(CONFIG_MMU) is recommended these days not
> #ifdef CONFIG_MMU.

OK, this matches IS_ENABLED(CONFIG_MIGRATION). I am sending v3.

Oleg.
