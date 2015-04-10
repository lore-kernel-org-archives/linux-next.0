From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: linux-next: build failure after merge of the gpio tree
Date: Fri, 10 Apr 2015 11:35:04 +0200
Message-ID: <CACRpkdax-5ZW+q+4kzsV1SN7K=24-WYt9N0kpHFmLPnV6tE7rw@mail.gmail.com>
References: <20150410190829.75f92150@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-la0-f51.google.com ([209.85.215.51]:33334 "EHLO
	mail-la0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753963AbbDJJfH (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 10 Apr 2015 05:35:07 -0400
Received: by layy10 with SMTP id y10so9150038lay.0
        for <linux-next@vger.kernel.org>; Fri, 10 Apr 2015 02:35:05 -0700 (PDT)
In-Reply-To: <20150410190829.75f92150@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>

On Fri, Apr 10, 2015 at 11:08 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Linus,
>
> After merging the gpio tree, today's linux-next build (x86_64 allmodconfig)
> failed like this:
>
> drivers/gpio/gpio-sch.c:28:32: fatal error: uapi/linux/pci_ids.h: No such file or directory
>  #include <uapi/linux/pci_ids.h>
>                                 ^
>
> Caused by commit d1e10dc8c104 ("gpio: sch: use uapi/linux/pci_ids.h
> directly"). Clearly this depends on some other patch.

Oh OK so much for not reading patch 0.

OK I'm taking it out of my tree,
Michael, please use my ACK and handle this however you prefer.

Yours,
Linus Walleij
