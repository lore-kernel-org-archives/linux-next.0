From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build warning after merge of the clk tree
Date: Mon, 12 Dec 2016 19:19:57 +1100
Message-ID: <20161212191957.0d607489@canb.auug.org.au>
References: <20161212083944.5b6f2b54@canb.auug.org.au>
        <20161212090521.0450504e@bbrezillon>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:41265 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932105AbcLLIUA (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 12 Dec 2016 03:20:00 -0500
In-Reply-To: <20161212090521.0450504e@bbrezillon>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Eric Anholt <eric@anholt.net>

Hi Boris,

On Mon, 12 Dec 2016 09:05:21 +0100 Boris Brezillon <boris.brezillon@free-electrons.com> wrote:
>
> May I ask which toolchain you're using, because my gcc failed to detect
> this uninitialized variable (and this is not the first time I have this
> problem).

I use a powerpc-le hosted cross compiler gcc-5.2.0.

-- 
Cheers,
Stephen Rothwell
