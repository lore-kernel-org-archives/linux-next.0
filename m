From: Jesse Barnes <jbarnes@virtuousgeek.org>
Subject: Re: linux-next: Tree for June 17 (pci/slot)
Date: Wed, 17 Jun 2009 10:29:01 -0700
Message-ID: <20090617102901.6e39aac2@jbarnes-g45>
References: <20090617155354.075c60ae.sfr@canb.auug.org.au>
	<4A39194B.2060200@oracle.com>
	<20090617163604.GT19977@parisc-linux.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <20090617163604.GT19977@parisc-linux.org>
Sender: linux-pci-owner@vger.kernel.org
To: Matthew Wilcox <matthew@wil.cx>
Cc: Randy Dunlap <randy.dunlap@oracle.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Alex Chiang <achiang@hp.com>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Wed, 17 Jun 2009 10:36:04 -0600
Matthew Wilcox <matthew@wil.cx> wrote:

> On Wed, Jun 17, 2009 at 09:26:51AM -0700, Randy Dunlap wrote:
> > Stephen Rothwell wrote:
> > > Hi all,
> > > 
> > > Changes since 20090616:
> > 
> > 
> > When CONFIG_SYSFS=n:
> > 
> > drivers/pci/slot.c:327: error: 'module_kset' undeclared (first use
> > in this function)
> 
> Is there any point to pci_slot existing without CONFIG_SYSFS?
> I don't see how you can interact with it in any meaningful way.
> Perhaps CONFIG_PCI_SLOT should depend on CONFIG_SYSFS?

I've got a code fix queued up, but maybe a Kconfig dependency is the
way to go...

-- 
Jesse Barnes, Intel Open Source Technology Center
