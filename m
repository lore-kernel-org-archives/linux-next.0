From: Jesse Barnes <jbarnes@virtuousgeek.org>
Subject: Re: pci_ioremap_bar() breaks s390 build
Date: Mon, 20 Oct 2008 11:14:55 -0700
Message-ID: <200810201114.55518.jbarnes@virtuousgeek.org>
References: <20081020174543.GA6964@osiris.boeblingen.de.ibm.com> <48FCC43D.3080305@linux.intel.com> <20081020181207.GA15328@osiris.boeblingen.de.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from outbound-mail-15.bluehost.com ([69.89.18.115]:37289 "HELO
	outbound-mail-15.bluehost.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with SMTP id S1752368AbYJTSO6 (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Mon, 20 Oct 2008 14:14:58 -0400
In-Reply-To: <20081020181207.GA15328@osiris.boeblingen.de.ibm.com>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Heiko Carstens <heiko.carstens@de.ibm.com>
Cc: Arjan van de Ven <arjan@linux.intel.com>, linux-next@vger.kernel.org

On Monday, October 20, 2008 11:12 am Heiko Carstens wrote:
> On Mon, Oct 20, 2008 at 10:47:41AM -0700, Arjan van de Ven wrote:
> > Heiko Carstens wrote:
> >> Hi Arjan,
> >>
> >> your patch "PCI: introduce an pci_ioremap(pdev, barnr) function" breaks
> >> s390:
> >>
> >>   CC      fs/compat_ioctl.o
> >> In file included from fs/compat_ioctl.c:52:
> >> include/linux/pci.h: In function 'pci_ioremap_bar':
> >> include/linux/pci.h:1136: error: implicit declaration of function
> >> 'ioremap_nocache' include/linux/pci.h:1137: warning: return makes
> >> pointer from integer without a cast make[1]: *** [fs/compat_ioctl.o]
> >> Error 1
> >> make: *** [fs] Error 2
> >
> > hmm does s390 have ioremap ?
> > since that'd be the most useful solution, to add an ioremap_nocache().
>
> s390 doesn't have ioremap.
>
> > if it doesn't have ioremap.. wtf is it doing using pci.h then ??
>
> Several common code parts pull pci.h, not s390.
> fs/compat_ioctl.c is one, drivers/scsi/scsi_lib.c is another one.

Hm, well it would probably be best to fix those (maybe add some #ifdef 
CONFIG_PCI to them or somesuch), but that could get ugly.  I'll go ahead and 
apply your initial patch.

-- 
Jesse Barnes, Intel Open Source Technology Center
