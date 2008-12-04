From: Philip Langdale <philipl@overt.org>
Subject: Re: linux-next: mmc tree build failure
Date: Wed, 03 Dec 2008 20:54:00 -0800
Message-ID: <49376268.6030302@overt.org>
References: <20081204152829.69a795a3.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from usul.saidi.cx ([204.11.33.34]:49146 "EHLO usul.overt.org"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1751969AbYLDFkv (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 4 Dec 2008 00:40:51 -0500
In-Reply-To: <20081204152829.69a795a3.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Pierre Ossman <drzeus-list@drzeus.cx>, linux-next@vger.kernel.org, "Rafael J. Wysocki" <rjw@sisk.pl>, Greg KH <greg@kroah.com>

Stephen Rothwell wrote:
> Hi Pierre,
> 
> Today's linux-next build (x86_64 allmodconfig) failed like this:
> 
> drivers/mmc/host/ricoh_mmc.c:235: error: variable 'ricoh_mmc_pm_ext_opts' has initializer but incomplete type
> drivers/mmc/host/ricoh_mmc.c:236: error: unknown field 'suspend_noirq' specified in initializer
> drivers/mmc/host/ricoh_mmc.c:236: warning: excess elements in struct initializer
> drivers/mmc/host/ricoh_mmc.c:236: warning: (near initialization for 'ricoh_mmc_pm_ext_opts')
> drivers/mmc/host/ricoh_mmc.c:237: error: unknown field 'resume_noirq' specified in initializer
> drivers/mmc/host/ricoh_mmc.c:237: warning: excess elements in struct initializer
> drivers/mmc/host/ricoh_mmc.c:237: warning: (near initialization for 'ricoh_mmc_pm_ext_opts')
> drivers/mmc/host/ricoh_mmc.c:245: error: unknown field 'pm' specified in initializer
> drivers/mmc/host/ricoh_mmc.c:245: warning: initialization from incompatible pointer type
> 
> Due to commit 75766a3cee0a1eb2f373e8112a73e69262e7831a ("ricoh_mmc: Use
> suspend/resume_noirq") clashing with commit
> 6e674b2ed59695a90166d9500aa2696a495696e7 ("PM: Simplify the new
> suspend/hibernation framework for devices") from the driver-core tree.
> 
> I am not sure what to do with this, so I have reverted the mmc tree
> commit above for today.  Hopefully, Rafael can suggest a fix.

Pierre doesn't have Rafael's change in his tree yet.

I posted an updated version of my change here:

http://lkml.org/lkml/2008/12/3/219

--phil
