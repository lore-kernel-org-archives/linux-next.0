From: Tony Luck <tony.luck@gmail.com>
Subject: Re: [patch] lib, arch: add filter argument to show_mem and fix
 private implementations
Date: Fri, 25 Mar 2011 09:56:12 -0700
Message-ID: <AANLkTin5h8MZVKVKDyVyoiTYeYaiF2Z6Vjv=WOdiT+of@mail.gmail.com>
References: <20110324143019.cce06baa.sfr@canb.auug.org.au>
	<20110323211346.9ae51356.akpm@linux-foundation.org>
	<alpine.DEB.2.00.1103241457030.20718@chino.kir.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:57515 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753139Ab1CYQ4N (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 25 Mar 2011 12:56:13 -0400
In-Reply-To: <alpine.DEB.2.00.1103241457030.20718@chino.kir.corp.google.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Rientjes <rientjes@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Linus Torvalds <torvalds@linux-foundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, James Bottomley <James.Bottomley@hansenpartnership.com>

On Thu, Mar 24, 2011 at 3:18 PM, David Rientjes <rientjes@google.com> wrote:
> I've done that below, I hope it's not too late to prevent the revert.
> Compile tested on arm, ia64, powerpc, and sparc32 defconfig.

ia64 builds and boots again - thanks David.

-Tony

But now I see an occasional kernel unaligned access in "m_stop()" ...
cscope says we have four
different functions named "m_stop()" ... process running was mingetty
