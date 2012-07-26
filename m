From: Alex Williamson <alex.williamson@redhat.com>
Subject: Re: linux-next: Tree for July 26 (vfio)
Date: Thu, 26 Jul 2012 10:16:21 -0600
Message-ID: <1343319381.3125.26.camel@ul30vt>
References: <20120726150419.0de645e8750e3a15fa0f1aaa@canb.auug.org.au>
	 <50116598.5070404@xenotime.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <50116598.5070404@xenotime.net>
Sender: linux-pci-owner@vger.kernel.org
To: Randy Dunlap <rdunlap@xenotime.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, linux-pci <linux-pci@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Thu, 2012-07-26 at 08:43 -0700, Randy Dunlap wrote:
> On 07/25/2012 10:04 PM, Stephen Rothwell wrote:
> 
> > Hi all,
> > 
> > 
> > Changes since 20120725:
> > 
> > 
> 
> 
> on x86_64:
> 
>   CC [M]  drivers/vfio/pci/vfio_pci_intrs.o
> drivers/vfio/pci/vfio_pci_intrs.c: In function 'virqfd_enable':
> drivers/vfio/pci/vfio_pci_intrs.c:142:2: error: implicit declaration of function 'eventfd_fget'
> drivers/vfio/pci/vfio_pci_intrs.c:142:7: warning: assignment makes pointer from integer without a cast
> drivers/vfio/pci/vfio_pci_intrs.c:148:2: error: implicit declaration of function 'eventfd_ctx_fileget'
> drivers/vfio/pci/vfio_pci_intrs.c:148:6: warning: assignment makes pointer from integer without a cast
> make[4]: *** [drivers/vfio/pci/vfio_pci_intrs.o] Error 1

Thanks!  vfio-pci is useless without CONFIG_EVENTFD so I've added that
to the Kconfig depends.  Should be fixed in tomorrows tree.  Thanks,

Alex
