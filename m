From: Jassi Brar <jaswinder.singh@linaro.org>
Subject: Re: linux-next: build failure after merge of the mailbox tree
Date: Wed, 4 Nov 2015 08:27:20 +0530
Message-ID: <CAJe_Zhe3iL=H9E1uVTLv959eVYDxzZMre8D6m8iOJbzDsFg0Nw@mail.gmail.com>
References: <20151101231253.64beff47@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-yk0-f175.google.com ([209.85.160.175]:32994 "EHLO
	mail-yk0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752380AbbKDC5V (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 3 Nov 2015 21:57:21 -0500
Received: by ykft191 with SMTP id t191so50662228ykf.0
        for <linux-next@vger.kernel.org>; Tue, 03 Nov 2015 18:57:20 -0800 (PST)
In-Reply-To: <20151101231253.64beff47@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>, Lee Jones <lee.jones@linaro.org>

On 1 November 2015 at 17:42, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Jassi,
>
> After merging the mailbox tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>
> drivers/mailbox/mailbox-test.c: In function 'mbox_test_receive_message':
> drivers/mailbox/mailbox-test.c:226:11: error: implicit declaration of function '__io_virt' [-Werror=implicit-function-declaration]
>            __io_virt(tdev->mmio), MBOX_MAX_MSG_LEN, true);
>            ^
>
> Caused by commit
>
>   a133f8b65d59 ("mailbox: mailbox-test: Correctly repair Sparse warnings")
>
> I have used the mailbox tree from next-20151022 for today.
>
Lee, would you please send a fix for your last fix please?

Thanks.
