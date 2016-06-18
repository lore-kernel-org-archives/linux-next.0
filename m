From: Manfred Spraul <manfred@colorfullife.com>
Subject: Re: linux-next: manual merge of the akpm-current tree with the tip
 tree
Date: Sat, 18 Jun 2016 21:39:26 +0200
Message-ID: <6107746f-e1b2-7de3-549f-1e422163c345@colorfullife.com>
References: <20160615152318.164b1ebd@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wm0-f46.google.com ([74.125.82.46]:34765 "EHLO
	mail-wm0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750813AbcFRTjc (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 18 Jun 2016 15:39:32 -0400
Received: by mail-wm0-f46.google.com with SMTP id 187so29387wmz.1
        for <linux-next@vger.kernel.org>; Sat, 18 Jun 2016 12:39:31 -0700 (PDT)
In-Reply-To: <20160615152318.164b1ebd@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Andrew Morton <akpm@linux-foundation.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi,

On 06/15/2016 07:23 AM, Stephen Rothwell wrote:
> Hi Andrew,
>
> Today's linux-next merge of the akpm-current tree got a conflict in:
>
>    ipc/sem.c
>
> between commit:
>
>    33ac279677dc ("locking/barriers: Introduce smp_acquire__after_ctrl_dep()")
>
> from the tip tree and commit:
>
>    a1c58ea067cb ("ipc/sem.c: Fix complex_count vs. simple op race")
>
> from the akpm-current tree.
Just in case, I have created a rediff of my patch against -tip.
And the patch with hysteresis would be ready as well.

I will send both patches.

More testers would be welcome, I can only test it on my laptop.

--
     Manfred
