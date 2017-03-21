From: Cyril Bur <cyrilbur@gmail.com>
Subject: Re: linux-next: build failure after merge of the char-misc tree
Date: Tue, 21 Mar 2017 11:36:00 +1100
Message-ID: <1490056560.20591.1.camel@gmail.com>
References: <20170320134414.25f2e3d6@canb.auug.org.au>
         <CAK8P3a3G1qHa0UhMO_EUnC87kLOQR70wz5ne6j+ZFfbejR_RZg@mail.gmail.com>
         <1490055482.2504.43.camel@kernel.crashing.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pg0-f67.google.com ([74.125.83.67]:33033 "EHLO
        mail-pg0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753258AbdCUAiI (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 20 Mar 2017 20:38:08 -0400
In-Reply-To: <1490055482.2504.43.camel@kernel.crashing.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Arnd Bergmann <arnd@arndb.de>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Greg KH <greg@kroah.com>, linux-next@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Joel Stanley <joel@jms.id.au>

On Tue, 2017-03-21 at 11:18 +1100, Benjamin Herrenschmidt wrote:
> On Mon, 2017-03-20 at 13:23 +0100, Arnd Bergmann wrote:
> > On Mon, Mar 20, 2017 at 3:44 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > > Hi all,
> > > 
> > > After merging the char-misc tree, today's linux-next build (x86_64
> > > allmodconfig) failed like this:
> > > 
> > > drivers/misc/aspeed-lpc-ctrl.c: In function 'aspeed_lpc_ctrl_mmap':
> > > drivers/misc/aspeed-lpc-ctrl.c:51:9: error: implicit declaration of function 'pgprot_dmacoherent' [-Werror=implicit-function-declaration]
> > >   prot = pgprot_dmacoherent(prot);
> > 
> > A lot of other drivers (including /dev/mem) just use pgprot_noncached() or
> > pgprot_writecombine(), which would make the code portable and might be
> > what you want here as well.
> > 
> > pgprot_dmacoherent() is meant specifically for mapping RAM that is used
> > for DMA buffers that come from dma_alloc_coherent(), which doesn't seem
> > to be the case here.
> > 
> > What kind of address range is this really?
> 
> It's a piece of RAM that we reserve via a reserved region, which will
> be accessed by HW (sort-of-DMA, ie, the "host" system will access that
> using FW cycles on the LPC bus which we map to that reserved region of
> memory).
> 
> Joel, Cyril, can you send a 1-liner patch to change that to
> pgprot_noncached() ?
> 

Sure. Just to be clear - we want to keep COMPILE_TEST in kconfig?

Also I can't help but notice this: 
https://lists.ozlabs.org/pipermail/openbmc/2017-January/006219.html
[v3 of the series]
vs
https://lists.ozlabs.org/pipermail/openbmc/2017-February/006462.html
[v4 of the series]


> Cheers,
> Ben.
> 
> > > drivers/misc/aspeed-lpc-ctrl.c:51:7: error: incompatible types when assigning to type 'pgprot_t {aka struct pgprot}' from type 'int'
> > >   prot = pgprot_dmacoherent(prot);
> > >        ^
> > > In file included from include/linux/miscdevice.h:6:0,
> > >                  from drivers/misc/aspeed-lpc-ctrl.c:11:
> > > drivers/misc/aspeed-lpc-ctrl.c: In function 'aspeed_lpc_ctrl_probe':
> > > drivers/misc/aspeed-lpc-ctrl.c:232:17: warning: format '%x' expects argument of type 'unsigned int', but argument 3 has type 'phys_addr_t {aka long long unsigned int}' [-Wformat=]
> > >    dev_info(dev, "Loaded at 0x%08x (0x%08x)\n",
> > 
> > This should just use the "%pap" for printing a phys_addr_t, otherwise we
> > get the same warning on ARM in some configurations.

Thanks Arnd, I'll address that too.

> > 
> >       Arnd
