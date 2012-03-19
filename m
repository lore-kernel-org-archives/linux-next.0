From: "Rafael J. Wysocki" <rjw@sisk.pl>
Subject: Re: linux-next: manual merge of the pm tree with the mmc tree
Date: Mon, 19 Mar 2012 12:43:37 +0100
Message-ID: <201203191243.37383.rjw@sisk.pl>
References: <20120319143335.8b31091f03de60e41987efde@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ogre.sisk.pl ([217.79.144.158]:52396 "EHLO ogre.sisk.pl"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752706Ab2CSLjX (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 19 Mar 2012 07:39:23 -0400
In-Reply-To: <20120319143335.8b31091f03de60e41987efde@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Guennadi Liakhovetski <g.liakhovetski@gmx.de>, Chris Ball <cjb@laptop.org>

On Monday, March 19, 2012, Stephen Rothwell wrote:
> Hi Rafael,
> 
> Today's linux-next merge of the pm tree got a conflict in
> drivers/mmc/host/tmio_mmc_pio.c between commit 4d741159c282 ("mmc:
> tmio_mmc: support the generic MMC GPIO card hotplug helper") from the mmc
> tree and commit c419e611c3c5 ("tmio_mmc / PM: Use PM QoS latency
> constraint") from the pm tree.
> 
> Just context changes.  I fixed it up (see below) and can carry the fix as
> necessary.

Please do, thanks a lot!

Rafael
