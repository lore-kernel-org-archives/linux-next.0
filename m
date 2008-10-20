From: Arjan van de Ven <arjan@linux.intel.com>
Subject: Re: pci_ioremap_bar() breaks s390 build
Date: Mon, 20 Oct 2008 10:47:41 -0700
Message-ID: <48FCC43D.3080305@linux.intel.com>
References: <20081020174543.GA6964@osiris.boeblingen.de.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:16753 "EHLO mga09.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752183AbYJTRrn (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 20 Oct 2008 13:47:43 -0400
In-Reply-To: <20081020174543.GA6964@osiris.boeblingen.de.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Heiko Carstens <heiko.carstens@de.ibm.com>
Cc: Jesse Barnes <jbarnes@virtuousgeek.org>, linux-next@vger.kernel.org

Heiko Carstens wrote:
> Hi Arjan,
> 
> your patch "PCI: introduce an pci_ioremap(pdev, barnr) function" breaks s390:
> 
>   CC      fs/compat_ioctl.o
> In file included from fs/compat_ioctl.c:52:
> include/linux/pci.h: In function 'pci_ioremap_bar':
> include/linux/pci.h:1136: error: implicit declaration of function 'ioremap_nocache'
> include/linux/pci.h:1137: warning: return makes pointer from integer without a cast
> make[1]: *** [fs/compat_ioctl.o] Error 1
> make: *** [fs] Error 2

hmm does s390 have ioremap ?
since that'd be the most useful solution, to add an ioremap_nocache().

if it doesn't have ioremap.. wtf is it doing using pci.h then ??
