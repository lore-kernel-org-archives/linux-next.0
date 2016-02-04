From: Benjamin LaHaise <bcrl@kvack.org>
Subject: Re: linux-next: build failure after merge of the aio tree
Date: Thu, 4 Feb 2016 09:08:22 -0500
Message-ID: <20160204140822.GB16315@kvack.org>
References: <20160112164034.0fe945a7@canb.auug.org.au> <20160112163835.GD347@kvack.org> <20160127134024.0fababf6@canb.auug.org.au> <20160129113056.GP10826@n2100.arm.linux.org.uk> <CAMuHMdUy-cqeN8COO4rdpY-mOH+6gth40wB31-edkj8CO5PFCw@mail.gmail.com> <20160204131959.6695c7bf@canb.auug.org.au> <20160204134142.GA16315@kvack.org> <20160204135056.GE10826@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from kanga.kvack.org ([205.233.56.17]:45257 "EHLO kanga.kvack.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752724AbcBDOIW (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 4 Feb 2016 09:08:22 -0500
Content-Disposition: inline
In-Reply-To: <20160204135056.GE10826@n2100.arm.linux.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Geert Uytterhoeven <geert@linux-m68k.org>, Linux-Next <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On Thu, Feb 04, 2016 at 01:50:56PM +0000, Russell King - ARM Linux wrote:
> > I am still convinced that this is an architecture issue.  Given that 64 bit 
> > values work in the *get_user implementations on other architectures, I see 
> > no reason there should need to be a workaround for this in common code.
> 
> So you're happy to break x86-32 then...

x86-32 works fine.

		-ben
-- 
"Thought is the essence of where you are now."
