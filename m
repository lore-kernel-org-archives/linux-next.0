From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: linux-next: build failure after merge of the devicetree tree
Date: Fri, 30 Jul 2010 00:11:21 -0600
Message-ID: <AANLkTiknZ8xMEj3vJKrgCVfwepGmaveV2X+Ai5BP=BYm@mail.gmail.com>
References: <20100730135721.5c1df39c.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-yw0-f46.google.com ([209.85.213.46]:40985 "EHLO
	mail-yw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750945Ab0G3GLm (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 30 Jul 2010 02:11:42 -0400
In-Reply-To: <20100730135721.5c1df39c.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Anatolij Gustschin <agust@denx.de>

On Thu, Jul 29, 2010 at 9:57 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Grant,
>
> After merging the devicetree tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>
> drivers/spi/xilinx_spi.c: In function 'xilinx_spi_init':
> drivers/spi/xilinx_spi.c:393: error: 'struct device' has no member named 'of_node'
> drivers/spi/xilinx_spi.c:393: error: 'struct device' has no member named 'of_node'
>
> Caused by commit 65b25b3c3080d96c42b31e0d97e7fcf4fabceeb4 ("of/spi: call
> of_register_spi_devices() from spi core code").
>
> I have used the devicetree tree from next-20100729 for today.

Thanks Stephen.  Should be fixed now.

g.
