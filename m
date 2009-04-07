From: Matthew Wilcox <matthew@wil.cx>
Subject: Re: [PATCH next] pci: fix build error with !PCIE_ECRC
Date: Tue, 7 Apr 2009 08:32:49 -0600
Message-ID: <20090407143248.GA21727@parisc-linux.org>
References: <20090407123707.GA18687@orion>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-pci-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20090407123707.GA18687@orion>
Sender: linux-pci-owner@vger.kernel.org
To: Alexander Beregalov <a.beregalov@gmail.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, andrew.patterson@hp.com, jbarnes@virtuousgeek.org, linux-pci@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Tue, Apr 07, 2009 at 04:37:08PM +0400, Alexander Beregalov wrote:
> Fix this build error:
> drivers/built-in.o: In function `pci_init_capabilities':
> drivers/pci/probe.c:989: undefined reference to `pcie_set_ecrc_checking'
> drivers/built-in.o: In function `pci_setup':
> drivers/pci/pci.c:2547: undefined reference to `pcie_ecrc_get_policy'

>  config PCIE_ECRC
>  	bool "PCI Express ECRC support"
> -	depends on PCI
> +	depends on PCI && PCIEPORTBUS

How does this part of the patch relate to the above description?

-- 
Matthew Wilcox				Intel Open Source Technology Centre
"Bill, look, we understand that you're interested in selling us this
operating system, but compare it to ours.  We can't possibly take such
a retrograde step."
