From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
Date: Thu, 11 Feb 2016 07:51:44 +1100
Message-ID: <20160211075144.28db2f39@canb.auug.org.au>
References: <20160210165514.412992a5@canb.auug.org.au>
	<20160210115507.f1521e162a8489c18b02048b@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:44579 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750730AbcBJUvr (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 10 Feb 2016 15:51:47 -0500
In-Reply-To: <20160210115507.f1521e162a8489c18b02048b@linux-foundation.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, Jiri Kosina <jkosina@suse.cz>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>, Felipe Balbi <balbi@ti.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Hi Andrew,

On Wed, 10 Feb 2016 11:55:07 -0800 Andrew Morton <akpm@linux-foundation.org> wrote:
>
> On Wed, 10 Feb 2016 16:55:14 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> 
> > Hi Andrew,
> > 
> > After merging the akpm-current tree, today's linux-next build (x86_64
> > allmodconfig) failed like this:
> > 
> > In file included from arch/x86/include/asm/bug.h:35:0,
> >                  from include/linux/bug.h:4,
> >                  from include/linux/thread_info.h:11,
> >                  from arch/x86/include/asm/preempt.h:6,
> >                  from include/linux/preempt.h:59,
> >                  from include/linux/radix-tree.h:25,
> >                  from kernel/memremap.c:13:
> > kernel/memremap.c: In function 'devm_memremap_pages_release':
> > kernel/memremap.c:230:54: error: expected ')' before '__func__'
> >    dev_WARN(dev, "%s: page mapping is still live!\n", __func__);
> >                                                       ^
> > include/asm-generic/bug.h:74:69: note: in definition of macro '__WARN_printf'
> >  #define __WARN_printf(arg...) warn_slowpath_fmt(__FILE__, __LINE__, arg)
> >                                                                      ^
> > include/linux/device.h:1312:2: note: in expansion of macro 'WARN'
> >   WARN(condition, "%s %s: " format,   \
> >   ^
> > kernel/memremap.c:230:3: note: in expansion of macro 'dev_WARN'
> >    dev_WARN(dev, "%s: page mapping is still live!\n", __func__);
> >    ^
> > include/linux/device.h:1312:18: warning: format '%s' expects a matching 'char *' argument [-Wformat=]
> >   WARN(condition, "%s %s: " format,   \
> >                   ^
> > include/asm-generic/bug.h:74:69: note: in definition of macro '__WARN_printf'
> >  #define __WARN_printf(arg...) warn_slowpath_fmt(__FILE__, __LINE__, arg)
> >                                                                      ^
> > include/linux/device.h:1312:2: note: in expansion of macro 'WARN'
> >   WARN(condition, "%s %s: " format,   \
> >   ^
> > kernel/memremap.c:230:3: note: in expansion of macro 'dev_WARN'
> >    dev_WARN(dev, "%s: page mapping is still live!\n", __func__);
> >    ^
> > 
> > Probably exposed by commit
> > 
> >   27ffb3827ac7 ("mm: CONFIG_NR_ZONES_EXTENDED")
> > 
> > originally caused by commit
> > 
> >   5c2c2587b132 ("mm, dax, pmem: introduce {get|put}_dev_pagemap() for dax-gup")
> > 
> > which was added in v4.5-rc1.
> > 
> > I added the below patch for today but then discovered the waiting patch
> > in the akpm tree ("kernel/memremap.c: add new arg to dev_WARN") which
> > should be sent to Linus ASAP (and should have appeared much earlier in
> > the series).  
> 
> kernel-memremapc-add-new-arg-to-dev_warn.patch fixes ee49ac85bc24b946
> ("treewide: let dev_WARN() accept a condition") which is only in
> linux-next?

Yes, indeed, I guess I was a bit tired by that point :-(

However, I am not sure I would ever call an API change trivial i.e. I
wonder what that patch is doing the the trivial tree ...  I guess that
patch is needed as part of the merge of the trivial tree.  Or the
trivial tree should be based on v4.5-rc1 not v4.3 (in which case this
patch belongs as part of ee49ac85bc24b946 (and presumably would have
been found in testing of the trivial tree alone).

I will put your patch into teh merge of the trivial tree today (so it
will disappear from the akpm tree).
-- 
Cheers,
Stephen Rothwell
