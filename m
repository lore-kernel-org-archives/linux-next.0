From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: linux-next: build failure after merge of the asm-generic tree
Date: Tue, 30 Sep 2014 12:00:10 +0200
Message-ID: <4061479.RDp9BKRgRN@wuerfel>
References: <20140926200251.78f0d713@canb.auug.org.au> <6184197.FUKmdXcAaQ@wuerfel> <20140930083116.753ae631@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.131]:51757 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751181AbaI3KA1 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 30 Sep 2014 06:00:27 -0400
In-Reply-To: <20140930083116.753ae631@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Will Deacon <will.deacon@arm.com>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "David S. Miller" <davem@davemloft.net>

On Tuesday 30 September 2014 08:31:16 Stephen Rothwell wrote:
> Hi Arnd,
> 
> On Fri, 26 Sep 2014 13:14:45 +0200 Arnd Bergmann <arnd@arndb.de> wrote:
> >
> > Thanks, applied on top with Stephen's full report in the commit
> > message and your Ack.
> 
> I look at your tree today, and its empty ... just checking that you
> didn't forget to push or something.
> 

Thanks for the notification. I got overloaded with regressions and
ended up backing it all out for now. I still hope to get the subset
that Will did merged, but first need to split out some or all of
Thierry's patches that caused the regressions.

	Arnd
