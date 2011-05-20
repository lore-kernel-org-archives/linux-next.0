From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: linux-next: build failure in Linus' tree
Date: Thu, 19 May 2011 18:19:30 -0700
Message-ID: <BANLkTi=f5SxiAz-rJeb_Yh5M9W4OC+aY0g@mail.gmail.com>
References: <20110520111516.784c0c9c.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp1.linux-foundation.org ([140.211.169.13]:35556 "EHLO
	smtp1.linux-foundation.org" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S934603Ab1ETBUV convert rfc822-to-8bit
	(ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 19 May 2011 21:20:21 -0400
In-Reply-To: <20110520111516.784c0c9c.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, May 19, 2011 at 6:15 PM, Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
>
> reverting commit e66eed651fd1 ("list: remove prefetching from regular
> list iterators"). =A0This is, of course, why we like to put stuff int=
o
> linux-next before it goes into your tree :-)

Ahhah. Another case that magically depended on <linux/list.h> silently
including half the universe thanks to <linux/prefetch.h> (which in
turn included all manner of helper headers).

> I have applied this patch for today:

Looks good, I'll take it.

                        Linus
