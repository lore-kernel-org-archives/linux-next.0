From: Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH 00/12] Thumb-2 kernel support
Date: Mon, 28 Jul 2008 12:45:11 +0100
Message-ID: <1217245511.20282.121.camel@pc1117.cambridge.arm.com>
References: <20080606173300.7930.31525.stgit@pc1117.cambridge.arm.com>
	 <20080630125110.1dc5689a.akpm@linux-foundation.org>
	 <1214901131.29199.31.camel@pc1117.cambridge.arm.com>
	 <20080701014529.272706d8.akpm@linux-foundation.org>
	 <1216829155.23395.19.camel@pc1117.cambridge.arm.com>
	 <20080723130140.ff016944.akpm@linux-foundation.org>
	 <1216847422.6550.8.camel@localhost.localdomain>
	 <20080723151045.bcae107e.akpm@linux-foundation.org>
	 <20080727110804.GE32366@flint.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cam-admin0.cambridge.arm.com ([193.131.176.58]:45829 "EHLO
	cam-admin0.cambridge.arm.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751237AbYG1LqE convert rfc822-to-8bit
	(ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 28 Jul 2008 07:46:04 -0400
In-Reply-To: <20080727110804.GE32366@flint.arm.linux.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, linux-arm-kernel@lists.arm.linux.org.uk

On Sun, 2008-07-27 at 12:08 +0100, Russell King - ARM Linux wrote:
> On Wed, Jul 23, 2008 at 03:10:45PM -0700, Andrew Morton wrote:
> > Well.  Rather than doing things sequentially we could go parallel.=20
> > Russell could say "I'll look at them before 2.6.28 but please put t=
hem
> > into linux-next meanwhile".
>=20
> There have been some valid but (iirc) non-vocal objections to the
> Thumb-2 support from a few people.  The biggest one is all the
> mess associated with supporting this "unified" assembler stuff.

My first implementation of these patches (last year) created a separate
arch/ directory and a lot of people objected to this recommending to
merge it into the existing arch/arm. Once I posted the re-worked
implementation there were no big .

I agree that the syntax isn't as readable as before but this is mainly
because we need to support older binutils via conditional compilation
(the unified assembly syntax itself isn't as bad). IIRC, some people
were OK with this as long as, at some point, the conditional compilatio=
n
can be removed once most of the binutils in use support it (I think thi=
s
syntax is already 2 years old).

If you don't like the unified assembly syntax at all, I can't help much
(not even argue whether it makes sense or not, I wasn't involved in
designing it and it's pretty late to change it now anyway). What I can
do is try to make the Thumb-2 patches cleaner following comments I get
on the list (and assuming that I get comments more often than twice a
year :-)).

IMHO, I don't think the assembly syntax for an architecture is a valid
reason to reject patches. But if you really want to keep arch/arm clean=
,
that's fine with me and I can duplicate parts of it into arch/arm-t2
(with many files compiled directly from arch/arm as I don't want to
duplicate the arch/arm/mach-* stuff). This would only support ARMv7
onwards where Thumb-2 is mandated and use fairly recent binutils. Since
you don't like the unified assembly syntax you probably won't like to
maintain arch/arm-t2 either and this is fine as well, I can do it (the
code base would be relatively small anyway, it's mainly the assembly
files and some inline assembly in headers).

> My view is that I really don't like these patches; they make the
> code very unreadable and more prone to errors.  They're going to
> cause us lots of problems in the future.  Every git merge which
> touches any ARM file containing assembly is going to have to be
> _very_ carefully reviewed, and it's not always possible to catch
> all of those.
>=20
> The only suggestion I have to improving the situation is to recommend
> that someone rethinks their wizzy new assembly language format - whic=
h
> IMHO is currently only fit for "write once, read or modify never"
> assembly code.

There were some public discussions in the past with Richard Earnshaw
(gcc/binutils) here in ARM regarding the assembly syntax but I don't
think it can be changed in a fully backwards compatible way while
supporting a slightly different instruction set.

=EF=BB=BFI would really like some clear statement from you to know wher=
e to
focus my attention (clean up the current patches even more or create
separate arch/arm-t2). AFAICT, you don't really like these patches
merged, in which case I'd have to focus on the second option.

Thanks.

--=20
Catalin
