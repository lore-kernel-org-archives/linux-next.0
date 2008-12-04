From: Richard Purdie <rpurdie@rpsys.net>
Subject: Re: linux-next: backlight tree build failure
Date: Thu, 04 Dec 2008 16:18:55 +0000
Message-ID: <1228407535.5437.6.camel@dax.rpnet.com>
References: <20081204163059.98d02c8c.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from tim.rpsys.net ([194.106.48.114]:49502 "EHLO tim.rpsys.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751873AbYLDQTV (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 4 Dec 2008 11:19:21 -0500
In-Reply-To: <20081204163059.98d02c8c.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org

Hi Stephen,

On Thu, 2008-12-04 at 16:30 +1100, Stephen Rothwell wrote:
> Hi Richard,
> 
> Today's linux-next build (x86_64 allmodconfig) failed like this:
> 
> drivers/video/backlight/tdo24m.c:17:30: error: linux/spi/tdo24m.h: No such file or directory
> drivers/video/backlight/tdo24m.c: In function 'tdo24m_probe':
> drivers/video/backlight/tdo24m.c:337: error: storage size of 'model' isn't known
> drivers/video/backlight/tdo24m.c:342: error: dereferencing pointer to incomplete type
> drivers/video/backlight/tdo24m.c:344: error: 'TDO24M' undeclared (first use in this function)
> drivers/video/backlight/tdo24m.c:344: error: (Each undeclared identifier is reported only once
> drivers/video/backlight/tdo24m.c:344: error: for each function it appears in.)
> drivers/video/backlight/tdo24m.c:379: error: 'TDO35S' undeclared (first use in this function)
> drivers/video/backlight/tdo24m.c:337: warning: unused variable 'model'
> 
> I have dropped the backlight tree for today.  More care, please.

Sorry about that, there is a missing dependency for that change and I'll
make sure these get merged in the right order.

Cheers,

Richard
