From: Steven Rostedt <srostedt@redhat.com>
Subject: Re: linux-next: ftrace tree build failure
Date: Mon, 24 Nov 2008 22:21:38 -0500
Message-ID: <1227583298.7622.9.camel@localhost.localdomain>
References: <20081125140719.03a8cdfb.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.redhat.com ([66.187.237.31]:47523 "EHLO mx2.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752751AbYKYDWi (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 24 Nov 2008 22:22:38 -0500
In-Reply-To: <20081125140719.03a8cdfb.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org, "Luis R. Rodriguez" <lrodriguez@atheros.com>, "John W. Linville" <linville@tuxdriver.com>, "David S. Miller" <davem@davemloft.net>


On Tue, 2008-11-25 at 14:07 +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next build (x86_64 allmodconfig) failed like this:
> 
> net/wireless/reg.c:348:29: error: macro "if" passed 2 arguments, but takes just 1
> net/wireless/reg.c: In function 'ignore_request':
> net/wireless/reg.c:349: error: expected '(' before 'return'
> 
> This is clearly a bug in in the above file and should be fixed there, so
> I have applied the following patch for today.  I expect some patch to fix
> this to appear in the wireless-current or net-current tree very soon.
> 

Ingo already has this in his queue too.

http://marc.info/?l=linux-kernel&m=122745649425646&w=2

-- Steve
