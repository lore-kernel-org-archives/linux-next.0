From: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: Re: linux-next: build failure after merge of the pcmcia tree
Date: Thu, 11 Mar 2010 09:17:54 +0100
Message-ID: <20100311081754.GB2757@isilmar.linta.de>
References: <20100311132149.c6ef7616.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from isilmar.linta.de ([213.133.102.198]:46140 "EHLO linta.de"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1754509Ab0CKIR4 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 11 Mar 2010 03:17:56 -0500
Content-Disposition: inline
In-Reply-To: <20100311132149.c6ef7616.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hey Stephen,

On Thu, Mar 11, 2010 at 01:21:49PM +1100, Stephen Rothwell wrote:
> After merging the pcmcia tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
> 
> drivers/pcmcia/pcmcia_resource.c:704:1: error: unterminated #ifdef

oops, I'm very sorry, seems like I pushed the wrong tree to master... fixed
it; so should be fine for tomorrow.

Best,
	Dominik
