From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: linux-next: build failure after merge of the aio tree
Date: Wed, 16 Mar 2016 13:12:36 +0200
Message-ID: <CAHp75VcxkBTSKY_bVg3jaUPUtcyxKZ14sbu=uJK403xRmTYbbQ@mail.gmail.com>
References: <20160315174634.6766cd88@canb.auug.org.au>
	<20160315161901.GA2713@sudip-laptop>
	<20160315162228.GP17923@kvack.org>
	<15874870.hBfxUomX5V@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <15874870.hBfxUomX5V@wuerfel>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: linuxppc-dev@lists.ozlabs.org, Benjamin LaHaise <bcrl@kvack.org>, Sudip Mukherjee <sudipm.mukherjee@gmail.com>, Stephen Rothwell <sfr@canb.auug.org.au>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-next <linux-next@vger.kernel.org>, Al Viro <viro@zeniv.linux.org.uk>, Christoph Hellwig <hch@lst.de>
List-Id: linux-next.vger.kernel.org

On Wed, Mar 16, 2016 at 12:02 AM, Arnd Bergmann <arnd@arndb.de> wrote:
> On Tuesday 15 March 2016 12:22:28 Benjamin LaHaise wrote:
>> On Tue, Mar 15, 2016 at 04:19:02PM +0000, Sudip Mukherjee wrote:
>> > On Tue, Mar 15, 2016 at 05:46:34PM +1100, Stephen Rothwell wrote:
>> > > Hi Benjamin,
>> > >
>> > > After merging the aio tree, today's linux-next build (powerpc
>> > > ppc44x_defconfig) failed like this:
>> > >
>> > > fs/built-in.o: In function `aio_thread_op_foo_at':
>> > > aio.c:(.text+0x4dab4): undefined reference to `__get_user_bad'
>> > > aio.c:(.text+0x4daec): undefined reference to `__get_user_bad'
>> > >
>> > > Caused by commit
>> > >
>> > >   150a0b4905f1 ("aio: add support for async openat()")
>> > >
>> > > despite commit
>> > >
>> > >   d2f7a973e11e ("aio: don't use __get_user() for 64 bit values")
>> > >

>> I've removed everything from the aio-next.git tree for now.  Will revisit
>> after the merge window.

I think it is the best solution right now.

> I've also sent a patch that fixes the link error on ARM and that should
> work on all other architectures too.

In case of avr32 signalfd_read() fails. Does your patch help with it as well?

P.S. Bisecting shows same culprit: 150a0b4905f1 ("aio: add support for
async openat()")

-- 
With Best Regards,
Andy Shevchenko
