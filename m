From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: linux-next: kbuild tree build failure
Date: Tue, 5 May 2009 08:43:17 +0200
Message-ID: <20090505064317.GA14708@uranus.ravnborg.org>
References: <20090505111712.ae4649b3.sfr@canb.auug.org.au> <49FFFA36.76EA.0078.0@novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from pfepb.post.tele.dk ([195.41.46.236]:48358 "EHLO
	pfepb.post.tele.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757419AbZEEGlI (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 5 May 2009 02:41:08 -0400
Content-Disposition: inline
In-Reply-To: <49FFFA36.76EA.0078.0@novell.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jan Beulich <jbeulich@novell.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, StevenWhitehouse <swhiteho@redhat.com>, linux-next@vger.kernel.org

On Tue, May 05, 2009 at 07:35:02AM +0100, Jan Beulich wrote:
> >>> Stephen Rothwell <sfr@canb.auug.org.au> 05.05.09 03:17 >>>
> >OK, looking at the preprocessor output, I see we have a previous variable
> >(static match_table_t __initconst tokens) with __attribute__ ((__section__
> >(".init.rodata"))) but it is not const ... (This came from commit
> >a447c0932445f92ce6f4c1bd020f62c5097a7842 "vfs: Use const for kernel
> >parser table" which changed "tokens" from __initdata to __initconst.  Not
> >using "const" seems deliberate, but the changelog does not include enough
> >information as to why.)
> >
> >So, I will revert the above commit for today to allow it to be "improved"
> >by also fixing the tokens variable definition above.  Of course there may
> >be other places where such mixed definitions exist.
> 
> That is the downside of not folding the 'const' modifier into the __initconst
> annotation. It is *always* an error to annotate something __initconst but
> not also make it const.

But if we folded const in __initconst would this be correct:

drivers/net/eql.c:static const char version[] __initconst =

?

It is now:
static const char version[] = ...

And will become:
static char version[] const =

gcc does not like the latter:
$ cat jan.c:
static const char version[]  = "oldstuff";
static char version2[] const = "newstuff";

void foo(const char bar[])
{
}

void baz()
{
        foo(version);
        foo(version2);
}
$ gcc jan.c:
jan.c:2: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'const'
jan.c: In function 'baz':
jan.c:11: error: 'version2' undeclared (first use in this function)
jan.c:11: error: (Each undeclared identifier is reported only once
jan.c:11: error: for each function it appears in.)

	Sam
