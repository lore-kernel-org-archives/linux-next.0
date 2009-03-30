From: "Rafael J. Wysocki" <rjw@sisk.pl>
Subject: Re: linux-next: Tree for March 30
Date: Mon, 30 Mar 2009 20:37:06 +0200
Message-ID: <200903302037.06373.rjw@sisk.pl>
References: <20090330200145.8d0da09b.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ogre.sisk.pl ([217.79.144.158]:39821 "EHLO ogre.sisk.pl"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752216AbZC3ShT (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 30 Mar 2009 14:37:19 -0400
In-Reply-To: <20090330200145.8d0da09b.sfr@canb.auug.org.au>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org

On Monday 30 March 2009, Stephen Rothwell wrote:
> Hi all,

Hi Stephen,

> Changes since 20090327:
> 
> Various conflicts have moved around due to some trees being merged into
> Linus' tree.
> 
> Linus' tree gained a build failure for which I applied a patch.
> 
> The arm tree lost its three conflicts.
> 
> The tracing tree inherited a build failure from the net tree.
> 
> The genirq tree lost its conflict.
> 
> The sched tree lost its conflict.
> 
> The v4l-dvb tree lost its build failure.
> 
> The acpi tree gained a conflict against Linus' tree but lost its build
> failure.
> 
> The ext4 tree lost its conflict.
> 
> The net tree lost all its conflicts.
> 
> The rr tree lost 8 conflicts.
> 
> The slab tree lost all its conflicts.
> 
> The drm tree lost its conflict.
> 
> The lblnet tree lost its conflicts.
> 
> The proc tree gained a build failure due to a new commit in Linus' tree -
> I applied a patch.
> 
> The suspend tree lost its conflict.

For your information, I have created for-linus branch in the suspend tree.
Currently, it is identical to the linux-next branch, but in future the Linus'
tree will be periodically merged into the for-linus branch and the linux-next
branch will be rebased on top of it.

Thanks,
Rafael
