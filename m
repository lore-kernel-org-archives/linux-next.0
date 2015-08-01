From: "Luis R. Rodriguez" <mcgrof@suse.com>
Subject: Re: Build error in -next due to 'drivers/video/fbdev/atyfb: Replace
 MTRR UC hole with strong UC'
Date: Sat, 1 Aug 2015 02:02:33 +0200
Message-ID: <20150801000233.GS30479@wotan.suse.de>
References: <55BADCB8.3030503@roeck-us.net>
 <CAP=VYLoUTKemCoqw8t6mC4Gz+-HrhUzMY7DvTL-yE0Cx6gpJQw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:43533 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754566AbbHAACg (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 31 Jul 2015 20:02:36 -0400
Content-Disposition: inline
In-Reply-To: <CAP=VYLoUTKemCoqw8t6mC4Gz+-HrhUzMY7DvTL-yE0Cx6gpJQw@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: Guenter Roeck <linux@roeck-us.net>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, Ingo Molnar <mingo@kernel.org>

On Fri, Jul 31, 2015 at 01:52:24PM -0400, Paul Gortmaker wrote:
> On Thu, Jul 30, 2015 at 10:26 PM, Guenter Roeck <linux@roeck-us.net> wrote:
> > Hi Luis,
> >
> > probably the zero-day build already told you, but just in case:
> >
> > Your commit 'drivers/video/fbdev/atyfb: Replace MTRR UC hole with strong UC'
> > causes build errors for architectures which don't support ioremap_uc.
> > This affects at least the alpha architecture, though there may be others.
> 
> Yep, parisc allmodconfig now sees it as well.  Bisected before seeing
> this message.
> 
> 3cc2dac5be3f23414a4efdee0b26d79bed297cac is the first bad commit
> commit 3cc2dac5be3f23414a4efdee0b26d79bed297cac
> Author: Luis R. Rodriguez <mcgrof@suse.com>
> Date:   Thu Jul 9 18:24:58 2015 -0700
> 
>     drivers/video/fbdev/atyfb: Replace MTRR UC hole with strong UC
> 
> http://kisskb.ellerman.id.au/kisskb/buildresult/12475234/

I submitted a fix for it, can you tell me your linux-next tree?

git describe

  Luis
