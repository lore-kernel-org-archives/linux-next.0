From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
Date: Fri, 6 May 2016 16:09:16 +1000
Message-ID: <20160506160916.3192f615@canb.auug.org.au>
References: <20160506145810.04a319d3@canb.auug.org.au>
	<20160505224429.3b8f3837bcb0281932cfe03f@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:60078 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751054AbcEFGJT (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 6 May 2016 02:09:19 -0400
In-Reply-To: <20160505224429.3b8f3837bcb0281932cfe03f@linux-foundation.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>

Hi Andrew,

On Thu, 5 May 2016 22:44:29 -0700 Andrew Morton <akpm@linux-foundation.org> wrote:
>
> On Fri, 6 May 2016 14:58:10 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> 
> > After merging the akpm-current tree, today's linux-next build (and a
> > few earlier ones) (powerpc allnoconfig (and many others)) failed like
> > this:
> > 
> > lib/vsprintf.c:160:2: error: initializer element is not constant
> > lib/vsprintf.c:160:2: error: (near initialization for 'decpair[0]')
> > lib/vsprintf.c:160:2: error: initializer element is not constant
> > lib/vsprintf.c:160:2: error: (near initialization for 'decpair[1]')
> > lib/vsprintf.c:160:2: error: initializer element is not constant
> > lib/vsprintf.c:160:2: error: (near initialization for 'decpair[2]')
> > lib/vsprintf.c:160:2: error: initializer element is not constant
> > lib/vsprintf.c:160:2: error: (near initialization for 'decpair[3]')
> > lib/vsprintf.c:160:2: error: initializer element is not constant
> > 
> > and more ... basically any big endian build of code using __swabxx
> > or cpu_to_lexx in initailisers (in the above case cpu_to_le16()).
> > 
> > Caused (presumably) by commit
> > 
> >   eeee46ed3cda ("byteswap: try to avoid __builtin_constant_p gcc bug")
> > 
> > This is a buyild using gcc 4.6.3.
> > 
> > I have revreted that commit for today to see if it fixes the overnight
> > builds.  
> 
> hm, it works for me.  powerpc allnoconfig, after setting CONFIG_PPC64=y.

Interesting ...  mine also works with gcc 5.2.0. I do 32 and 64 bit
allnoconfig powerpc builds before I release linux-next and they work,
but the 32 bit one fails overnight when gcc 4.6.3 is used :-( (we don't
do a 64 bit allnoconfig overnight as it requires playing with the
generated .config).  Basically all the powerpc builds were failing with
gcc 4.6.3 since next-20160502.

The overnight powerpc allnoconfig build has just succeeded for today's
linux-next.

-- 
Cheers,
Stephen Rothwell
