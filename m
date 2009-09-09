From: Dan Williams <dan.j.williams@intel.com>
Subject: Re: linux-next: async_tx tree build failure
Date: Tue, 8 Sep 2009 18:35:12 -0700
Message-ID: <e9c3a7c20909081835t3cafea3cmb518f83ef12d3599@mail.gmail.com>
References: <20090907130831.c0180edd.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-px0-f177.google.com ([209.85.216.177]:49801 "EHLO
	mail-px0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752851AbZIIBfK (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 8 Sep 2009 21:35:10 -0400
In-Reply-To: <20090907130831.c0180edd.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Maciej Sosnowski <maciej.sosnowski@intel.com>

On Sun, Sep 6, 2009 at 8:08 PM, Stephen Rothwell<sfr@canb.auug.org.au> wrote:
> Hi Dan,
>
> Today's linux-next build (x86_64 allmodconfig) failed like this:
>
> drivers/dma/ioat/dma_v2.c: In function 'ioat2_enumerate_channels':
> drivers/dma/ioat/dma_v2.c:346: error: too few arguments to function 'i7300_idle_platform_probe'
>
> Caused by commit feed1bce2e6dc7e3307f122ac95be6741840bee8 ("ioat2,3:
> convert to a true ring buffer").
>
> I have used the version of the async_tc tree from next-20090904 for today.

Thanks for the report, I have pushed out a fix for this and some other
fallout from adding CONFIG_I7300_IDLE=y to my build tests.

Regards,
Dan
