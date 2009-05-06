From: Russell King <rmk+lkml@arm.linux.org.uk>
Subject: Re: linux-next: manual merge of the i2c tree with the arm-current
	tree
Date: Wed, 6 May 2009 20:04:08 +0100
Message-ID: <20090506190408.GC6897@flint.arm.linux.org.uk>
References: <20090506131031.83f1b04d.sfr@canb.auug.org.au> <20090506103138.79525cd0@hyperion.delvare>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:33447 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750868AbZEFTE1 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 6 May 2009 15:04:27 -0400
Content-Disposition: inline
In-Reply-To: <20090506103138.79525cd0@hyperion.delvare>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jean Delvare <khali@linux-fr.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Nicolas Pitre <nico@cam.org>, Wolfram Sang <w.sang@pengutronix.de>, LKML <linux-kernel@vger.kernel.org>

On Wed, May 06, 2009 at 10:31:38AM +0200, Jean Delvare wrote:
> I don't know exactly how defconfigs are handled, but I can imagine that
> the responsible developer is running "make oldconfig" on the system in
> question from times to times and copying the result back to the
> defconfig file. The purpose of updating defconfig files is to make
> configuration option renames transparent.

The big problem is that everyone 'make oldconfig' is done, the entire
config file essentially gets re-sorted into some other random order,
and the changes are massive.

If a platform maintainer does this, and the result is committed, and
some other person has done some small sed-based updates to the defconfigs,
the result is _total_ chaos.

That's why I'm arguing for my approach.  That way, platform maintainers
stand a better chance of seeing what happens to their defconfig files
and there's a substantially better chance of some coordination of those
changes (that is if the arch maintainer is doing their job properly.)

-- 
Russell King
 Linux kernel    2.6 ARM Linux   - http://www.arm.linux.org.uk/
 maintainer of:
