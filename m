From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: linux-next: build failure after merge of the sound-asoc tree
Date: Thu, 23 Dec 2010 02:12:12 +0000
Message-ID: <20101223021212.GA25886@opensource.wolfsonmicro.com>
References: <20101223120243.1617cd40.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:44979 "EHLO
	opensource2.wolfsonmicro.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1752553Ab0LWCMO (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Wed, 22 Dec 2010 21:12:14 -0500
Content-Disposition: inline
In-Reply-To: <20101223120243.1617cd40.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Liam Girdwood <lrg@slimlogic.co.uk>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Dec 23, 2010 at 12:02:43PM +1100, Stephen Rothwell wrote:

> After merging the sound-asoc tree, today's linux-next build (x86_64
> allmodconfig) failed like this:

> ERROR: "__tracepoint_snd_soc_jack_irq" [sound/soc/codecs/snd-soc-wm8962.ko] undefined!
> ERROR: "__tracepoint_snd_soc_jack_irq" [sound/soc/codecs/snd-soc-wm8903.ko] undefined!

> Caused by commit 1c9e9795b5e2348df619fd6010d7583dc9b8c811 ("ASoC: Add
> jack IRQ trace to 88pm860x driver").

It's not that commit - that's for a totally different driver to those
above which can't build on x86 as x86 lacks generic hardirqs.  I've
pushed up a change which ifdefs out all the tracepoints when things are
built modular, but it seems unfortunate that x86 isn't doing the right
thing here, whatever ARM is doing seems to DTRT.
