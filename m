From: Russell King <rmk@arm.linux.org.uk>
Subject: Re: Unfetchable (=non-public) arm branches
Date: Mon, 4 Aug 2008 14:23:33 +0100
Message-ID: <20080804132333.GD21651@flint.arm.linux.org.uk>
References: <20080804131939.GA4182@denkbrett.schottelius.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:59236 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753454AbYHDNXo (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 4 Aug 2008 09:23:44 -0400
Content-Disposition: inline
In-Reply-To: <20080804131939.GA4182@denkbrett.schottelius.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Nico -telmich- Schottelius <nico-linux-next@schottelius.org>
Cc: linux-next@vger.kernel.org

On Mon, Aug 04, 2008 at 03:19:39PM +0200, Nico -telmich- Schottelius wrote:
> Hello!
> 
> I am trying to fetch the trees listed in Next/Trees, but the following
> two are not accessable for people without ssh-access to
> master.kernel.org:
> 
> [15:16] denkbrett:Next% grep ssh:// Trees
> arm-current git
> ssh://master.kernel.org/home/rmk/linux-2.6-arm.git#master
> arm      git   ssh://master.kernel.org/home/rmk/linux-2.6-arm.git#devel
> 
> Is it possible to make it public on git://git.kernel.org, too?

No, because it doesn't follow kernel.org policy for living within /pub/scm.
However, you can get it from:

http://ftp.arm.linux.org.uk/pub/linux/arm/kernel/git-cut/linux-2.6-arm.git

which is a direct copy of the kernel.org version.

-- 
Russell King
 Linux kernel    2.6 ARM Linux   - http://www.arm.linux.org.uk/
 maintainer of:
