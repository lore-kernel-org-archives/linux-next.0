From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: linux-next: manual merge of the spi tree with Linus' tree
Date: Thu, 15 Nov 2012 09:32:49 +0000
Message-ID: <CACxGe6vM0yyjB4Bs-k=y+QD1VXuxZxqWxOLvU4FWQWoWFC1Z2g@mail.gmail.com>
References: <20121115150139.178644970192d226e73e94e6@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:40691 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755946Ab2KOJdJ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 15 Nov 2012 04:33:09 -0500
Received: by mail-pb0-f46.google.com with SMTP id wy7so1029005pbc.19
        for <linux-next@vger.kernel.org>; Thu, 15 Nov 2012 01:33:09 -0800 (PST)
In-Reply-To: <20121115150139.178644970192d226e73e94e6@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Lars-Peter Clausen <lars@metafoo.de>, Mark Brown <broonie@opensource.wolfsonmicro.com>

On Thu, Nov 15, 2012 at 4:01 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Grant,
>
> Today's linux-next merge of the spi tree got a conflict in
> drivers/spi/spi-xcomm.c between commit b31659004337 ("spi: Add
> AD-FMCOMMS1-EBZ I2C-SPI bridge driver") from Linus' tree and commit
> 0e312dcca718 ("spi/xcomm: Add AD-FMCOMMS1-EBZ I2C-SPI bridge driver")
> from the spi tree.
>
> OK, so the former commit added this driver back before v3.6-rc1 with an
> author date of 2012-07-20, the latter is adding a slightly modified
> version of the dirver with an author date of 2012-05-22.
>
> I used the former version , please sort this out.

Sorry for the trouble. I've cleaned up my stale tree now.

g.
