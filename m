From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build warning after merge of the tip tree
Date: Wed, 14 Dec 2016 19:10:43 +1100
Message-ID: <20161214191043.680ca964@canb.auug.org.au>
References: <20161214132828.1d128963@canb.auug.org.au>
        <20161214072411.GA1635@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:48959 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752752AbcLNIKs (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 14 Dec 2016 03:10:48 -0500
In-Reply-To: <20161214072411.GA1635@gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Artem Bityutskiy <dedekind1@gmail.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Richard Weinberger <richard@nod.at>

Hi Ingo,

On Wed, 14 Dec 2016 08:24:11 +0100 Ingo Molnar <mingo@kernel.org> wrote:
>
> FYI, f4f61d2cc6d8 is not in the -tip tree, so it cannot possibly have introduced 
> this warning.

Yeah, I know, but the warning only seemed to happen after merging the
tip tree.  I would have expected it to appear much earlier like when I
merged the ubifs tree.  I figured that out, but forgot to mention it,
sorry.

Actually I just checked and it did turn up then, but my heuristics did
not point it out :-(
-- 
Cheers,
Stephen Rothwell
