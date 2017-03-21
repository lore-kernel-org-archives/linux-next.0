From: Joel Stanley <joel@jms.id.au>
Subject: Re: linux-next: build failure after merge of the char-misc tree
Date: Tue, 21 Mar 2017 13:28:27 +1030
Message-ID: <CACPK8XeqWH_CVFunF2Bhpuf=2LND8QzkCoTziR5wXaaG8dbCtA@mail.gmail.com>
References: <20170320134414.25f2e3d6@canb.auug.org.au> <CAK8P3a3G1qHa0UhMO_EUnC87kLOQR70wz5ne6j+ZFfbejR_RZg@mail.gmail.com>
 <1490055482.2504.43.camel@kernel.crashing.org> <1490056560.20591.1.camel@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-yw0-f195.google.com ([209.85.161.195]:36117 "EHLO
        mail-yw0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755307AbdCUDAv (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 20 Mar 2017 23:00:51 -0400
In-Reply-To: <1490056560.20591.1.camel@gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Cyril Bur <cyrilbur@gmail.com>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Arnd Bergmann <arnd@arndb.de>, Stephen Rothwell <sfr@canb.auug.org.au>, Greg KH <greg@kroah.com>, linux-next@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Tue, Mar 21, 2017 at 11:06 AM, Cyril Bur <cyrilbur@gmail.com> wrote:
> On Tue, 2017-03-21 at 11:18 +1100, Benjamin Herrenschmidt wrote:
>> On Mon, 2017-03-20 at 13:23 +0100, Arnd Bergmann wrote:
>> > On Mon, Mar 20, 2017 at 3:44 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>> > > Hi all,
>> > >
>> > > After merging the char-misc tree, today's linux-next build (x86_64
>> > > allmodconfig) failed like this:
>> > >
>> > > drivers/misc/aspeed-lpc-ctrl.c: In function 'aspeed_lpc_ctrl_mmap':
>> > > drivers/misc/aspeed-lpc-ctrl.c:51:9: error: implicit declaration of function 'pgprot_dmacoherent' [-Werror=implicit-function-declaration]
>> > >   prot = pgprot_dmacoherent(prot);
>> >
>> > A lot of other drivers (including /dev/mem) just use pgprot_noncached() or
>> > pgprot_writecombine(), which would make the code portable and might be
>> > what you want here as well.
>> >
>> > pgprot_dmacoherent() is meant specifically for mapping RAM that is used
>> > for DMA buffers that come from dma_alloc_coherent(), which doesn't seem
>> > to be the case here.
>> >
>> > What kind of address range is this really?
>>
>> It's a piece of RAM that we reserve via a reserved region, which will
>> be accessed by HW (sort-of-DMA, ie, the "host" system will access that
>> using FW cycles on the LPC bus which we map to that reserved region of
>> memory).
>>
>> Joel, Cyril, can you send a 1-liner patch to change that to
>> pgprot_noncached() ?
>>
>
> Sure. Just to be clear - we want to keep COMPILE_TEST in kconfig?

Yep. With the change that Ben suggested we should be ok.

pgprot_noncached has a fall back definition in
include/asm-generic/pgtable.h, so all platforms will compile.

Cheers,

Joel
