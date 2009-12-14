From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for December 14 (nouveau & AGP)
Date: Mon, 14 Dec 2009 11:06:17 -0800
Message-ID: <20091214110617.1c85d2b3.randy.dunlap@oracle.com>
References: <20091214165927.c08c4784.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from acsinet12.oracle.com ([141.146.126.234]:46984 "EHLO
	acsinet12.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757253AbZLNTGe (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 14 Dec 2009 14:06:34 -0500
In-Reply-To: <20091214165927.c08c4784.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>


when CONFIG_AGP=n:

drivers/gpu/drm/nouveau/nouveau_bo.c:315: error: implicit declaration of function 'ttm_agp_backend_init'




BTW:

menuconfig AGP
	tristate "/dev/agpgart (AGP Support)"
	depends on ALPHA || IA64 || PARISC || PPC || X86
	depends on PCI

Can AGP=m?  It's tristate in kconfig, but all of its dependencies
are booleans.

---
~Randy
