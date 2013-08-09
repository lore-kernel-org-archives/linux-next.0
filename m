From: Jason Cooper <jason@lakedaemon.net>
Subject: Re: linux-next: Tree for Aug 8 (not CONFIG_PCI_MSI conflict)
Date: Fri, 9 Aug 2013 10:59:39 -0400
Message-ID: <20130809145939.GE25111@titan.lakedaemon.net>
References: <20130808170822.82bf33d3cf5100f5e2646815@canb.auug.org.au>
 <5203F978.2050504@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-pci-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5203F978.2050504@infradead.org>
Sender: linux-pci-owner@vger.kernel.org
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pci <linux-pci@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Randy,

On Thu, Aug 08, 2013 at 01:03:04PM -0700, Randy Dunlap wrote:
> On 08/08/13 00:08, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Changes since 20130807:
> > 
> 
> on i386 and x86_64:
> when CONFIG_PCI_MSI is not enabled:
> 
> There are many of these errors:
> include/linux/msi.h:65:6: error: expected identifier or '(' before 'void'
> include/linux/msi.h:65:6: error: expected ')' before numeric constant
> 
> because arch/x86/include/asm/pci.h defines:
> #define default_teardown_msi_irqs	NULL

Do you have an example config you used?

thx,

Jason.
