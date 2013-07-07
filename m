From: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
Subject: Re: linux-next: build warning after merge of the mfd tree
Date: Sun, 7 Jul 2013 20:29:11 +0200
Message-ID: <20130707182911.GA1799@breakpoint.cc>
References: <20130703155655.9fbacfa867af35fd743099e2@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from Chamillionaire.breakpoint.cc ([80.244.247.6]:60061 "EHLO
	Chamillionaire.breakpoint.cc" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752427Ab3GGS3V (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 7 Jul 2013 14:29:21 -0400
Content-Disposition: inline
In-Reply-To: <20130703155655.9fbacfa867af35fd743099e2@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Samuel Ortiz <sameo@linux.intel.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Stephen Warren <swarren@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>, Grant Likely <grant.likely@secretlab.ca>

On Wed, Jul 03, 2013 at 03:56:55PM +1000, Stephen Rothwell wrote:
> Hi Samuel,
Hi Stephen,

> Introduced by commit 18926edebcb8 ("iio: ti_am335x_adc: Allow to specify
> input line").  CONFIG_OF is not set in this build.
> 
> Maybe someone could come up with a way to make these arguments to
> of_property_for_each_u32() etc look used in the !CONFIG_OF case.

Already posted:

  https://lists.ozlabs.org/pipermail/devicetree-discuss/2013-June/035703.html

Sebastian
