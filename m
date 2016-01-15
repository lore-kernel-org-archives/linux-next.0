From: Christoph Hellwig <hch@infradead.org>
Subject: Re: linux-next: build failure after merge of the aio tree
Date: Thu, 14 Jan 2016 23:39:44 -0800
Message-ID: <20160115073944.GA24382@infradead.org>
References: <20160112164034.0fe945a7@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:39302 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753295AbcAOHjp (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 15 Jan 2016 02:39:45 -0500
Content-Disposition: inline
In-Reply-To: <20160112164034.0fe945a7@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Benjamin LaHaise <bcrl@kvack.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Jan 12, 2016 at 04:40:34PM +1100, Stephen Rothwell wrote:
> Hi Benjamin,
> 
> After merging the aio tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
> 
> fs/built-in.o: In function `aio_thread_op_foo_at':
> file.c:(.text+0x43808): undefined reference to `__get_user_bad'
> file.c:(.text+0x43838): undefined reference to `__get_user_bad'
> 
> Caused by commit
> 
>   150a0b4905f1 ("aio: add support for async openat()")

How did that code end up in linux-next anyway?
