From: Benjamin LaHaise <bcrl@kvack.org>
Subject: Re: linux-next: build failure after merge of the aio tree
Date: Tue, 15 Mar 2016 12:22:28 -0400
Message-ID: <20160315162228.GP17923@kvack.org>
References: <20160315174634.6766cd88@canb.auug.org.au> <20160315161901.GA2713@sudip-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from kanga.kvack.org ([205.233.56.17]:34285 "EHLO kanga.kvack.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751048AbcCOQW3 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 15 Mar 2016 12:22:29 -0400
Content-Disposition: inline
In-Reply-To: <20160315161901.GA2713@sudip-laptop>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, linuxppc-dev@lists.ozlabs.org, Al Viro <viro@ZenIV.linux.org.uk>, Christoph Hellwig <hch@lst.de>

On Tue, Mar 15, 2016 at 04:19:02PM +0000, Sudip Mukherjee wrote:
> On Tue, Mar 15, 2016 at 05:46:34PM +1100, Stephen Rothwell wrote:
> > Hi Benjamin,
> > 
> > After merging the aio tree, today's linux-next build (powerpc
> > ppc44x_defconfig) failed like this:
> > 
> > fs/built-in.o: In function `aio_thread_op_foo_at':
> > aio.c:(.text+0x4dab4): undefined reference to `__get_user_bad'
> > aio.c:(.text+0x4daec): undefined reference to `__get_user_bad'
> > 
> > Caused by commit
> > 
> >   150a0b4905f1 ("aio: add support for async openat()")
> > 
> > despite commit
> > 
> >   d2f7a973e11e ("aio: don't use __get_user() for 64 bit values")
> > 
> > This is due to a bug in the powerpc __get_user_check() macro (the return
> > value is defined to be "unsigned long" which is only 32 bits on a 32
> > bit platform).
> 
> m68k allmodconfig and all defs of m32r fails while building next-20160315.
> 
> regards
> sudip

I've removed everything from the aio-next.git tree for now.  Will revisit 
after the merge window.

		-ben
-- 
"Thought is the essence of where you are now."
