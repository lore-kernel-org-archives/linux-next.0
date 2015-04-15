From: Quentin Casasnovas <quentin.casasnovas@oracle.com>
Subject: Re: [PATCH 0/2] Tentative fix for the divide-by-zero on
 score/paris/..
Date: Wed, 15 Apr 2015 15:46:37 +0200
Message-ID: <20150415134637.GB5947@chrystal.uk.oracle.com>
References: <20150414165000.GA19434@roeck-us.net>
 <1429088078-23827-1-git-send-email-quentin.casasnovas@oracle.com>
 <552E6722.1080507@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from aserp1040.oracle.com ([141.146.126.69]:30032 "EHLO
	aserp1040.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752877AbbDONoW (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 15 Apr 2015 09:44:22 -0400
Content-Disposition: inline
In-Reply-To: <552E6722.1080507@roeck-us.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Quentin Casasnovas <quentin.casasnovas@oracle.com>, Rusty Russell <rusty@rustcorp.com.au>, lkml <linux-kernel@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next <linux-next@vger.kernel.org>

On Wed, Apr 15, 2015 at 06:26:58AM -0700, Guenter Roeck wrote:
> On 04/15/2015 01:54 AM, Quentin Casasnovas wrote:
> >
> > Let me know if this makes things better..
> >

Hi Guenter,

> 
> the crash is fixed, but now I get
>

That's a first step.. :)

> FATAL: The relocation at __ex_table+0x4 references
> [...]
> 
> for parisc:defconfig,
> for score:allnoconfig, and
> for mn10300:defconfig.

Thanks for the testing, much appreciated!

> 
> While I agree that those should get fixed (if they are real problems,
> especially the ones for parisc and mn10300), I don't think it is
> a good idea to fail the build because of it.

That's a tough one..  I think it's pretty bad in general to have some
crufts in the ex_table referencing non-executable sections.  Note that it
will not make the build fail if the relocation _seems_ legit (jump to an
executable section even though it's not part of the white-list) but in
those cases, something really does look wrong and could potentially have a
security impact so I thought the build failure was a good thing to do.

Now, if it's a problem in modpost (which is likely!), then obviously I'd be
happy to try and help fix that!

> 
> Note that I did find the problem in the score build; that was a real bug.
> I don't know what may be wrong with the others.

Cool!  Mind CC'ing me to your fix, I'm curious :)

Regarding the others, if you've compiled them with debug information, you
should be able to do some addr2line magic incantation to find the offending
code.  I've also added scripts/check_extable.sh which you might be able to
use to get more details about the failures (or simply use the same logic in
there to know where those maybe-wrong-relocations are coming from).

I'm surprised/concerned that some sections appear to have no name though
(indicating yet another bug in my modpost changes?).. If you can share the
object files then I can have a look (and possibly help with the addr2line
incantation).

Thanks!
Quentin
