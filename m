From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: linux-next: sound tree build failure
Date: Tue, 2 Feb 2010 11:34:24 +0000
Message-ID: <20100202113424.GH6566@rakim.wolfsonmicro.main>
References: <20100202124711.d8cdc220.sfr@canb.auug.org.au>
 <20100202102609.GA6566@rakim.wolfsonmicro.main>
 <20100202213732.586a3566.sfr@canb.auug.org.au>
 <20100202105800.GE6566@rakim.wolfsonmicro.main>
 <20100202221743.1dbcad11.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:47444 "EHLO
	opensource2.wolfsonmicro.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1755698Ab0BBLe0 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 2 Feb 2010 06:34:26 -0500
Content-Disposition: inline
In-Reply-To: <20100202221743.1dbcad11.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Takashi Iwai <tiwai@suse.de>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Samuel Ortiz <sameo@linux.intel.com>

On Tue, Feb 02, 2010 at 10:17:43PM +1100, Stephen Rothwell wrote:
> On Tue, 2 Feb 2010 10:58:00 +0000 Mark Brown <broonie@opensource.wolfsonmicro.com> wrote:

> > change the form you're using when reporting problems with partially
> > constructed -next - at the minute you say "Today's linux-next build
> > (x86_64 allmodconfig) failed like this:" which makes it look like you're
> > testing the result of the full -next merge.

> I was hoping that the subject of the email would help with that
> impression.

The way I've always read that was that you'd found a build failure in
a given bit of the tree while testing -next - you're clearly doing some
work to identify and understand where the failure came from (and simply
looking at the source file leads to the same result normally anyway) so
the fact that you've identified the subsystem doesn't automatically say
that this happened with a partially merged -next.  If you looked less
like a human the subject by itself would be clearer :)

> > > Kconfig has nothing to do with it, sorry.

> > No, it does really fix the problem.  As I said the driver should build
> > depend on a Kconfig symbol which is introduced in the MFD tree.  This
> > means that the driver will not be built at all until MFD has been merged
> > since the dependencies required to select the driver will not be
> > satisfied unless the commits it depends on are present in the tree.

> Yeah, OK, I guess you could do that.

It's needed anyway, the driver will try to link against the MFD core so
even with both bits merged a build that didn't select the core would
fail.
