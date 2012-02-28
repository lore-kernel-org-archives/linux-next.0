From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the driver-core tree with the pci
 tree
Date: Tue, 28 Feb 2012 08:12:49 -0800
Message-ID: <20120228161249.GA19433@kroah.com>
References: <20120228142909.48fa1eea6980eaffa27abfdc@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:40862 "EHLO
	out5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1756251Ab2B1QWD (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Tue, 28 Feb 2012 11:22:03 -0500
Received: from compute2.internal (compute2.nyi.mail.srv.osa [10.202.2.42])
	by gateway1.nyi.mail.srv.osa (Postfix) with ESMTP id 4A0F021790
	for <linux-next@vger.kernel.org>; Tue, 28 Feb 2012 11:22:02 -0500 (EST)
Content-Disposition: inline
In-Reply-To: <20120228142909.48fa1eea6980eaffa27abfdc@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Yinghai Lu <yinghai@kernel.org>, Jesse Barnes <jbarnes@virtuousgeek.org>

On Tue, Feb 28, 2012 at 02:29:09PM +1100, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the driver-core tree got a conflict in
> include/linux/pci.h between commit 6754b9e9c335 ("PCI: Rename
> pci_remove_behind_bridge to pci_stop_and_remove_behind_bridge") from the
> pci tree and commit aad4f4000cec ("PCI: Add helper macro for
> pci_register_driver boilerplate") from the driver-core tree.
> 
> Just context changes.  I fixed it up (see below) and can carry the fix as
> necessary.

Looks good to me, thanks for the fixup.

greg k-h
