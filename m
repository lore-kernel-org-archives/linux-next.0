From: "Rafael J. Wysocki" <rjw@sisk.pl>
Subject: Re: linux-next: Tree for July 9
Date: Thu, 10 Jul 2008 00:17:03 +0200
Message-ID: <200807100017.04397.rjw@sisk.pl>
References: <20080709183047.0eb1eb72.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ogre.sisk.pl ([217.79.144.158]:48597 "EHLO ogre.sisk.pl"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751076AbYGIWPL (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 9 Jul 2008 18:15:11 -0400
In-Reply-To: <20080709183047.0eb1eb72.sfr@canb.auug.org.au>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@elte.hu>

On Wednesday, 9 of July 2008, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since next-20080708:
> 
> Temporarily dropped tree: ttydev (since it would not import on top of any
> tree I have)
> 
> The x86 tree lost a conflict against the ftrace tree.
> 
> The ide tree gained 2 conflicts against Linus' tree.
> 
> The nfs tree gained a conflict against Linus' tree.
> 
> The acpi tree lost 5 conflicts against various trees but gained another
> against the x86 tree.
> 
> The net tree lost 2 conflicts against the x86 wireless-current trees.
> 
> I have also applied the following patches for known problems (I assume
> that these will be merged into their appropriate trees shortly):
> 
> 	linux-next: zero based percpu build error on s390
> 	sparc64: sysdev API change fallout
> 
> I no longer needed to revert the commits from the mmc tree.
> ----------------------------------------------------------------------------

With this tree (and several previous ones, it appears) my quad core test
box's CPU is detected as one core.  With 2.6.26-rc9 four cores are
detected as appropriate.

dmesg from the failing kernel (today's linux-next) is at:
http://www.sisk.pl/kernel/debug/20080709/dmesg-20080709.log

dmesg from a non-failing kernel (2.6.26-rc9) is at:
http://www.sisk.pl/kernel/debug/20080709/dmesg-rc9.log

.config is at: http://www.sisk.pl/kernel/debug/20080709/next-config

I'll bisect tomorrow.

Thanks,
Rafael
