From: "John W. Linville" <linville@tuxdriver.com>
Subject: Re: linux-next: wireless-current tree build failure
Date: Wed, 22 Apr 2009 09:03:56 -0400
Message-ID: <20090422130356.GA3288@tuxdriver.com>
References: <20090422151928.d1c5ad6a.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from charlotte.tuxdriver.com ([70.61.120.58]:47993 "EHLO
	smtp.tuxdriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752327AbZDVNPw (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 22 Apr 2009 09:15:52 -0400
Content-Disposition: inline
In-Reply-To: <20090422151928.d1c5ad6a.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Reinette Chatre <reinette.chatre@intel.com>

On Wed, Apr 22, 2009 at 03:19:28PM +1000, Stephen Rothwell wrote:
> Hi John,
> 
> Today's linux-next build (powerpc allyesconfig) failed like this:
> 
> drivers/net/wireless/iwlwifi/iwl3945-base.c:1415: error: __ksymtab_iwl3945_rx_queue_reset causes a section type conflict
> 
> I am pretty sure that this is a compiler bug, so not to worry.  However,
> as far as I can see, iwl-3945.o (the only user) and iwl3945-base.o are
> always linked into the same module, so the EXPORT_SYMBOL (which causes
> the problem) should not be needed.  Correct?
> 
> I applied the following patch for today.  This makes the above error go
> away and my x86_64 allmodconfig still builds.

Seems reasonable.  Reinette, should I just take Stephen's patch?
Or would you prefer some other solution?

John
-- 
John W. Linville		Someday the world will need a hero, and you
linville@tuxdriver.com			might be all we have.  Be ready.
