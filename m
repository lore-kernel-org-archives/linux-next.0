From: David Riley <davidriley@google.com>
Subject: Re: [PATCH 01/12] time: Rename udelay_test.c to test_udelay.c
Date: Mon, 24 Nov 2014 14:14:25 -0800
Message-ID: <CAASgrz1GRZNK9+boQLuDaN9G_9SkXkpN+Os+A7nPen1uHQde5g@mail.gmail.com>
References: <1416599058-13836-1-git-send-email-john.stultz@linaro.org>
	<1416599058-13836-2-git-send-email-john.stultz@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-qa0-f49.google.com ([209.85.216.49]:62180 "EHLO
	mail-qa0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750759AbaKXWO0 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 24 Nov 2014 17:14:26 -0500
Received: by mail-qa0-f49.google.com with SMTP id s7so6987497qap.22
        for <linux-next@vger.kernel.org>; Mon, 24 Nov 2014 14:14:25 -0800 (PST)
In-Reply-To: <1416599058-13836-2-git-send-email-john.stultz@linaro.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: John Stultz <john.stultz@linaro.org>
Cc: lkml <linux-kernel@vger.kernel.org>, Kees Cook <keescook@chromium.org>, Greg KH <greg@kroah.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, Linux-Next <linux-next@vger.kernel.org>

On Fri, Nov 21, 2014 at 11:44 AM, John Stultz <john.stultz@linaro.org> wrote:
> Kees requested that this test module be renamed for consistency sake,
> so this patch renames the udelay_test.c file (recently added to
> tip/timers/core for 3.17) to test_udelay.c
>
> Cc: Kees Cook <keescook@chromium.org>
> Cc: Greg KH <greg@kroah.com>
> Cc: Stephen Rothwell <sfr@canb.auug.org.au>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Ingo Molnar <mingo@elte.hu>
> Cc: Linux-Next <linux-next@vger.kernel.org>
> Cc: David Riley <davidriley@chromium.org>
> Signed-off-by: John Stultz <john.stultz@linaro.org>

Reviewed-by: David Riley <davidriley@chromium.org>
