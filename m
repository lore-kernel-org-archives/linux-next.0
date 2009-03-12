From: Nick Piggin <npiggin@suse.de>
Subject: Re: linux-next:  tree build warning
Date: Thu, 12 Mar 2009 07:37:03 +0100
Message-ID: <20090312063703.GA5670@wotan.suse.de>
References: <20090312164800.f3e28bd9.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.suse.de ([195.135.220.2]:53827 "EHLO mx1.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752309AbZCLGhH (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 12 Mar 2009 02:37:07 -0400
Content-Disposition: inline
In-Reply-To: <20090312164800.f3e28bd9.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Pekka Enberg <penberg@cs.helsinki.fi>, Christoph Lameter <cl@linux-foundation.org>

On Thu, Mar 12, 2009 at 04:48:00PM +1100, Stephen Rothwell wrote:
> Hi Nick,
> 
> Today's linux-next build (powerpc allnoconfig) produced this warning:
> 
> mm/slqb.c:3122: warning: 'gather_stats' defined but not used
> 
> $ grep SLQB .config
> CONFIG_SLQB=y
> # CONFIG_SLQB_DEBUG is not set
> # CONFIG_SLQB_SYSFS is not set

OK thanks, will fix that up.
