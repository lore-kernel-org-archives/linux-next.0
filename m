From: Benjamin LaHaise <bcrl@kvack.org>
Subject: Re: linux-next: build failure after merge of the aio tree
Date: Thu, 4 Feb 2016 08:41:42 -0500
Message-ID: <20160204134142.GA16315@kvack.org>
References: <20160112164034.0fe945a7@canb.auug.org.au> <20160112163835.GD347@kvack.org> <20160127134024.0fababf6@canb.auug.org.au> <20160129113056.GP10826@n2100.arm.linux.org.uk> <CAMuHMdUy-cqeN8COO4rdpY-mOH+6gth40wB31-edkj8CO5PFCw@mail.gmail.com> <20160204131959.6695c7bf@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from kanga.kvack.org ([205.233.56.17]:45017 "EHLO kanga.kvack.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755329AbcBDNln (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 4 Feb 2016 08:41:43 -0500
Content-Disposition: inline
In-Reply-To: <20160204131959.6695c7bf@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Linux-Next <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On Thu, Feb 04, 2016 at 01:19:59PM +1100, Stephen Rothwell wrote:
> Hi Benjamin,
> 
> On Fri, 29 Jan 2016 13:03:39 +0100 Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> >
> > On Fri, Jan 29, 2016 at 12:30 PM, Russell King - ARM Linux
> > <linux@arm.linux.org.uk> wrote:
> > >> Background: new aio code is adding __get_user() calls referencing 64
> > >> bit quantities (__u64 and __s64).  
> > >
> > > There's lots more architectures which do not support 64-bit get_user()
> > > _or_ __get_user(): avr32, blackfin, metag for example, and m68k which
> > > has this interesting thing "/* case 8: disabled because gcc-4.1 has a
> > > broken typeof \" in its *get_user() implementation.  
> > 
> > And if you enable it again, you get lots of "warning: cast to pointer from
> > integer of different size", like you mentioned.
> 
> Any thoughts?  I am still using the version of tha aio tree from
> next-20160111.

I am still convinced that this is an architecture issue.  Given that 64 bit 
values work in the *get_user implementations on other architectures, I see 
no reason there should need to be a workaround for this in common code.

		-ben

> -- 
> Cheers,
> Stephen Rothwell

-- 
"Thought is the essence of where you are now."
