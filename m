From: Jesse Barnes <jbarnes@virtuousgeek.org>
Subject: Re: linux-next: manual merge of the pci tree with the pci-current tree
Date: Fri, 6 Feb 2009 09:09:31 -0800
Message-ID: <200902060909.32549.jbarnes@virtuousgeek.org>
References: <20090206135041.fd7a8e7e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from outbound-mail-127.bluehost.com ([67.222.38.27]:44487 "HELO
	outbound-mail-127.bluehost.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with SMTP id S1752893AbZBFRQO (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 6 Feb 2009 12:16:14 -0500
In-Reply-To: <20090206135041.fd7a8e7e.sfr@canb.auug.org.au>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, "Rafael J. Wysocki" <rjw@sisk.pl>

On Thursday, February 5, 2009 6:50 pm Stephen Rothwell wrote:
> Hi Jesse,
>
> Today's linux-next merge of the pci tree got a conflict in
> drivers/pci/pcie/portdrv_pci.c between commit
> 27be54a65c89c4b4aa9b25fc6fba31ffd01a08ca ("PCI: PCIe portdrv: Simplify
> suspend and resume") from the pci-current tree and commit
> 120d3f44dd4c7a16ac71f26d4ff44ad7498cb81a ("PCI: PCIe portdrv: Implement
> pm object") from the pci tree.
>
> I fixed it up (I used the pci tree version) and assume it will be fixed in
> the pci tree soon.

Oops yeah, thanks for bringing this up.  I didn't rebase my linux-next branch 
on top of my for-linus branch with the last set of changes...  Will do.

-- 
Jesse Barnes, Intel Open Source Technology Center
