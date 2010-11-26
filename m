From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: linux-next: Tree for November 25 (snd/soc/codecs)
Date: Fri, 26 Nov 2010 16:30:22 +0000
Message-ID: <20101126163021.GL30360@rakim.wolfsonmicro.main>
References: <20101125164929.3a719716.sfr@canb.auug.org.au>
 <20101125184513.fdb20279.rdunlap@xenotime.net>
 <20101126112145.GA30360@rakim.wolfsonmicro.main>
 <20101126082711.9c362c87.rdunlap@xenotime.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:50059 "EHLO
	opensource2.wolfsonmicro.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1752160Ab0KZQaY (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Fri, 26 Nov 2010 11:30:24 -0500
Content-Disposition: inline
In-Reply-To: <20101126082711.9c362c87.rdunlap@xenotime.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <rdunlap@xenotime.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Liam Girdwood <lrg@slimlogic.co.uk>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Fri, Nov 26, 2010 at 08:27:11AM -0800, Randy Dunlap wrote:

> so we can look forward to a patch for this build error?

> sound/soc/codecs/wm8737.c:563:error: 'i2c_master_send' undeclared (first use in this function)

It's already waiting for the next rebuild of -next.

BTW, please do remember to CC both relevant maintainers and relevant
mailing lists when reporting things like this.
