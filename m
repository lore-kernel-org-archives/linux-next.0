From: corbet@lwn.net (Jonathan Corbet)
Subject: Re: linux-next: bkl-removal/arm merge conflict
Date: Thu, 22 May 2008 08:16:25 -0600
Message-ID: <10532.1211465785@vena.lwn.net>
References: <20080522152157.57dac9f7.sfr@canb.auug.org.au>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from vena.lwn.net ([206.168.112.25]:48910 "EHLO vena.lwn.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750991AbYEVOQ0 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 22 May 2008 10:16:26 -0400
In-reply-to: Your message of "Thu, 22 May 2008 15:21:57 +1000."
             <20080522152157.57dac9f7.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Russell King <rmk@arm.linux.org.uk>

Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Today's linux-next merge of the bkl-removal tree got a conflict in
> arch/arm/common/rtctime.c between commit
> b204d462d7eae31413c5ac80ec3a32a89765fd46 ("[RTC] remove old ARM rtc
> library code") from the arm tree and commit
> f6f28a87d5f4ae2b101e64ab494267f6858631c4 ("arm-common-rtctime: BKL
> pushdown") from the bkl-removal tree.

OK, that commit has been removed.  Thanks, Stephen.

jon
