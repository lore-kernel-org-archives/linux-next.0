From: Dinh Nguyen <dinguyen@altera.com>
Subject: Re: linux-next: build failure after merge of the l2-mtd tree
Date: Thu, 11 Oct 2012 22:51:19 -0600
Message-ID: <1350017479.22202.2.camel@dinh-ubuntu>
References: <20121012111451.ad2a5db59d470cf24393226a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from tx2ehsobe004.messaging.microsoft.com ([65.55.88.14]:42391 "EHLO
	tx2outboundpool.messaging.microsoft.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752858Ab2JLDvq (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Thu, 11 Oct 2012 23:51:46 -0400
In-Reply-To: <20121012111451.ad2a5db59d470cf24393226a@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Artem Bityutskiy <dedekind1@gmail.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Stephen,

On Fri, 2012-10-12 at 11:14 +1100, Stephen Rothwell wrote:
> Hi Artem,
> 
> After merging the l2-mtd tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> ERROR: "denali_init" [drivers/mtd/nand/denali_pci.ko] undefined!
> ERROR: "denali_remove" [drivers/mtd/nand/denali_pci.ko] undefined!
> 
> Probably caused by commit 305b1ee29c8e ("mtd: denali: split the generic
> driver and PCI layer").
> 
> I have used the l2-mtd tree from next-20121011 for today.

Sorry about that. I just sent a patch to fix this. Please disregard the
first email, I forgot to include Artem in the email.

Thanks,
Dinh
