From: Benjamin LaHaise <bcrl@kvack.org>
Subject: Re: linux-next: build failure after merge of the aio tree
Date: Thu, 4 Feb 2016 09:32:04 -0500
Message-ID: <20160204143204.GC16315@kvack.org>
References: <20160112164034.0fe945a7@canb.auug.org.au> <20160112163835.GD347@kvack.org> <20160127134024.0fababf6@canb.auug.org.au> <20160129113056.GP10826@n2100.arm.linux.org.uk> <CAMuHMdUy-cqeN8COO4rdpY-mOH+6gth40wB31-edkj8CO5PFCw@mail.gmail.com> <20160204131959.6695c7bf@canb.auug.org.au> <20160204134142.GA16315@kvack.org> <20160204135056.GE10826@n2100.arm.linux.org.uk> <20160204140822.GB16315@kvack.org> <20160204141253.GF10826@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from kanga.kvack.org ([205.233.56.17]:45877 "EHLO kanga.kvack.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751081AbcBDOcF (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 4 Feb 2016 09:32:05 -0500
Content-Disposition: inline
In-Reply-To: <20160204141253.GF10826@n2100.arm.linux.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Geert Uytterhoeven <geert@linux-m68k.org>, Linux-Next <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On Thu, Feb 04, 2016 at 02:12:53PM +0000, Russell King - ARM Linux wrote:
> Hence, __get_user() on x86-32 with a 64-bit quantity results in
> __get_user_bad() being called, which is an undefined function.
> Only if you build with x86-64 support enabled (iow, CONFIG_X86_32 not
> defined) then you get the 64-bit __get_user() support.
> 
> Given this, I fail to see how x86-32 can possibly work.

You're right; mea culpa.  It compiles without warning on x86-32, but it 
does not link.  I still think this is broken archtecture stupidity since 
put_user() works for 64 bit data types.

		-ben
-- 
"Thought is the essence of where you are now."
