From: Wim Van Sebroeck <wim@iguana.be>
Subject: Re: linux-next: manual merge of the watchdog tree with the arm tree
Date: Fri, 20 Mar 2009 10:15:51 +0100
Message-ID: <20090320091551.GB6160@infomag.iguana.be>
References: <20090320135849.8f71cdbc.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mailrelay003.isp.belgacom.be ([195.238.6.53]:11706 "EHLO
	mailrelay003.isp.belgacom.be" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754393AbZCTJPy (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Fri, 20 Mar 2009 05:15:54 -0400
Content-Disposition: inline
In-Reply-To: <20090320135849.8f71cdbc.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Wim Van Sebroeck <wim@iguana.be>, linux-next@vger.kernel.org, Russell King <rmk@arm.linux.org.uk>

Hi Stephen,

> Today's linux-next merge of the watchdog tree got a conflict in
> drivers/watchdog/omap_wdt.c between commit
> 39a80c7f379e1c1d3e63b204b8353b7381d0a3d5 ("[ARM] omap: watchdog: convert
> clocks to match by devid and conid") from the arm tree and commit
> 47efb2337f6f450c995712762c0bcf6ce073171f ("[WATCHDOG] More coding-style
> and trivial clean-up") from the watchdog tree.
> 
> I fixed it up (see below) and can carry the fix as necessary.

I redid the tree so that that commit doesn't add the omap part again.
So should be fixed tomorrow.

Kind regards,
Wim.
