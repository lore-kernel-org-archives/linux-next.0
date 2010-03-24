From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: linux-next: Tree for March 24
Date: Wed, 24 Mar 2010 00:29:17 -0700
Message-ID: <20100324072916.GA4254@core.coreip.homeip.net>
References: <20100324161746.85edc5a3.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-gw0-f46.google.com ([74.125.83.46]:48560 "EHLO
	mail-gw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754974Ab0CXH3W (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 24 Mar 2010 03:29:22 -0400
Content-Disposition: inline
In-Reply-To: <20100324161746.85edc5a3.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Wed, Mar 24, 2010 at 04:17:46PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20100323:
> 
> Dropped tree: tmio-mmc (long unresolved conflicts and unable to fetch)
> 
> My fixes tree contains:
> 	a patch for a pktcdvd build error from Arnd Bergmann
> 	a revert of the commit that broke virtual consoles on PowerPC
> 
> The input tree still has its build failure for which I reverted a commit.
> 

Should be fixed now.

-- 
Dmitry
