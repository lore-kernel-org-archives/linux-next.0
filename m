From: Mariusz Kozlowski <mk@lab.zgora.pl>
Subject: Re: linux-next: Tree for March 7
Date: Wed, 9 Mar 2011 17:45:48 +0100
Message-ID: <20110309164548.GA2230@mako-laptop>
References: <20110307180547.0cd7b9eb.sfr@canb.auug.org.au>
 <20110307190537.GA5694@mako-laptop>
 <20110307201215.GB22450@fedora14-r610.oslab.blr.amer.dell.com>
 <20110308205732.GA17743@mako-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20110308205732.GA17743@mako-laptop>
Sender: linux-kernel-owner@vger.kernel.org
To: Narendra_K@Dell.com
Cc: mk@lab.zgora.pl, sfr@canb.auug.org.au, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Tue, Mar 08, 2011 at 09:57:32PM +0100, Mariusz Kozlowski wrote:
> On Mon, Mar 07, 2011 at 11:52:04AM -0800, Narendra_K@Dell.com wrote:
> > On Tue, Mar 08, 2011 at 12:35:37AM +0530, Mariusz Kozlowski wrote:
> > > On Mon, Mar 07, 2011 at 06:05:47PM +1100, Stephen Rothwell wrote:
> > > > Hi all,
> > > > 
> > > > Changes since 20110304:
> > > 
> > > drivers/pci/pci-label.c: In function 'pci_create_firmware_label_files':
> > > drivers/pci/pci-label.c:366: error: implicit declaration of function 'device_has_dsm'
> > > 
> > > Fails for !CONFIG_ACPI.
> > > 
> > > pci_create_firmware_label_files() uses device_has_dsm() which definition
> > > is under #ifdef CONFIG_ACPI.
> > > 
> > 
> > Hello,
> > 
> > Sorry for the inconvenience. I sent a fix for this just now.
> > 
> > http://marc.info/?l=linux-next&m=129952710415436&w=2
> 
> One more thing poped up today:
> 
> drivers/built-in.o: In function `dsm_label_utf16s_to_utf8s':
> /home/linux/linux-2.6/drivers/pci/pci-label.c:193: undefined
> reference to `utf16s_to_utf8s'
> 
> Linker fails when CONFIG_NLS != y.

I see it was already reported earlier so sorry for the noise.

-- 
Mariusz Kozlowski
