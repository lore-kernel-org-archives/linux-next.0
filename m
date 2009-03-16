From: "Rafael J. Wysocki" <rjw@sisk.pl>
Subject: Re: linux-next: suspend tree build failure
Date: Mon, 16 Mar 2009 23:07:56 +0100
Message-ID: <200903162307.57323.rjw@sisk.pl>
References: <20090316201319.cbde6e4f.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ogre.sisk.pl ([217.79.144.158]:50969 "EHLO ogre.sisk.pl"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753051AbZCPWHo (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 16 Mar 2009 18:07:44 -0400
In-Reply-To: <20090316201319.cbde6e4f.sfr@canb.auug.org.au>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org

On Monday 16 March 2009, Stephen Rothwell wrote:
> Hi Rafael,

Hi,
 
> Today's linux-next build (powerpc ppc64_defconfig) failed like this:
> 
> drivers/built-in.o: In function `.sysdev_suspend':
> (.text+0x92170): undefined reference to `.check_wakeup_irqs'
> 
> check_wakeup_irqs is defined in kernel/irq/pm.c which is only built when
> CONFIG_PM_SLEEP is set (which it isn't for this build). The call to
> check_wakeup_irqs was added to sysdev_suspend in commit
> 73263bc09332c5c8de7c60cb76b5b24e2da66b42 ("PM: Rework handling of
> interrupts during suspend-resume").
> 
> I have dropped the suspend tree temporarily for today.

Fixed, rebased on top of Linus' current.

Thanks,
Rafael
