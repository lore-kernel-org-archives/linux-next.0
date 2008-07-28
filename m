From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH 00/12] Thumb-2 kernel support
Date: Mon, 28 Jul 2008 13:50:39 +0100
Message-ID: <20080728125039.GK32366@flint.arm.linux.org.uk>
References: <20080606173300.7930.31525.stgit@pc1117.cambridge.arm.com> <20080630125110.1dc5689a.akpm@linux-foundation.org> <1214901131.29199.31.camel@pc1117.cambridge.arm.com> <20080701014529.272706d8.akpm@linux-foundation.org> <1216829155.23395.19.camel@pc1117.cambridge.arm.com> <20080723130140.ff016944.akpm@linux-foundation.org> <1216847422.6550.8.camel@localhost.localdomain> <20080723151045.bcae107e.akpm@linux-foundation.org> <20080727110804.GE32366@flint.arm.linux.org.uk> <1217245511.20282.121.camel@pc1117.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:56409 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750790AbYG1MvG (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 28 Jul 2008 08:51:06 -0400
Content-Disposition: inline
In-Reply-To: <1217245511.20282.121.camel@pc1117.cambridge.arm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, linux-arm-kernel@lists.arm.linux.org.uk

On Mon, Jul 28, 2008 at 12:45:11PM +0100, Catalin Marinas wrote:
> On Sun, 2008-07-27 at 12:08 +0100, Russell King - ARM Linux wrote:
> > On Wed, Jul 23, 2008 at 03:10:45PM -0700, Andrew Morton wrote:
> > > Well.  Rather than doing things sequentially we could go parallel. 
> > > Russell could say "I'll look at them before 2.6.28 but please put them
> > > into linux-next meanwhile".
> > 
> > There have been some valid but (iirc) non-vocal objections to the
> > Thumb-2 support from a few people.  The biggest one is all the
> > mess associated with supporting this "unified" assembler stuff.
> 
> My first implementation of these patches (last year) created a separate
> arch/ directory and a lot of people objected to this recommending to
> merge it into the existing arch/arm. Once I posted the re-worked
> implementation there were no big .

I'm not surprised.  People don't want to duplicate their machine support
across two arch/arm for the same family of SoCs.

> I agree that the syntax isn't as readable as before but this is mainly
> because we need to support older binutils via conditional compilation
> (the unified assembly syntax itself isn't as bad). IIRC, some people
> were OK with this as long as, at some point, the conditional compilation
> can be removed once most of the binutils in use support it (I think this
> syntax is already 2 years old).

How is that realistically achievable given the issues that I've raised
over the impossibility of review and the issues with gcc not knowing
how many instructions an asm() statement generates?

> If you don't like the unified assembly syntax at all, I can't help much
> (not even argue whether it makes sense or not, I wasn't involved in
> designing it and it's pretty late to change it now anyway).

If neither of us can "help much", then T2 won't be going in, and ARM
Ltd is going to have to accept that T2 isn't going to be supported by
mainline Linux.

However, there is another solution to this: ARM Ltd could write a
static checker to ensure that the 'itxxxx' instructions match the
conditions in the following instructions, resulting in disagreements
between them being spotted at build time, rather than having some
data corrupting bug lurking around.

I totally disagree with getting rid of those conditional suffixes
even for T2 only code - doing so will make my objection even stronger
against T2.  Rather than getting rid of the conditional suffixes, use
them as a continuing existing check that the 'itxxxx' instructions are
correct.

Then we can pick up on things like merge errors, bad patches, wrong
'itxxxx' covering the following instructions, etc.

I think I've proven my point well - at least one of those 'itxxxx'
instructions in your patch is wrong, but not obviously wrong from
reading the patches.  That's only one which looked at how the
resulting code actually turns out.  I didn't thoroughly check the
others, so there could be other issues lurking in the missing
patch context lines.

> IMHO, I don't think the assembly syntax for an architecture is a valid
> reason to reject patches.

My objection is primerily on the readability of the code in the ARM
kernel, and the viability of continued maintainence of it - which is
an extremely important consideration and one which trumps *everything*
else - and it's that basis which I'm rejecting the patches.

That objection is directly caused by this crappy assembly syntax.  So
you can turn it into something political by saying that it's the
assembly syntax I'm objecting to.  My objection is _far_ more than
that.

> > My view is that I really don't like these patches; they make the
> > code very unreadable and more prone to errors.  They're going to
> > cause us lots of problems in the future.  Every git merge which
> > touches any ARM file containing assembly is going to have to be
> > _very_ carefully reviewed, and it's not always possible to catch
> > all of those.
> > 
> > The only suggestion I have to improving the situation is to recommend
> > that someone rethinks their wizzy new assembly language format - which
> > IMHO is currently only fit for "write once, read or modify never"
> > assembly code.
> 
> There were some public discussions in the past with Richard Earnshaw
> (gcc/binutils) here in ARM regarding the assembly syntax but I don't
> think it can be changed in a fully backwards compatible way while
> supporting a slightly different instruction set.

Were there?  That's the first I've heard of them!  The use of "public"
here is actually rather annoying.  They may have been "public" from the
point of view of being on some random mailing list on the Internet, but
that doesn't mean that everyone concerned knows that they're going on.

And no one person can have a finger in every pie, or be subscribed to
every mailing list on the planet and be able to track what's going on.

I don't consider the discussions here as "public".  They're "public" in
the sense of addressing this community, but if we were to talk about
changing the glibc<->kernel interface here only, and then claim to the
glibc people "but the discussions were public" they'd laugh at us.

> ???I would really like some clear statement from you to know where to
> focus my attention (clean up the current patches even more or create
> separate arch/arm-t2). AFAICT, you don't really like these patches
> merged, in which case I'd have to focus on the second option.

I've put my point of view forward in the responses to the patches.
I'm not sure what "clear statement" you're really after.

Also, I'm not entirely sure why there's a body of people who grumble
about this stuff, but don't post their concerns...

Maybe if that ARM Linux developers conference had gone ahead, this
could have been discussed there in a broader manner and some way
forward could have been reached.
