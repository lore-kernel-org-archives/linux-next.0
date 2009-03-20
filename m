From: Wim Van Sebroeck <wim@iguana.be>
Subject: Re: linux-next: manual merge of the watchdog tree with the arm tree
Date: Fri, 20 Mar 2009 10:04:22 +0100
Message-ID: <20090320090422.GA6160@infomag.iguana.be>
References: <20090320135849.8f71cdbc.sfr@canb.auug.org.au> <20090320081915.GA17251@flint.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mailrelay003.isp.belgacom.be ([195.238.6.53]:6790 "EHLO
	mailrelay003.isp.belgacom.be" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751868AbZCTJEZ (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Fri, 20 Mar 2009 05:04:25 -0400
Content-Disposition: inline
In-Reply-To: <20090320081915.GA17251@flint.arm.linux.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Russell King <rmk@arm.linux.org.uk>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Wim Van Sebroeck <wim@iguana.be>, linux-next@vger.kernel.org

Hi Russel,

> > I fixed it up (see below) and can carry the fix as necessary.
> 
> Wim, what changes are you carrying to this driver which also touch its
> clk API use?  Please send these changes to me.

None that touch the clk API. I deleted some spaces before the comment(s)
so that the total line length get less then 81 bytes. (This is part of
bringing the watchdog drivers in line with normal Coding style).

I'll change the iwatchdog tree so that we don't have a conflict anymore.
Will be done in a couple of minutes.

Kind regards,
Wim.
