From: "Rafael J. Wysocki" <rjw@sisk.pl>
Subject: Re: linux-next: build failure after merge of the pm tree
Date: Fri, 19 Aug 2011 23:31:20 +0200
Message-ID: <201108192331.20553.rjw@sisk.pl>
References: <20110819234756.ef70fa07dccb6adc17d2f516@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ogre.sisk.pl ([217.79.144.158]:53695 "EHLO ogre.sisk.pl"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751399Ab1HSV3h (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 19 Aug 2011 17:29:37 -0400
In-Reply-To: <20110819234756.ef70fa07dccb6adc17d2f516@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi,

On Friday, August 19, 2011, Stephen Rothwell wrote:
> Hi Rafael,
> 
> After merging the pm tree, today's linux-next build (most of the arm and
> avr32 builds at least) failed like this:
> 
> In file included from drivers/base/power/clock_ops.c:14:
> include/linux/pm_clock.h:15: error: field 'nb' has incomplete type

Sorry about that.

> You need to include something that defines "struct notifier_block".

Right, should be fixed now.

Thanks,
Rafael
