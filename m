From: Joseph Fannin <jfannin@gmail.com>
Subject: Re: inux-next 0701 mv643xx_eth powerpc build failure
Date: Tue, 1 Jul 2008 23:11:12 -0400
Message-ID: <20080702031111.GA26752@nineveh.local>
References: <20080702011434.6fb403d5.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from yw-out-2324.google.com ([74.125.46.28]:21873 "EHLO
	yw-out-2324.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751185AbYGBDLZ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 1 Jul 2008 23:11:25 -0400
Received: by yw-out-2324.google.com with SMTP id 9so91636ywe.1
        for <linux-next@vger.kernel.org>; Tue, 01 Jul 2008 20:11:17 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20080702011434.6fb403d5.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Lennert Buytenhek <buytenh@wantstofly.org>

On Wed, Jul 02, 2008 at 01:14:34AM +1000, Stephen Rothwell wrote:

[next-20080701]

I'm getting a build failure on 32bit powerpc in -next, but not in mainline:

drivers/net/mv643xx_eth.c: In function 'mv643xx_eth_netpoll':
drivers/net/mv643xx_eth.c:2115: error: 'INT_CAUSE_EXT' undeclared
(first use in this function)
drivers/net/mv643xx_eth.c:2115: error: (Each undeclared identifier is
reported only once
drivers/net/mv643xx_eth.c:2115: error: for each function it appears in.)

I haven't investigated any further than a quick check if this hardware
even makes sense on 32bit powerpc -- it seems it does.  For now, I'm
just going to punt this and go to bed.  :-)

--
Joseph Fannin
jfannin@gmail.com
