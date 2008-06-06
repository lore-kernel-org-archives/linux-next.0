From: Russell King <rmk@arm.linux.org.uk>
Subject: Re: linux-next: arm/mer-current merge conflict
Date: Fri, 6 Jun 2008 11:10:12 +0100
Message-ID: <20080606101012.GA18231@flint.arm.linux.org.uk>
References: <20080603140421.183cefe5.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:60693 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753511AbYFFKKd (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 6 Jun 2008 06:10:33 -0400
Content-Disposition: inline
In-Reply-To: <20080603140421.183cefe5.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Dmitry Baryshkov <dbaryshkov@gmail.com>

On Tue, Jun 03, 2008 at 02:04:21PM +1000, Stephen Rothwell wrote:
> Hi Russell,
> 
> Today's linux-next merge of the arm tree got a conflict in
> arch/arm/mach-pxa/tosa.c between commit
> 0ef2cfc0ca4625424e5b8ead6c47359c35a7a841 ("[ARM] pxa: fix tosa.c build
> error") from the arm-current tree and commit
> a37cba9e5315bb57e8eb135e401ba35e4b2338ac ("[ARM] 5048/2: Clean up tosa
> and spitz resetting") from the arm tree.  I used the latter since the
> former's commit message implied that this was the right fix.

Yes, I'm aware of there being two fixes in my tree for that.  One is
the fix suitable for -rc kernels, the other is the proper fix, which
has a higher impact.

The merge conflict will be resolved probably around merge window time -
I hope this doesn't cause you too much of a problem?

-- 
Russell King
 Linux kernel    2.6 ARM Linux   - http://www.arm.linux.org.uk/
 maintainer of:
