From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: linux-next: manual merge of the arm-soc tree with the arm tree
Date: Fri, 16 Mar 2012 08:31:06 +0000
Message-ID: <201203160831.07305.arnd@arndb.de>
References: <20120316174941.40421ba160741a0f6aab6611@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.126.171]:50660 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1161270Ab2CPIbZ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 16 Mar 2012 04:31:25 -0400
In-Reply-To: <20120316174941.40421ba160741a0f6aab6611@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Stephen Boyd <sboyd@codeaurora.org>, Marc Zyngier <marc.zyngier@arm.com>, Russell King <rmk@arm.linux.org.uk>

On Friday 16 March 2012, Stephen Rothwell wrote:
> Today's linux-next merge of the arm-soc tree got a conflict in
> arch/arm/mach-msm/timer.c between commit f8e56c42e4e3 ("msm: timer:
> Support sched_clock()") from the arm tree and commit 5ca709c16d0f ("ARM:
> local timers: convert MSM to runtime registration interface") from the
> arm-soc tree.

We've had a few conflicts with localtimer patches already and the
solution might be very different and nonobvious. Stephen B, please
check if linux-next still works for you with localtimer enabled.

The fix does look correct to me though.

> I fixed it up (see below) and can carry the fax as necessary.

The fax? I think email will do fine ;-)

Thanks Stephen R,

	Arnd
