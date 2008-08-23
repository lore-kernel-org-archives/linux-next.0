From: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: Re: linux-next: pcmcia tree build failure
Date: Sat, 23 Aug 2008 02:40:01 +0200
Message-ID: <20080823004001.GA15344@isilmar.linta.de>
References: <20080822145231.d95b789b.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from isilmar.linta.de ([213.133.102.198]:41122 "EHLO linta.de"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1751276AbYHWAkD (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 22 Aug 2008 20:40:03 -0400
Content-Disposition: inline
In-Reply-To: <20080822145231.d95b789b.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org

Hi Stephen,

On Fri, Aug 22, 2008 at 02:52:31PM +1000, Stephen Rothwell wrote:
> Today's linux-next build (x86_64 allmodconfig) failed like this:
> 
> ERROR: "cs_debug_level" [drivers/pcmcia/pcmcia_core.ko] undefined!
> 
> Caused by commit e84d3a8fd37981178933e706432fa9f763f8ba6a ("pcmcia: fix
> CONFIG_DEBUG and dev_debug in pcmcia_core.o") ?

ooops

> I added the following patch.
Thanks. Squashed into the (much cleaned up) pcmcia git tree.

Best,
	Dominik
