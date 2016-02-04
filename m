From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: linux-next: build failure after merge of the aio tree
Date: Thu, 4 Feb 2016 16:17:42 +0000
Message-ID: <20160204161741.GH10826@n2100.arm.linux.org.uk>
References: <20160129113056.GP10826@n2100.arm.linux.org.uk>
 <CAMuHMdUy-cqeN8COO4rdpY-mOH+6gth40wB31-edkj8CO5PFCw@mail.gmail.com>
 <20160204131959.6695c7bf@canb.auug.org.au>
 <20160204134142.GA16315@kvack.org>
 <20160204135056.GE10826@n2100.arm.linux.org.uk>
 <20160204140822.GB16315@kvack.org>
 <20160204141253.GF10826@n2100.arm.linux.org.uk>
 <20160204143204.GC16315@kvack.org>
 <20160204143907.GG10826@n2100.arm.linux.org.uk>
 <20160204160101.GD16315@kvack.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from pandora.arm.linux.org.uk ([78.32.30.218]:58307 "EHLO
	pandora.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932330AbcBDQRy (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 4 Feb 2016 11:17:54 -0500
Content-Disposition: inline
In-Reply-To: <20160204160101.GD16315@kvack.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Benjamin LaHaise <bcrl@kvack.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Geert Uytterhoeven <geert@linux-m68k.org>, Linux-Next <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On Thu, Feb 04, 2016 at 11:01:01AM -0500, Benjamin LaHaise wrote:
> On Thu, Feb 04, 2016 at 02:39:07PM +0000, Russell King - ARM Linux wrote:
> > However, this one should warn:
> > 
> > int test_wrong(char **v, const char **p)
> > { return __get_user(*v, p); }
> > 
> > Good luck (I think you'll need lots of it to get a working solution)! :)
> 
> This works with your test cases on x86-32.  Note that it's only compile + 
> link tested at present.

That's the easy bit!

The problem you're going to run into is here:

#define __get_user_nocheck(x, ptr, size)                                \
({                                                                      \
        int __gu_err;                                                   \
        unsigned long __gu_val;                                         \
        __uaccess_begin();                                              \
        __get_user_size(__gu_val, (ptr), (size), __gu_err, -EFAULT);    \
        __uaccess_end();                                                \
        (x) = (__force __typeof__(*(ptr)))__gu_val;                     \

__gu_val will be 32-bit, even when you're wanting a 64-bit quantity.
That's where the fun and games start...

-- 
RMK's Patch system: http://www.arm.linux.org.uk/developer/patches/
FTTC broadband for 0.8mile line: currently at 9.6Mbps down 400kbps up
according to speedtest.net.
