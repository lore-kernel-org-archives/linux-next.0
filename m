From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: linux-next: build failure in the powerpc allyesconfig build
Date: Mon, 5 Dec 2016 16:41:53 +1100
Message-ID: <20161205164153.43c84010@roar.ozlabs.ibm.com>
References: <20161205162204.02c2c236@canb.auug.org.au>
        <20161205162431.71013317@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pg0-f67.google.com ([74.125.83.67]:33328 "EHLO
        mail-pg0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750841AbcLEFmI (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 5 Dec 2016 00:42:08 -0500
In-Reply-To: <20161205162431.71013317@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, PowerPC <linuxppc-dev@lists.ozlabs.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, 5 Dec 2016 16:24:31 +1100
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> On Mon, 5 Dec 2016 16:22:04 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > After mergeing everything but Andrew's tree, today's linux-next build
> > (powerpc allyesconfig) failed like this:
> > 
> > kallsyms failure: relative symbol value 0xc000000000000000 out of range in relative mode
> > 
> > I have no idea what caused this, so I have left the powerpc allyesconfig
> > build broken for now.  
> 
> Just as a data point, I tried reverting commit
> 
>   dadc4a1bb9f0 ("powerpc/64: Fix placement of .text to be immediately following .head.text")
> 
> but that did not help.

In scripts/kallsyms.c, is there a table[i].sym string you can print?
