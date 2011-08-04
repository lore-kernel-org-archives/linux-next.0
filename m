From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: linux-next: Tree for Aug 4 (zcache)
Date: Thu, 4 Aug 2011 14:24:37 -0700
Message-ID: <20110804142437.34e3a1ae.rdunlap@xenotime.net>
References: <20110804145834.3b1d92a9eeb8357deb84bf83@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from oproxy7-pub.bluehost.com ([67.222.55.9]:56565 "HELO
	oproxy7-pub.bluehost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1754604Ab1HDVYj (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 4 Aug 2011 17:24:39 -0400
In-Reply-To: <20110804145834.3b1d92a9eeb8357deb84bf83@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Dan Magenheimer <dan.magenheimer@oracle.com>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Nitin Gupta <ngupta@vflare.org>, driverdevel <devel@driverdev.osuosl.org>, Thadeu Lima de Souza Cascardo <cascardo@holoscopio.com>

On Thu, 4 Aug 2011 14:58:34 +1000 Stephen Rothwell wrote:

> Hi all,
> 
> Just in case anyone needs reminding:  Please do not add anything destined
> for v3.2 into linux-next included trees until after v3.1-rc1.


on i386:

drivers/built-in.o: In function `zcache_pampd_create':
zcache-main.c:(.text+0x159b8f): undefined reference to `__udivdi3'

---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
