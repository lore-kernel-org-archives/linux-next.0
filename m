From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the driver-core tree with the pci
 tree
Date: Wed, 28 Nov 2012 21:20:13 -0800
Message-ID: <20121129052013.GM4375@kroah.com>
References: <20121129150641.a049c1048c4085d339e5f591@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20121129150641.a049c1048c4085d339e5f591@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Bill Pemberton <wfp5p@virginia.edu>, Ian Abbott <abbotti@mev.co.uk>, Bjorn Helgaas <bhelgaas@google.com>
List-Id: linux-next.vger.kernel.org

On Thu, Nov 29, 2012 at 03:06:41PM +1100, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the driver-core tree got a conflict in
> drivers/pci/quirks.c between commit 21c5fd97380b ("PCI: Add workaround
> for PLX PCI 9050 BAR alignment erratum") from the pci tree and commit
> 15856ad50bf5 ("PCI: Remove __dev* markings") from the driver-core tree.
> 
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).

Looks good, thanks.

greg k-h
