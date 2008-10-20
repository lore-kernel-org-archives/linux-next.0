From: Jesse Barnes <jbarnes@virtuousgeek.org>
Subject: Re: pci_ioremap_bar() breaks s390 build
Date: Mon, 20 Oct 2008 11:12:04 -0700
Message-ID: <200810201112.13551.jbarnes@virtuousgeek.org>
References: <20081020174543.GA6964@osiris.boeblingen.de.ibm.com> <48FCC43D.3080305@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from outbound-mail-24.bluehost.com ([69.89.21.19]:35305 "HELO
	outbound-mail-24.bluehost.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with SMTP id S1752406AbYJTSP0 (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Mon, 20 Oct 2008 14:15:26 -0400
In-Reply-To: <48FCC43D.3080305@linux.intel.com>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Arjan van de Ven <arjan@linux.intel.com>
Cc: Heiko Carstens <heiko.carstens@de.ibm.com>, linux-next@vger.kernel.org

On Monday, October 20, 2008 10:47 am Arjan van de Ven wrote:
> Heiko Carstens wrote:
> > Hi Arjan,
> >
> > your patch "PCI: introduce an pci_ioremap(pdev, barnr) function" breaks
> > s390:
> >
> >   CC      fs/compat_ioctl.o
> > In file included from fs/compat_ioctl.c:52:
> > include/linux/pci.h: In function 'pci_ioremap_bar':
> > include/linux/pci.h:1136: error: implicit declaration of function
> > 'ioremap_nocache' include/linux/pci.h:1137: warning: return makes pointer
> > from integer without a cast make[1]: *** [fs/compat_ioctl.o] Error 1
> > make: *** [fs] Error 2
>
> hmm does s390 have ioremap ?
> since that'd be the most useful solution, to add an ioremap_nocache().
>
> if it doesn't have ioremap.. wtf is it doing using pci.h then ??

Yeah, adding ioremap_nocache to s390 would be the simplest solution.  Would 
you like me to include such a patch as part of my pull request to Linus?

Thanks,
Jesse
