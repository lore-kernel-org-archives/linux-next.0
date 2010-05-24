From: Dan Williams <dan.j.williams@intel.com>
Subject: Re: linux-next: build failure after merge of the async_tx tree
Date: Sun, 23 May 2010 20:42:38 -0700
Message-ID: <AANLkTilefCp0WI-gFvuuXM6qrCO98I3GPJdN0UO6hfLI@mail.gmail.com>
References: <20100524112405.3c62d22b.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pv0-f174.google.com ([74.125.83.174]:63279 "EHLO
	mail-pv0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755937Ab0EXDmj (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 23 May 2010 23:42:39 -0400
In-Reply-To: <20100524112405.3c62d22b.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jassi Brar <jassi.brar@samsung.com>

On Sun, May 23, 2010 at 6:24 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Dan,
>
> After merging the async_tx tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>
> In file included from drivers/dma/pl330.c:19:
> include/linux/amba/pl330.h:15:32: error: asm/hardware/pl330.h: No such file or directory

Should have caught that in the review... changed the 'select PL330' to
a 'depends on PL300' and pushed it back out.

Thanks,
Dan
