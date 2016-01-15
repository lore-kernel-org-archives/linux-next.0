From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the aio tree
Date: Fri, 15 Jan 2016 20:23:16 +1100
Message-ID: <20160115202316.59601869@canb.auug.org.au>
References: <20160112164034.0fe945a7@canb.auug.org.au>
	<20160115073944.GA24382@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:55096 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752468AbcAOJXS (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 15 Jan 2016 04:23:18 -0500
In-Reply-To: <20160115073944.GA24382@infradead.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Christoph Hellwig <hch@infradead.org>
Cc: Benjamin LaHaise <bcrl@kvack.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Christoph,

On Thu, 14 Jan 2016 23:39:44 -0800 Christoph Hellwig <hch@infradead.org> wrote:
>
> On Tue, Jan 12, 2016 at 04:40:34PM +1100, Stephen Rothwell wrote:
> > Hi Benjamin,
> > 
> > After merging the aio tree, today's linux-next build (arm
> > multi_v7_defconfig) failed like this:
> > 
> > fs/built-in.o: In function `aio_thread_op_foo_at':
> > file.c:(.text+0x43808): undefined reference to `__get_user_bad'
> > file.c:(.text+0x43838): undefined reference to `__get_user_bad'
> > 
> > Caused by commit
> > 
> >   150a0b4905f1 ("aio: add support for async openat()")  
> 
> How did that code end up in linux-next anyway?

Via the aio tree (git://git.kvack.org/~bcrl/aio-next.git#master) added
in July 2013 at Ben's request.  The code was added to the aio tree in
Jan 12 (my time), but has never been in a published linux-next tree due
to the above build problem (I back out to the previous days version of
the aio tree).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
