From: Jassi Brar <jaswinder.singh@linaro.org>
Subject: Re: linux-next: Signed-off-by missing for commits in the mailbox tree
Date: Thu, 31 Aug 2017 08:42:09 +0530
Message-ID: <CAJe_ZhcsD=CEaF3bn5ThyOfvuM6hz0YX2TEu8_8JO+D6EaBH1Q@mail.gmail.com>
References: <20170831031504.4fb9835f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-vk0-f46.google.com ([209.85.213.46]:34387 "EHLO
        mail-vk0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750973AbdHaDMK (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 30 Aug 2017 23:12:10 -0400
Received: by mail-vk0-f46.google.com with SMTP id s199so22342738vke.1
        for <linux-next@vger.kernel.org>; Wed, 30 Aug 2017 20:12:10 -0700 (PDT)
In-Reply-To: <20170831031504.4fb9835f@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Anup Patel <anup.patel@broadcom.com>

On 30 August 2017 at 22:45, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Jassi,
>
> Commits
>
> da91001cab90 ("mailbox: bcm-flexrm-mailbox: Set IRQ affinity hint for FlexRM ring IRQs")
> 6bee3ba26d4d ("mailbox: bcm-flexrm-mailbox: Add debugfs support")
> 73c28265c82b ("mailbox: bcm-flexrm-mailbox: Fix mask used in CMPL_START_ADDR_VALUE()")
> 33001f4ee950 ("mailbox: bcm-flexrm-mailbox: Use bitmap instead of IDA")
> 30e871dc417e ("mailbox: bcm-flexrm-mailbox: Use txdone_ack instead of txdone_poll")
>
> are missing a Signed-off-by from their committer.
>
Oops, I forgot the '-s' option. Fixed now.

Thanks.
