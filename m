From: Jesse Barnes <jbarnes@virtuousgeek.org>
Subject: Re: linux-next: Tree for December 17 (pci/quirks)
Date: Thu, 17 Dec 2009 10:59:00 -0800
Message-ID: <20091217105900.1d8b4f42@jbarnes-piketon>
References: <20091217165840.e11fc719.sfr@canb.auug.org.au>
	<20091217095506.64f0a43f.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <20091217095506.64f0a43f.randy.dunlap@oracle.com>
Sender: linux-pci-owner@vger.kernel.org
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-pci@vger.kernel.org, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Dexuan Cui <dexuan.cui@intel.com>
List-Id: linux-next.vger.kernel.org

On Thu, 17 Dec 2009 09:55:06 -0800
Randy Dunlap <randy.dunlap@oracle.com> wrote:

> On Thu, 17 Dec 2009 16:58:40 +1100 Stephen Rothwell wrote:
> 
> > Hi all,
> > 
> > My usual call for calm: please do not put stuff destined for 2.6.34
> > into linux-next trees until after 2.6.33-rc1.
> > 
> > Changes since 20091216:
> 
> 
> When CONFIG_PCI_QUIRKS=n:
> 
> drivers/built-in.o: In function `pci_dev_reset':
> pci.c:(.text+0xdb0b): undefined reference to `pci_dev_reset_methods'
> pci.c:(.text+0xdb2b): undefined reference to `pci_dev_reset_methods'
> pci.c:(.text+0xdb85): undefined reference to `pci_dev_reset_methods'
> 
> 
> pci_dev_reset() calls (inlined) pci_dev_specific_reset(),
> which references pci_dev_reset_methods, which does not exist.

Dexuan, can you fix this up?

Thanks,
-- 
Jesse Barnes, Intel Open Source Technology Center
