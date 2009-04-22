From: reinette chatre <reinette.chatre@intel.com>
Subject: Re: linux-next: wireless-current tree build failure
Date: Wed, 22 Apr 2009 11:08:46 -0700
Message-ID: <1240423726.29805.44.camel@rc-desk>
References: <20090422151928.d1c5ad6a.sfr@canb.auug.org.au>
	 <20090422130356.GA3288@tuxdriver.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:18569 "EHLO mga09.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751382AbZDVSCy (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 22 Apr 2009 14:02:54 -0400
In-Reply-To: <20090422130356.GA3288@tuxdriver.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "John W. Linville" <linville@tuxdriver.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>

Hi John,

On Wed, 2009-04-22 at 06:03 -0700, John W. Linville wrote:
> On Wed, Apr 22, 2009 at 03:19:28PM +1000, Stephen Rothwell wrote:
> > Hi John,
> > 
> > Today's linux-next build (powerpc allyesconfig) failed like this:
> > 
> > drivers/net/wireless/iwlwifi/iwl3945-base.c:1415: error: __ksymtab_iwl3945_rx_queue_reset causes a section type conflict
> > 
> > I am pretty sure that this is a compiler bug, so not to worry.  However,
> > as far as I can see, iwl-3945.o (the only user) and iwl3945-base.o are
> > always linked into the same module, so the EXPORT_SYMBOL (which causes
> > the problem) should not be needed.  Correct?
> > 
> > I applied the following patch for today.  This makes the above error go
> > away and my x86_64 allmodconfig still builds.
> 
> Seems reasonable.  Reinette, should I just take Stephen's patch?
> Or would you prefer some other solution?

This patch looks good. I did ack a duplicate patch from Johannes, but
Stephen was first with this solution. You can choose which one you want
to merge.

Acked-by: Reinette Chatre <reinette.chatre@intel.com>

Thank you

Reinette
