From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: linux-next: build failure after merge of the char-misc tree
Date: Mon, 20 Mar 2017 13:23:49 +0100
Message-ID: <CAK8P3a3G1qHa0UhMO_EUnC87kLOQR70wz5ne6j+ZFfbejR_RZg@mail.gmail.com>
References: <20170320134414.25f2e3d6@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170320134414.25f2e3d6@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Greg KH <greg@kroah.com>, linux-next@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Cyril Bur <cyrilbur@gmail.com>, Joel Stanley <joel@jms.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>
List-Id: linux-next.vger.kernel.org

On Mon, Mar 20, 2017 at 3:44 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi all,
>
> After merging the char-misc tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>
> drivers/misc/aspeed-lpc-ctrl.c: In function 'aspeed_lpc_ctrl_mmap':
> drivers/misc/aspeed-lpc-ctrl.c:51:9: error: implicit declaration of function 'pgprot_dmacoherent' [-Werror=implicit-function-declaration]
>   prot = pgprot_dmacoherent(prot);

A lot of other drivers (including /dev/mem) just use pgprot_noncached() or
pgprot_writecombine(), which would make the code portable and might be
what you want here as well.

pgprot_dmacoherent() is meant specifically for mapping RAM that is used
for DMA buffers that come from dma_alloc_coherent(), which doesn't seem
to be the case here.

What kind of address range is this really?

> drivers/misc/aspeed-lpc-ctrl.c:51:7: error: incompatible types when assigning to type 'pgprot_t {aka struct pgprot}' from type 'int'
>   prot = pgprot_dmacoherent(prot);
>        ^
> In file included from include/linux/miscdevice.h:6:0,
>                  from drivers/misc/aspeed-lpc-ctrl.c:11:
> drivers/misc/aspeed-lpc-ctrl.c: In function 'aspeed_lpc_ctrl_probe':
> drivers/misc/aspeed-lpc-ctrl.c:232:17: warning: format '%x' expects argument of type 'unsigned int', but argument 3 has type 'phys_addr_t {aka long long unsigned int}' [-Wformat=]
>    dev_info(dev, "Loaded at 0x%08x (0x%08x)\n",

This should just use the "%pap" for printing a phys_addr_t, otherwise we
get the same warning on ARM in some configurations.

      Arnd
