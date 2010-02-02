From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: linux-next: sound tree build failure
Date: Tue, 2 Feb 2010 10:31:12 +0000
Message-ID: <20100202103112.GB6566@rakim.wolfsonmicro.main>
References: <20100202124711.d8cdc220.sfr@canb.auug.org.au>
 <s5heil4cd2g.wl%tiwai@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:33300 "EHLO
	opensource2.wolfsonmicro.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1755319Ab0BBKbO (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 2 Feb 2010 05:31:14 -0500
Content-Disposition: inline
In-Reply-To: <s5heil4cd2g.wl%tiwai@suse.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Samuel Ortiz <sameo@linux.intel.com>

On Tue, Feb 02, 2010 at 08:27:19AM +0100, Takashi Iwai wrote:

> Well, I don't think the codec register definitions don't have to be
> dependent on mfd tree at all.  All other codec drivers have own
> definitions.

> Mark, can it be self-contained?

No, it needs to look at things like the multi-function pin configuration
in order to configure itself correctly.
