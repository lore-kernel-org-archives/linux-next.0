From: <Narendra_K@Dell.com>
Subject: Re: linux-next: Tree for March 7
Date: Mon, 7 Mar 2011 11:52:04 -0800
Message-ID: <20110307201215.GB22450@fedora14-r610.oslab.blr.amer.dell.com>
References: <20110307180547.0cd7b9eb.sfr@canb.auug.org.au>
 <20110307190537.GA5694@mako-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <20110307190537.GA5694@mako-laptop>
Content-Language: en-US
Sender: linux-pci-owner@vger.kernel.org
To: mk@lab.zgora.pl
Cc: sfr@canb.auug.org.au, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Tue, Mar 08, 2011 at 12:35:37AM +0530, Mariusz Kozlowski wrote:
> On Mon, Mar 07, 2011 at 06:05:47PM +1100, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Changes since 20110304:
> 
> drivers/pci/pci-label.c: In function 'pci_create_firmware_label_files':
> drivers/pci/pci-label.c:366: error: implicit declaration of function 'device_has_dsm'
> 
> Fails for !CONFIG_ACPI.
> 
> pci_create_firmware_label_files() uses device_has_dsm() which definition
> is under #ifdef CONFIG_ACPI.
> 

Hello,

Sorry for the inconvenience. I sent a fix for this just now.

http://marc.info/?l=linux-next&m=129952710415436&w=2

With regards,
Narendra K