From: Jassi Brar <jassisinghbrar@gmail.com>
Subject: Re: linux-next: build failure after merge of the async_tx tree
Date: Mon, 24 May 2010 10:59:22 +0900
Message-ID: <AANLkTilGB0xf7qSDAdFTlaRgcqmf0PexkfczaKCFG06C@mail.gmail.com>
References: <20100524112405.3c62d22b.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-vw0-f46.google.com ([209.85.212.46]:60693 "EHLO
	mail-vw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753628Ab0EXB7X convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 23 May 2010 21:59:23 -0400
In-Reply-To: <20100524112405.3c62d22b.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Dan Williams <dan.j.williams@intel.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jassi Brar <jassi.brar@samsung.com>

On Mon, May 24, 2010 at 10:24 AM, Stephen Rothwell <sfr@canb.auug.org.a=
u> wrote:

=2E....

> Caused by commit 0376653c268fce662831fbd109ce9811b25c16c2 ("DMA: PL33=
0:
> Add dma api driver"). =C2=A0Maybe this depends on a particular archit=
ecture?

This driver is for any platform that has the ARM's Primcell DMAC
PL330. So there is no dependency on ARCH_xxxx
Any platform with such a DMAC should select PL330 and this driver
had better be build depending upon PL330 rather than selecting  PL330.

Something like...

config PL330_DMA
       tristate "DMA API Driver for PL330"
       select DMA_ENGINE
-       select PL330
+      depends on PL330
       help
         Select if your platform has one or more PL330 DMACs.
         You need to provide platform specific settings via
         platform_data for a dma-pl330 device.

I am not aware of how such issues are fixed at this stage, please
let me know what is expected of me.

Regards.
