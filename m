From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure in the powerpc allyesconfig build
Date: Mon, 5 Dec 2016 16:24:31 +1100
Message-ID: <20161205162431.71013317@canb.auug.org.au>
References: <20161205162204.02c2c236@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:37945 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750951AbcLEFYd (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 5 Dec 2016 00:24:33 -0500
In-Reply-To: <20161205162204.02c2c236@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, PowerPC <linuxppc-dev@lists.ozlabs.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>

Hi all,

On Mon, 5 Dec 2016 16:22:04 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> After mergeing everything but Andrew's tree, today's linux-next build
> (powerpc allyesconfig) failed like this:
> 
> kallsyms failure: relative symbol value 0xc000000000000000 out of range in relative mode
> 
> I have no idea what caused this, so I have left the powerpc allyesconfig
> build broken for now.

Just as a data point, I tried reverting commit

  dadc4a1bb9f0 ("powerpc/64: Fix placement of .text to be immediately following .head.text")

but that did not help.
-- 
Cheers,
Stephen Rothwell
