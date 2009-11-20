From: Nathan Fontenot <nfont@austin.ibm.com>
Subject: Re: linux-next: microblaze tree build failure
Date: Fri, 20 Nov 2009 10:31:54 -0600
Message-ID: <4B06C47A.6030403@austin.ibm.com>
References: <20091120095622.5fefb9fa.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e39.co.us.ibm.com ([32.97.110.160]:51034 "EHLO
	e39.co.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751880AbZKTQcN (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 20 Nov 2009 11:32:13 -0500
In-Reply-To: <20091120095622.5fefb9fa.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Michal Simek <michal.simek@petalogix.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Yes, this should be rejected.  I have submitted an updated patch to
linuxppc-dev and devicetree-discuss.

I'm not sure how this patch git picked up, I didn't think it did.
Looking at the coimmit it appears that only patch 1/4 of the patchset
was picked up.

-Nathan Fontenot

Stephen Rothwell wrote:
> Hi Michal,
> 
> Today's linux-next build (powerpc ppc64_defconfig) failed like this:
> 
> arch/powerpc/platforms/built-in.o: In function `.ofdt_write':
> reconfig.c:(.text+0xca08): undefined reference to `.of_attach_node'
> arch/powerpc/platforms/built-in.o: In function `.do_device_node':
> vio.c:(.text+0x1be2c): undefined reference to `.of_attach_node'
> 
> Caused by commit 5d0c1c076548e1f8d590a2f70f281b4eb7b3aeb2 ("Merge
> of_attach_node") which I have reverted for today.  That patch is missing
> an update to drivers/of/Makefile at least ... and probably some other
> stuff as well.
> 
