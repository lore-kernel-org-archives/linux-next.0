From: Jesse Barnes <jbarnes@virtuousgeek.org>
Subject: Re: linux-next: build failure after merge of the pci-current tree
Date: Tue, 2 Aug 2011 08:53:27 -0700
Message-ID: <20110802085327.61325b3c@jbarnes-desktop>
References: <20110802104838.ac7f46b54e8a3fcc4cdd9448@canb.auug.org.au>
	<20110802112336.fd2d2b577a2a71892189733b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from oproxy7-pub.bluehost.com ([67.222.55.9]:39617 "HELO
	oproxy7-pub.bluehost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1754099Ab1HBPxj (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 2 Aug 2011 11:53:39 -0400
In-Reply-To: <20110802112336.fd2d2b577a2a71892189733b@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jon Mason <mason@myri.com>, Jordan Hargrave <jordan_hargrave@dell.com>

On Tue, 2 Aug 2011 11:23:36 +1000
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Jesse,
> 
> On Tue, 2 Aug 2011 10:48:38 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > After merging the pci-current tree, today's linux-next build (powerpc
> > ppc64_defconfig) failed like this:
> > 
> > ERROR: ".pcie_bus_configure_settings" [drivers/pci/hotplug/pci_hotplug.ko] undefined!
> > 
> > Caused by commit b03e7495a862 ("PCI: Set PCI-E Max Payload Size on
> > fabric").  Missing EXPORT_SYMBOL?
> > 
> > I have used the pci-current tree from next-20110801 for today.
> 
> And the same for the pci tree (which is identical today).

Jon just sent me the fix and I pushed it out.  Should be fixed now.

Thanks,
-- 
Jesse Barnes, Intel Open Source Technology Center
