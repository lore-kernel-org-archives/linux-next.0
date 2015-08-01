From: "Luis R. Rodriguez" <mcgrof@suse.com>
Subject: Re: Build error in -next due to 'drivers/video/fbdev/atyfb: Replace
 MTRR UC hole with strong UC'
Date: Sat, 1 Aug 2015 02:39:33 +0200
Message-ID: <20150801003933.GT30479@wotan.suse.de>
References: <55BADCB8.3030503@roeck-us.net>
 <CAP=VYLoUTKemCoqw8t6mC4Gz+-HrhUzMY7DvTL-yE0Cx6gpJQw@mail.gmail.com>
 <20150801000233.GS30479@wotan.suse.de>
 <55BC0E50.9060606@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:45952 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751891AbbHAAjf (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 31 Jul 2015 20:39:35 -0400
Content-Disposition: inline
In-Reply-To: <55BC0E50.9060606@roeck-us.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, Ingo Molnar <mingo@kernel.org>

On Fri, Jul 31, 2015 at 05:09:52PM -0700, Guenter Roeck wrote:
> On 07/31/2015 05:02 PM, Luis R. Rodriguez wrote:
> >On Fri, Jul 31, 2015 at 01:52:24PM -0400, Paul Gortmaker wrote:
> >>On Thu, Jul 30, 2015 at 10:26 PM, Guenter Roeck <linux@roeck-us.net> wrote:
> >>>Hi Luis,
> >>>
> >>>probably the zero-day build already told you, but just in case:
> >>>
> >>>Your commit 'drivers/video/fbdev/atyfb: Replace MTRR UC hole with strong UC'
> >>>causes build errors for architectures which don't support ioremap_uc.
> >>>This affects at least the alpha architecture, though there may be others.
> >>
> >>Yep, parisc allmodconfig now sees it as well.  Bisected before seeing
> >>this message.
> >>
> >>3cc2dac5be3f23414a4efdee0b26d79bed297cac is the first bad commit
> >>commit 3cc2dac5be3f23414a4efdee0b26d79bed297cac
> >>Author: Luis R. Rodriguez <mcgrof@suse.com>
> >>Date:   Thu Jul 9 18:24:58 2015 -0700
> >>
> >>     drivers/video/fbdev/atyfb: Replace MTRR UC hole with strong UC
> >>
> >>http://kisskb.ellerman.id.au/kisskb/buildresult/12475234/
> >
> >I submitted a fix for it, can you tell me your linux-next tree?
> >
> 
> http://server.roeck-us.net:8010/builders/next-alpha-next
> 
> next-20150729 to next-20150731.

Great thanks, I sent a proposal general fix, that should be tested first.
If all the bots say go for it, then yay, otherwise a simple

#define ioremap_uc ioremap_nocache

would be the way to go, but I would prefer to fix this sort of thing for good.

  Luis
