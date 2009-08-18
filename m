From: "Rafael J. Wysocki" <rjw@sisk.pl>
Subject: Re: linux-next: suspend tree build failure
Date: Tue, 18 Aug 2009 23:43:32 +0200
Message-ID: <200908182343.32375.rjw@sisk.pl>
References: <20090818183049.8bde1ee6.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ogre.sisk.pl ([217.79.144.158]:55989 "EHLO ogre.sisk.pl"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751222AbZHRVnE (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 18 Aug 2009 17:43:04 -0400
In-Reply-To: <20090818183049.8bde1ee6.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Tuesday 18 August 2009, Stephen Rothwell wrote:
> Hi Rafael,

Hi,

> Today's linux-next build (i386 defconfig) failed like this:
> 
> drivers/base/power/main.c: In function 'device_pm_init':
> drivers/base/power/main.c:59: error: 'struct dev_pm_info' has no member named 'lock'

Argh, that line shouldn't even be there.

> Caused by commit ea8e84f27325d9ddc7692f728a10e0a22cd59f52 ("PM: Introduce
> core framework for run-time PM of I/O devices (rev. 17)") from the
> suspend tree.  The i386 defconfig does not have CONFIG_PM_RUNTIME set but
> does have CONFIG_PM_SLEEP=y ...
> 
> I have reverted that commit for today.
> 
> When you add a new CONFIG variable, it is worth doing test builds both
> with it turned on and turned off ...

I tested it, but I broke the patch afterwards by mistake. :-(

Sorry for the trouble, I've just pushed an updated tree.

Thanks,
Rafael
