From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH] compiler-gcc: require gcc 4.8 for powerpc
 __builtin_bswap16()
Date: Mon, 9 May 2016 18:31:02 +1000
Message-ID: <20160509183102.45d8dbe9@canb.auug.org.au>
References: <20160506145810.04a319d3@canb.auug.org.au>
	<20160505224429.3b8f3837bcb0281932cfe03f@linux-foundation.org>
	<20160506160916.3192f615@canb.auug.org.au>
	<1462517712.8044.2.camel@ellerman.id.au>
	<20160506142225.rtp2swmdgfzucfjl@treble>
	<20160509105927.68dfa6d2@canb.auug.org.au>
	<CA+icZUWuybX42vW=ADLT_b+_P87DGjtcA3nXGpV+gq5LtkB3eA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:59540 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751245AbcEIIbF (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 9 May 2016 04:31:05 -0400
In-Reply-To: <CA+icZUWuybX42vW=ADLT_b+_P87DGjtcA3nXGpV+gq5LtkB3eA@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Sedat Dilek <sedat.dilek@gmail.com>
Cc: Josh Poimboeuf <jpoimboe@redhat.com>, Michael Ellerman <mpe@ellerman.id.au>, Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Linus Torvalds <torvalds@linux-foundation.org>

Hi Sedat,

On Mon, 9 May 2016 07:39:24 +0200 Sedat Dilek <sedat.dilek@gmail.com> wrote:
>
> On 5/9/16, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > And since "byteswap: try to avoid __builtin_constant_p gcc bug" is not
> > in Linus' tree, hopefully we can have this fix applied soon.
> 
> FYI, this patch is in Linus tree (v4.6-rc7 has it).

Yes, the "not" was a typo.

-- 
Cheers,
Stephen Rothwell
