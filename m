From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the pci tree
Date: Wed, 2 Jul 2008 20:28:42 -0700
Message-ID: <20080703032842.GA26951@kroah.com>
References: <20080703121055.d6f49ae5.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([18.85.46.34]:58149 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754692AbYGCDfW (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 2 Jul 2008 23:35:22 -0400
Content-Disposition: inline
In-Reply-To: <20080703121055.d6f49ae5.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jesse Barnes <jbarnes@virtuousgeek.org>, linux-next@vger.kernel.org, David Howells <dhowells@redhat.com>

On Thu, Jul 03, 2008 at 12:10:55PM +1000, Stephen Rothwell wrote:
> Hi Jesse,
> 
> Today's linux-next merge of the pci tree got a conflict in  between
> commit 4433d5ff973e2c1ea2f923eea8935588e7b96c06 ("PCI: handle pci_name()
> being const") from the driver-core tree and commit
> 8b285ce84bbc719e363a796f466404576b840d36 ("PCI: fix pci_setup_device()'s
> sprinting into a const buffer") from the pci tree.
> 
> Jesse, since dev_set_name is now in mainline, you really should drop this
> commit and replace it with the one from the driver-core tree (which Greg
> has hopefully sent you by now).  Or add the equivalent on top of what you
> have.
> 
> I have appended it below in case.

Yes, Greg send him these patches earlier today :)
