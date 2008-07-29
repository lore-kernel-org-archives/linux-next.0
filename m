From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: build failure
Date: Tue, 29 Jul 2008 18:42:57 +0200
Message-ID: <20080729164256.GA540@elte.hu>
References: <20080729180317.94c64634.sfr@canb.auug.org.au> <20080729085815.GA1301@elte.hu> <20080729202731.F18F.KOSAKI.MOTOHIRO@jp.fujitsu.com> <20080729114029.GA3836@elte.hu> <alpine.LFD.1.10.0807290927240.3334@nehalem.linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.mail.elte.hu ([157.181.151.9]:56266 "EHLO mx2.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751662AbYG2QnX (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 29 Jul 2008 12:43:23 -0400
Content-Disposition: inline
In-Reply-To: <alpine.LFD.1.10.0807290927240.3334@nehalem.linux-foundation.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: KOSAKI Motohiro <kosaki.motohiro@jp.fujitsu.com>, Stephen Rothwell <sfr@canb.auug.org.au>, David Miller <davem@davemloft.net>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Mike Travis <travis@sgi.com>


* Linus Torvalds <torvalds@linux-foundation.org> wrote:

> In contrast, "address-of lvalue" is _guaranteed_ to not do anything 
> stupid like that, and gives just the address-of.
> 
> Oh, and I was wrong about the &*x losing the 'const'. It doesn't. So I 
> think Stephen's patch is fine after all - if somebody tries to modify 
> the end result through the pointer, it will give a big compiler 
> warning.

yeah, both variants do that, i've checked it earlier today - i tried to 
find a way to get something more drastic than a compiler warning. (but 
failed)

	Ingo
