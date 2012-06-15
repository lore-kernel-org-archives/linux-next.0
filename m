From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: linux-next: build failure in Linus' tree
Date: Fri, 15 Jun 2012 11:38:01 +0000
Message-ID: <201206151138.01510.arnd@arndb.de>
References: <20120614114722.0fd16fb906b6a5503cfbc51a@canb.auug.org.au> <20120614030606.GC27673@linux-sh.org> <20120614034036.GE27673@linux-sh.org>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.126.186]:64561 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755539Ab2FOLiQ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 15 Jun 2012 07:38:16 -0400
In-Reply-To: <20120614034036.GE27673@linux-sh.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Mundt <lethal@linux-sh.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linus Torvalds <torvalds@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>

On Thursday 14 June 2012, Paul Mundt wrote:
> Ok, it's because the asm-generic/bug.h __ASSEMBLY__ guarding is
> completely bogus. This should hopefully fix it once and for all.
> Sorry for the trouble.
> 
> Signed-off-by: Paul Mundt <lethal@linux-sh.org>

Acked-by: Arnd Bergmann <arnd@arndb.de>
