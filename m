From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: linux-next: Tree for Apr 14 (crash due to modpost patch)
Date: Tue, 14 Apr 2015 09:50:00 -0700
Message-ID: <20150414165000.GA19434@roeck-us.net>
References: <20150414184244.0f1d1383@canb.auug.org.au>
 <20150414161114.GA18420@roeck-us.net>
 <20150414163603.GD2925@chrystal.uk.oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:50354 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932097AbbDNQuG (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 14 Apr 2015 12:50:06 -0400
Received: from mailnull by bh-25.webhostbox.net with sa-checked (Exim 4.82)
	(envelope-from <linux@roeck-us.net>)
	id 1Yi42H-001naw-T6
	for linux-next@vger.kernel.org; Tue, 14 Apr 2015 16:50:05 +0000
Content-Disposition: inline
In-Reply-To: <20150414163603.GD2925@chrystal.uk.oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Quentin Casasnovas <quentin.casasnovas@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Rusty Russell <rusty@rustcorp.com.au>

On Tue, Apr 14, 2015 at 06:36:03PM +0200, Quentin Casasnovas wrote:
> On Tue, Apr 14, 2015 at 09:11:14AM -0700, Guenter Roeck wrote:
> > On Tue, Apr 14, 2015 at 06:42:44PM +1000, Stephen Rothwell wrote:
[ ... ]
> 
> It is rude and I'm really sorry about this, I had only tested this on
> x86_64 and sparc.
> 
> Should I send a tentative fix or will you do it since you've done all the
> hard work?  In any case thanks for the detailed analysis.
> 
Hi Quentin,

I don't really know what to cast the pointers to, given they have different
real types (and maybe you should not even pass the pointers in the first
place but do that test in the calling code), so I'll leave the fixing up
to you. If you Cc: me on the fix, I can test it for the affected architectures
(score, mn10300, parisc, parisc64).

Thanks,
Guenter
