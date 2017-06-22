From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: linux-next: build failure after merge of most trees
Date: Fri, 23 Jun 2017 00:43:10 +1000
Message-ID: <20170623004310.76b79cbb@roar.ozlabs.ibm.com>
References: <20170622152441.3704b3d9@canb.auug.org.au>
        <20170622184116.0ebaabd9@roar.ozlabs.ibm.com>
        <20170622141310.GF8406@bubble.grove.modra.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pg0-f67.google.com ([74.125.83.67]:36441 "EHLO
        mail-pg0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752138AbdFVOnZ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 22 Jun 2017 10:43:25 -0400
In-Reply-To: <20170622141310.GF8406@bubble.grove.modra.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alan Modra <amodra@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, David Miller <davem@davemloft.net>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>

On Thu, 22 Jun 2017 23:43:10 +0930
Alan Modra <amodra@gmail.com> wrote:

> On Thu, Jun 22, 2017 at 06:41:16PM +1000, Nicholas Piggin wrote:
> > Is there any way for the linker to place the inputs to avoid unresolvable
> > relocations where possible?  
> 
> Not without quite a lot of work writing support for that feature.
> 

Okay, just wondering if I'd missed something. It'd probably wouldn't
be enough benefit to justify a significant amount of work. We'd be
better off looking at link time optimisation if we wanted to go that
way.

Thanks,
Nick
