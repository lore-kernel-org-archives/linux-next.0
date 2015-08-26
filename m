From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: linux-next: build failure after merge of the i2c tree
Date: Tue, 25 Aug 2015 17:01:39 -0700
Message-ID: <CAKdAkRQqYXoTkkf=qh9KRJvJx5GhE=mui8ijq6r5GU1n-qWdnw@mail.gmail.com>
References: <20150825105102.742ff687@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-oi0-f41.google.com ([209.85.218.41]:33477 "EHLO
	mail-oi0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755977AbbHZABk (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 25 Aug 2015 20:01:40 -0400
In-Reply-To: <20150825105102.742ff687@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Wolfram Sang <wsa@the-dreams.de>, linux-next <linux-next@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>, Vignesh R <vigneshr@ti.com>

On Mon, Aug 24, 2015 at 5:51 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Wolfram,
>
> After merging the i2c tree, today's linux-next build (x86_64 allmodconfig)
> failed like this:
>
> ERROR: "of_irq_get_byname" [drivers/i2c/i2c-core.ko] undefined!
>
> Caused by commit
>
>   efb6a10b761e ("i2c: allow specifying separate wakeup interrupt in device tree")
>
> I have used the i2c tree from next-20150824 for today.

Ugh, of_get_irq_byname is not exported; I'll send a patch.

Thanks.

-- 
Dmitry
