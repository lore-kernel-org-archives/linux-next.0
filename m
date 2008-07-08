From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: linux-next: kbuild tree build failure
Date: Tue, 8 Jul 2008 23:19:30 +0200
Message-ID: <20080708211930.GA16897@uranus.ravnborg.org>
References: <20080707184038.aaeb8d40.sfr@canb.auug.org.au> <Pine.LNX.4.64.0807071424240.6791@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from pasmtpb.tele.dk ([80.160.77.98]:59525 "EHLO pasmtpB.tele.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750885AbYGHVSn (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 8 Jul 2008 17:18:43 -0400
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.64.0807071424240.6791@localhost.localdomain>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Roman Zippel <zippel@linux-m68k.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Paul Mackerras <paulus@samba.org>, linuxppc-dev@ozlabs.org

Hi Roman.

I thought a bit more about this.

> I should have gone through all archs to test this, sorry about that.
> Luckily it's only powerpc that uses 64bit values. I would prefer to 
> standardize on 32bit values, as it doesn't really make sense to expect 
> from the user to input full 64bit values and it's easy to generate the 
> full value in a header.

We use Kconfig for a mixture of user editable values and fixed
configuration values.
And I agree that asking the user to input a 64 bit number is not usefull.

But keeping support for 64 bit values is what I would consider
expected functionality.
So removing support for 64 bit is not good IMO.

> This would also ease on any portability issues 
> (kconfig is compiled with the host compiler not the target compiler).

We use strtol() in a few places in symbol.c already where we do an
implicit conversion to int. Why did this not cause us problems before?

Is it because these code paths are only triggered when we deal with ranges?
If so we could 'fix' strdup_type() to not use strto{,u}l() so it
is 64 bit clean and we are back to old behaviour.

	Sam
