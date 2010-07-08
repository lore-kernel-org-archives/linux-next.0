From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for July 8 (nouveau)
Date: Thu, 8 Jul 2010 09:48:42 -0700
Message-ID: <20100708094842.2753a194.randy.dunlap@oracle.com>
References: <20100708151022.d2517577.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet10.oracle.com ([148.87.113.121]:18377 "EHLO
	rcsinet10.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754202Ab0GHQtx (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 8 Jul 2010 12:49:53 -0400
In-Reply-To: <20100708151022.d2517577.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, David Airlie <airlied@linux.ie>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org

On Thu, 8 Jul 2010 15:10:22 +1000 Stephen Rothwell wrote:

> Hi all,
> 
> Changes since 20100707:
> 
> The i.MX tree mismerge has been fixed.
> 
> The omap tree gained a conflict (involving serveral files) against the
> arm tree.
> 
> ----------------------------------------------------------------------------


Should nouveau depend on PCI?
It has build errors when PCI is disabled:

drivers/gpu/drm/nouveau/nouveau_bios.c: In function 'load_vbios_pci':
drivers/gpu/drm/nouveau/nouveau_bios.c:167: error: implicit declaration of function 'pci_enable_rom'
drivers/gpu/drm/nouveau/nouveau_bios.c:171: error: implicit declaration of function 'pci_map_rom'
drivers/gpu/drm/nouveau/nouveau_bios.c:171: warning: assignment makes pointer from integer without a cast
drivers/gpu/drm/nouveau/nouveau_bios.c:175: error: implicit declaration of function 'pci_unmap_rom'
drivers/gpu/drm/nouveau/nouveau_bios.c:178: error: implicit declaration of function 'pci_disable_rom'

---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
