From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Jan 10 (vmci)
Date: Thu, 10 Jan 2013 11:17:10 -0800
Message-ID: <50EF13B6.9000809@infradead.org>
References: <20130110143241.041ef77011ef7b1f68ae5c61@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from casper.infradead.org ([85.118.1.10]:47999 "EHLO
	casper.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754214Ab3AJTQB (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 10 Jan 2013 14:16:01 -0500
In-Reply-To: <20130110143241.041ef77011ef7b1f68ae5c61@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, linux-virtualization@vger.kernel.org, georgezhang@vmware.com

On 01/09/13 19:32, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20130109:
> 


on i386, when CONFIG_PCI is not enabled:

  CC [M]  drivers/misc/vmw_vmci/vmci_guest.o
drivers/misc/vmw_vmci/vmci_guest.c:58:20: error: array type has incomplete element type
drivers/misc/vmw_vmci/vmci_guest.c: In function 'vmci_enable_msix':
drivers/misc/vmw_vmci/vmci_guest.c:384:2: error: implicit declaration of function 'pci_enable_msix' [-Werror=implicit-function-declaration]
drivers/misc/vmw_vmci/vmci_guest.c: In function 'vmci_guest_probe_device':
drivers/misc/vmw_vmci/vmci_guest.c:466:2: error: implicit declaration of function 'pcim_enable_device' [-Werror=implicit-function-declaration]
drivers/misc/vmw_vmci/vmci_guest.c:592:2: error: implicit declaration of function 'pci_enable_msi' [-Werror=implicit-function-declaration]
drivers/misc/vmw_vmci/vmci_guest.c:654:3: error: implicit declaration of function 'pci_disable_msix' [-Werror=implicit-function-declaration]
drivers/misc/vmw_vmci/vmci_guest.c:656:3: error: implicit declaration of function 'pci_disable_msi' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
make[4]: *** [drivers/misc/vmw_vmci/vmci_guest.o] Error 1


Should all of vmci depend on PCI ??



-- 
~Randy
