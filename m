From: czankel <chris@zankel.net>
Subject: Re: linux-next: manual merge of the tip tree with the xtensa tree
Date: Sun, 12 Jan 2014 19:38:23 -0800
Message-ID: <52D35FAF.5050805@zankel.net>
References: <20140113142642.6e1944155b1db50d2c70abb4@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pa0-f53.google.com ([209.85.220.53]:57071 "EHLO
	mail-pa0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751213AbaAMDi1 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 12 Jan 2014 22:38:27 -0500
Received: by mail-pa0-f53.google.com with SMTP id hz1so7055965pad.26
        for <linux-next@vger.kernel.org>; Sun, 12 Jan 2014 19:38:27 -0800 (PST)
In-Reply-To: <20140113142642.6e1944155b1db50d2c70abb4@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>

Hi Stephen,

Thanks for the fix! I actually just got an updated set for most of the 
patches currently in the for_next tree for xtensa and might have to do a 
rebase to integrate them better. I'll include your fix when I come 
across the issue.

Thanks again,
-Chris

On 1/12/14 7:26 PM, Stephen Rothwell wrote:
> Hi all,
>
> Today's linux-next merge of the tip tree got a conflict in
> arch/xtensa/include/asm/barrier.h between commit dbacef090841 ("xtensa:
> add SMP support") from the xtensa tree and commit 93ea02bb8435 ("arch:
> Clean up asm/barrier.h implementations using asm-generic/barrier.h") from
> the tip tree.
>
> I fixed it up (I am pretty sure - see below) and can carry the fix as
> necessary (no action is required).
>
