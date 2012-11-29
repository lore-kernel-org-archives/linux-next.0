From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the driver-core tree with the pci
 tree
Date: Wed, 28 Nov 2012 21:20:21 -0800
Message-ID: <20121129052021.GN4375@kroah.com>
References: <20121129150340.768fdffc941d501c9975c2be@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20121129150340.768fdffc941d501c9975c2be@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Bill Pemberton <wfp5p@virginia.edu>, Bjorn Helgaas <bhelgaas@google.com>, Yinghai Lu <yinghai@kernel.org>
List-Id: linux-next.vger.kernel.org

On Thu, Nov 29, 2012 at 03:03:40PM +1100, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the driver-core tree got a conflict in
> drivers/pci/pci.h between commit 4e15c46bdc4d ("PCI: Add pci_device_type
> to pdev's device struct") from the pci tree and commit b40b97ae736c
> ("PCI: Remove CONFIG_HOTPLUG ifdefs") from the driver-core tree.
> 
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).

Looks good, thanks.

greg k-h
