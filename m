From: Joe Perches <joe@perches.com>
Subject: Re: [PATCH linux-next] treewide: remove unnecessary semicolons
Date: Thu, 13 Aug 2009 03:21:07 -0700
Message-ID: <1250158868.28285.26.camel@Joe-Laptop.home>
References: <1248472866.3498.79.camel@Joe-Laptop.home>
	 <alpine.LNX.2.00.0908131155510.25797@wotan.suse.de>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 136-022.dsl.LABridge.com ([206.117.136.22]:3275 "EHLO
	mail.perches.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751410AbZHMKVM (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 13 Aug 2009 06:21:12 -0400
In-Reply-To: <alpine.LNX.2.00.0908131155510.25797@wotan.suse.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jiri Kosina <jkosina@suse.cz>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, David Miller <davem@davemloft.net>, Alan Cox <alan@lxorguk.ukuu.org.uk>, Andrew Morton <akpm@linux-foundation.org>

On Thu, 2009-08-13 at 11:57 +0200, Jiri Kosina wrote:
> On Fri, 24 Jul 2009, Joe Perches wrote:
> 
> > Previous discussion at: http://lkml.org/lkml/2009/6/28/288
> > Signed-off-by: Joe Perches <joe@perches.com>
> 
> Thanks. I have one more request if you don't mind -- please take out the 
> drivers/staging part and push that one individually to Greg. I'll then 
> merge the remaining bits through trivial tree.
> 
> The code in staging tree is supposed to be changing rapidly, so we'll be 
> getting conflicts very often.

I could do that or you could "git apply --exclude=drivers/staging/"
Which do you prefer?
