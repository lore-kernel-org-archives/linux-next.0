From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: linux-next: build failure after merge of the aio tree
Date: Tue, 15 Mar 2016 17:42:41 +0100
Message-ID: <5520023.cASC7FRVoJ@wuerfel>
References: <20160315174634.6766cd88@canb.auug.org.au> <CAHp75VcjmDsgStAZVA=0EU4nQwCx-s+4kF_CsmSrrZtVpVg1bA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([217.72.192.74]:62416 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S934196AbcCOQmw (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 15 Mar 2016 12:42:52 -0400
In-Reply-To: <CAHp75VcjmDsgStAZVA=0EU4nQwCx-s+4kF_CsmSrrZtVpVg1bA@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linuxppc-dev@lists.ozlabs.org
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, Stephen Rothwell <sfr@canb.auug.org.au>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Benjamin LaHaise <bcrl@kvack.org>, linux-next <linux-next@vger.kernel.org>, Christoph Hellwig <hch@lst.de>, Al Viro <viro@zeniv.linux.org.uk>

On Tuesday 15 March 2016 16:38:51 Andy Shevchenko wrote:
> On Tue, Mar 15, 2016 at 8:46 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > Hi Benjamin,
> >
> > After merging the aio tree, today's linux-next build (powerpc
> > ppc44x_defconfig) failed like this:
> >
> > fs/built-in.o: In function `aio_thread_op_foo_at':
> > aio.c:(.text+0x4dab4): undefined reference to `__get_user_bad'
> > aio.c:(.text+0x4daec): undefined reference to `__get_user_bad'
> 
> avr32 seems affected as well and the below solution is not suitable
> (should be much more verbose in asm, I guess).
> 

ARM as well, at least for ARMv7-M.

	Arnd
