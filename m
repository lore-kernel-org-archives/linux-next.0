From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Subject: Re: linux-next: Tree for Feb 8
Date: Mon, 8 Feb 2016 20:13:07 +0530
Message-ID: <20160208144232.GA5984@sudip-pc>
References: <20160208161756.6809f31a@canb.auug.org.au>
 <20160208115611.GA10929@sudip-pc>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pf0-f169.google.com ([209.85.192.169]:36627 "EHLO
	mail-pf0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753316AbcBHOnR (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 8 Feb 2016 09:43:17 -0500
Content-Disposition: inline
In-Reply-To: <20160208115611.GA10929@sudip-pc>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Steven Miao <realmz6@gmail.com>, Chris Metcalf <cmetcalf@ezchip.com>, adi-buildroot-devel@lists.sourceforge.net, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Guenter Roeck <linux@roeck-us.net>, Kees Cook <keescook@chromium.org>, Andrew Morton <akpm@linux-foundation.org>

On Mon, Feb 08, 2016 at 05:26:11PM +0530, Sudip Mukherjee wrote:
> On Mon, Feb 08, 2016 at 04:17:56PM +1100, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Changes since 20160205:
> 
> My blackfin defconfig build fails with:
> 
> kallsyms failure: relative symbol value 0xffa00000 out of range in
> relative mode
> 
> build log at:
> https://travis-ci.org/sudipm-mukherjee/parport/jobs/107707060
> 
> and tilegx defconfig fails with:
> kallsyms failure: relative symbol value 0xfffffff700020000 out of range
> in relative mode
> 
> build log at:
> https://travis-ci.org/sudipm-mukherjee/parport/jobs/107707069
> 
> I will do a bisect later today to see which has caused this.

Bisected. And - 
de9d2352a3c9 ("kallsyms: add support for relative offsets in kallsyms address table")
is introducing the message of "kallsyms failure: relative symbol value .... "
and 9b461d6a3ab9 ("scripts/link-vmlinux.sh: force error on kallsyms failure")
is causing the build failure.

Just reverting de9d2352a3c9 is fixing these build failures.

Adding Cc to Andrew, Guenter, Ard and Kees.

regards
sudip
