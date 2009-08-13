From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: linux-next: pci tree build warning
Date: Thu, 13 Aug 2009 13:32:40 +1000
Message-ID: <1250134360.3587.77.camel@pasglop>
References: <20090813124732.f29fd5c3.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from gate.crashing.org ([63.228.1.57]:42580 "EHLO gate.crashing.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752663AbZHMDdI (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 12 Aug 2009 23:33:08 -0400
In-Reply-To: <20090813124732.f29fd5c3.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jesse Barnes <jbarnes@virtuousgeek.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Tiago Vignatti <tiago.vignatti@nokia.com>, Dave Airlie <airlied@redhat.com>

On Thu, 2009-08-13 at 12:47 +1000, Stephen Rothwell wrote:
> Hi Jesse,
> 
> Today's linux-next build (x86_64 allmodconfig) produced these warnings:
> 
> drivers/gpu/vga/vgaarb.c: In function 'vga_arb_write':
> drivers/gpu/vga/vgaarb.c:834: warning: cast from pointer to integer of different size
> drivers/gpu/vga/vgaarb.c:870: warning: cast from pointer to integer of different size
> drivers/gpu/vga/vgaarb.c:920: warning: cast from pointer to integer of different size
> drivers/gpu/vga/vgaarb.c:963: warning: cast from pointer to integer of different size
> drivers/gpu/vga/vgaarb.c:1017: warning: cast from pointer to integer of different size
> 
> Introduced by commit a49c9c1b728fa8f50816d96a0f135e15a359e448 ("PCI/GPU:
> implement VGA arbitration on Linux").

Right, somebody weirdly decided to cast pointers to int just to printk
them with %X :-) I hope it wasn't me ... 

Just remove the casts and use %p instead.

Cheers,
Ben.
