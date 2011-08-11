From: "Rafael J. Wysocki" <rjw@sisk.pl>
Subject: Re: linux-next: Tree for Aug 11 (suspend_stats build error)
Date: Thu, 11 Aug 2011 22:44:12 +0200
Message-ID: <201108112244.12547.rjw@sisk.pl>
References: <20110811162058.42b462bc80e67d7a80ecff93@canb.auug.org.au> <20110811115931.8007900d.rdunlap@xenotime.net>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ogre.sisk.pl ([217.79.144.158]:35615 "EHLO ogre.sisk.pl"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753256Ab1HKUmf (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 11 Aug 2011 16:42:35 -0400
In-Reply-To: <20110811115931.8007900d.rdunlap@xenotime.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <rdunlap@xenotime.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-pm@lists.linux-foundation.org, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Thursday, August 11, 2011, Randy Dunlap wrote:
> On Thu, 11 Aug 2011 16:20:58 +1000 Stephen Rothwell wrote:
> 
> > Hi all,
> 
> When CONFIG_PM_SLEEP is not enabled:
> 
> kernel/built-in.o: In function `suspend_stats_show':
> main.c:(.text+0x40a25): undefined reference to `suspend_stats'
> main.c:(.text+0x40a2c): undefined reference to `suspend_stats'
> main.c:(.text+0x40a32): undefined reference to `suspend_stats'
> main.c:(.text+0x40a73): undefined reference to `suspend_stats'
> main.c:(.text+0x40a82): undefined reference to `suspend_stats'
> kernel/built-in.o:main.c:(.text+0x40a91): more undefined references to `suspend_stats' follow

Should be fixed in my tree now.

Thanks,
Rafael
