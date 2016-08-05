From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: powerpc allyesconfig / allmodconfig linux-next next-20160729 -
 next-20160729 build failures
Date: Fri, 5 Aug 2016 18:41:08 +1000
Message-ID: <20160805184108.7fc3dbd0@roar.ozlabs.ibm.com>
References: <CAB=NE6U18jv89pxqAeZY8eTj44mq90kyXGaQO-108+ZMTyxQiQ@mail.gmail.com>
	<1880505.MpH3ISbtMJ@wuerfel>
	<20160804214713.4baa832e@roar.ozlabs.ibm.com>
	<2405930.iJXNaXEjI5@wuerfel>
	<20160804170640.GC22744@gate.crashing.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pf0-f196.google.com ([209.85.192.196]:33723 "EHLO
	mail-pf0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757779AbcHEIlm (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 5 Aug 2016 04:41:42 -0400
In-Reply-To: <20160804170640.GC22744@gate.crashing.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Segher Boessenkool <segher@kernel.crashing.org>
Cc: Arnd Bergmann <arnd@arndb.de>, linuxppc-dev@lists.ozlabs.org, Stephen Rothwell <sfr@canb.auug.org.au>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Luis R. Rodriguez" <mcgrof@kernel.org>, linux-next@vger.kernel.org, Paul Mackerras <paulus@samba.org>, Fengguang Wu <fengguang.wu@intel.com>, Guenter Roeck <linux@roeck-us.net>

On Thu, 4 Aug 2016 12:06:41 -0500
Segher Boessenkool <segher@kernel.crashing.org> wrote:

> On Thu, Aug 04, 2016 at 06:10:57PM +0200, Arnd Bergmann wrote:
> > On Thursday, August 4, 2016 9:47:13 PM CEST Nicholas Piggin wrote:
> >   
> > > +	__used							\
> > > +	__attribute__((section("___kentry" "+" #sym ",\"a\",@note #"), used)) \  
> > 
> > 
> > I've just started testing this, but the first problem I ran into
> > is that @ and # are special characters that have an architecture
> > specific meaning to the assembler. On ARM, you need "%note @" instead
> > of "@note #".  
> 
> That comment trick (I still feel guilty about it) causes more problems
> than it solves.  Please don't try to use it :-)

Yeah that's a funny hack. I don't think it's required though, but I'm just
running through some more tests.

I think I found an improvement with the thin archives as well -- we were
still building symbol table after removing the s option (that only avoids
index). "S" is required to not build symbol table.

I'll send out an RFC on a slightly more polished patch series shortly.

Thanks,
Nick
