From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: build failure after merge of the final tree
Date: Tue, 2 Mar 2010 12:47:30 -0800
Message-ID: <20100302204730.GA18374@kroah.com>
References: <20100301203836.5148090b.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from kroah.org ([198.145.64.141]:57901 "EHLO coco.kroah.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752181Ab0CBUru (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 2 Mar 2010 15:47:50 -0500
Content-Disposition: inline
In-Reply-To: <20100301203836.5148090b.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "Eric W. Biederman" <ebiederm@xmission.com>

On Mon, Mar 01, 2010 at 08:38:36PM +1100, Stephen Rothwell wrote:
> Hi Greg,
> 
> After merging the final tree, today's linux-next build (powerpc
> allyesconfig) failed like this:
> 
> drivers/pci/pci-sysfs.c: In function 'pci_create_legacy_files':
> drivers/pci/pci-sysfs.c:645: error: lvalue required as unary '&' operand
> drivers/pci/pci-sysfs.c:658: error: lvalue required as unary '&' operand
> 
> Caused by commit 8e36e9ee3c5a9228b68717b35101c58fe9a001c5 ("sysfs: Use
> sysfs_attr_init and sysfs_bin_attr_init on dynamic attributes")
> interacting with commit 71f496c9ec9821d2e09b00298915b99b6cbc9d92 ("sysfs:
> Use one lockdep class per sysfs attribute") both from the driver-core
> tree.
> 
> I applied the following patch for today.

Thanks, I've added this to the tree to send to Linus.

greg k-h
