From: Jesse Barnes <jbarnes@virtuousgeek.org>
Subject: Re: linux-next: manual merge of the pci-current tree
Date: Thu, 31 Jul 2008 17:40:34 -0700
Message-ID: <200807311740.34603.jbarnes@virtuousgeek.org>
References: <20080801102245.2c25f666.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from outbound-mail-152.bluehost.com ([67.222.39.32]:49131 "HELO
	outbound-mail-152.bluehost.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with SMTP id S1752719AbYHAArQ (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Thu, 31 Jul 2008 20:47:16 -0400
In-Reply-To: <20080801102245.2c25f666.sfr@canb.auug.org.au>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Prarit Bhargava <prarit@redhat.com>

On Thursday, July 31, 2008 5:22 pm Stephen Rothwell wrote:
> Hi Jesse,
>
> Today's linux-next merge of the pci-current tree got a conflict in
> arch/x86/kernel/pci-gart_64.c between commit
> 7968531880c89b3c987e6a7a0d33eafb0962d8d9 ("Revert "Merge branch
> 'x86/iommu' of
> git://git.kernel.org/pub/scm/linux/kernel/git/tip/linux-2.6-tip into
> for-linus"") from the linux-next tree and commit
> 074ec1727196c4a2ba2f909902d55ec5014e50c3 ("PCI: GART iommu alignment
> fixes") from the pci-current tree.
>
> This is, of course caused by my revert of the iommu_num_pages patches.  I
> fixed it up as best I could.

Hopefully Linus will pull the iommu fixes soon and your revert won't be 
necessary.  Otherwise I'll take care of things tomorrow or so...

Thanks,
Jesse
