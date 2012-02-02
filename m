From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the driver-core tree with Linus' tree
Date: Thu, 2 Feb 2012 11:26:39 -0800
Message-ID: <20120202192639.GA5798@kroah.com>
References: <20120130132451.1049903dbf990fed5876e5bc@canb.auug.org.au>
 <20120130023517.GA7937@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:39269 "EHLO
	out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752502Ab2BBT1T (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 2 Feb 2012 14:27:19 -0500
Received: from compute1.internal (compute1.nyi.mail.srv.osa [10.202.2.41])
	by gateway1.nyi.mail.srv.osa (Postfix) with ESMTP id 357E420C63
	for <linux-next@vger.kernel.org>; Thu,  2 Feb 2012 14:27:19 -0500 (EST)
Content-Disposition: inline
In-Reply-To: <20120130023517.GA7937@kroah.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Andi Kleen <ak@linux.intel.com>, Len Brown <lenb@kernel.org>, Thomas Renninger <trenn@suse.de>, Len Brown <len.brown@intel.com>

On Sun, Jan 29, 2012 at 06:35:17PM -0800, Greg KH wrote:
> On Mon, Jan 30, 2012 at 01:24:51PM +1100, Stephen Rothwell wrote:
> > Hi Greg,
> > 
> > Today's linux-next merge of the driver-core tree got a conflict in
> > drivers/acpi/processor_driver.c between commit 54d5dcc45af7 ("ACPI
> > processor hotplug: Split up acpi_processor_add") from Linus' tree and
> > commit 9061e0e16700 ("ACPI: Load acpi-cpufreq from processor driver
> > automatically") from the driver-core tree.
> > 
> > I fixed it up (I think- see below) and can carry the fix as necessary.
> 
> Thanks, I'll merge the driver-core next tree when 3.3-rc2 is out to
> resolve this problem.

This should now be resolved.

thanks,

greg k-h
