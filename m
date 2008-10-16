From: Jesse Barnes <jbarnes@virtuousgeek.org>
Subject: Re: linux-next: manual merge of the pci tree
Date: Thu, 16 Oct 2008 05:32:30 -0700
Message-ID: <200810160532.30691.jbarnes@virtuousgeek.org>
References: <20081016142418.c94967d8.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from outbound-mail-33.bluehost.com ([69.89.18.153]:57567 "HELO
	outbound-mail-33.bluehost.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with SMTP id S1751072AbYJPMjQ (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Thu, 16 Oct 2008 08:39:16 -0400
In-Reply-To: <20081016142418.c94967d8.sfr@canb.auug.org.au>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Vincent Legoll <vincent.legoll@gmail.com>, Sitsofe Wheeler <sitsofe@yahoo.com>

On Wednesday, October 15, 2008 8:24 pm Stephen Rothwell wrote:
> Hi Jesse,
>
> Today's linux-next merge of the pci tree got a conflict in
> drivers/pci/pcie/aspm.c between commit
> e1f4f59d1ab9ebac44830d6ae450fb358ac559d3 ("PCI: Fix pcie_aspm=force")
> from Linus' tree and commit 4f56ffe4ff214284f9c92037f9ad5f389a74bb84
> ("PCI: probing debug message uniformization") from the pci tree.
>
> Just context.  I fixed it up (see below).

Yeah I sent that fix to Linus but it's not in my linux-next tree.  Looks like 
I'll have to do some re-basing to fix up Ben's PPC legacy stuff so I can take 
care of it then.

Jesse
