From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: linux-next: build failure in the powerpc allyesconfig build
Date: Thu, 08 Dec 2016 14:31:33 +0100
Message-ID: <3533648.l4A0kia4Vv@wuerfel>
References: <20161205162204.02c2c236@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([217.72.192.75]:53575 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752863AbcLHNbq (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 8 Dec 2016 08:31:46 -0500
In-Reply-To: <20161205162204.02c2c236@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linuxppc-dev@lists.ozlabs.org
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>

On Monday, December 5, 2016 4:22:04 PM CET Stephen Rothwell wrote:
> Hi all,
> 
> After mergeing everything but Andrew's tree, today's linux-next build
> (powerpc allyesconfig) failed like this:
> 
> kallsyms failure: relative symbol value 0xc000000000000000 out of range in relative mode
> 
> I have no idea what caused this, so I have left the powerpc allyesconfig
> build broken for now.

I get this on an x86-64 randconfig build:

kallsyms failure: relative symbol value 0xffffffff81000000 out of range in relative mode

This is probably related, so it's not something powerpc specific.

	Arnd
