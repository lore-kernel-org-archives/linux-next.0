From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: bad commit in the sunxi tree
Date: Tue, 1 Nov 2016 01:57:14 +1100
Message-ID: <20161101015714.438bfd96@canb.auug.org.au>
References: <20161025092255.3f4f59e2@canb.auug.org.au>
        <20161025094409.hhf5rg3gbzaryjom@lukather>
        <20161027104225.4f0f2774@canb.auug.org.au>
        <20161027204137.ef6kxlzyvftcdomn@lukather>
        <8737jd2pg6.fsf@concordia.ellerman.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:60037 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S943684AbcJaO5Y (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 31 Oct 2016 10:57:24 -0400
In-Reply-To: <8737jd2pg6.fsf@concordia.ellerman.id.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Michael,

On Mon, 31 Oct 2016 13:59:53 +1100 Michael Ellerman <mpe@ellerman.id.au> wrote:
>
> I don't run a hook, but I have a separate script which does checks like
> that. I've pulled out the Signed-off-by check into a script below, which
> might work for you, or at least give you something to start from.

Turns out that there is no hook that gets runa ta fetch time, so thanks
for this I will adapt this into my "fetch the trees" script.

-- 
Cheers,
Stephen Rothwell
