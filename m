From: Andrey Konovalov <andreyknvl@google.com>
Subject: Re: linux-next: Signed-off-by missing for commit in the usb.current tree
Date: Tue, 12 Dec 2017 22:00:50 +0100
Message-ID: <CAAeHK+w0_W-EGG55kMfCgH4jbPgsvBL2Yi4yoPNT87jKLBMiKQ@mail.gmail.com>
References: <20171213075057.41f68b05@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-oi0-f41.google.com ([209.85.218.41]:40726 "EHLO
        mail-oi0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752376AbdLLVAw (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 12 Dec 2017 16:00:52 -0500
Received: by mail-oi0-f41.google.com with SMTP id w125so156462oie.7
        for <linux-next@vger.kernel.org>; Tue, 12 Dec 2017 13:00:52 -0800 (PST)
In-Reply-To: <20171213075057.41f68b05@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Alan Stern <stern@rowland.harvard.edu>
Cc: Greg KH <greg@kroah.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Tue, Dec 12, 2017 at 9:50 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Greg,
>
> Commit
>
>   32fd87b3bbf5 ("USB: core: only clean up what we allocated")
>
> is missing a Signed-off-by from its author.

AFAIU, Alan has a better patch ("USB: core: prevent malicious
bNumInterfaces overflow") so this one will likely be dropped.

Thanks!

>
> --
> Cheers,
> Stephen Rothwell
