From: Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH 00/12] Thumb-2 kernel support
Date: Mon, 28 Jul 2008 15:41:30 +0100
Message-ID: <1217256090.20282.199.camel@pc1117.cambridge.arm.com>
References: <20080606173300.7930.31525.stgit@pc1117.cambridge.arm.com>
	 <20080630125110.1dc5689a.akpm@linux-foundation.org>
	 <1214901131.29199.31.camel@pc1117.cambridge.arm.com>
	 <20080701014529.272706d8.akpm@linux-foundation.org>
	 <1216829155.23395.19.camel@pc1117.cambridge.arm.com>
	 <20080723130140.ff016944.akpm@linux-foundation.org>
	 <1216847422.6550.8.camel@localhost.localdomain>
	 <20080723151045.bcae107e.akpm@linux-foundation.org>
	 <20080727110804.GE32366@flint.arm.linux.org.uk>
	 <1217245511.20282.121.camel@pc1117.cambridge.arm.com>
	 <20080728125039.GK32366@flint.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cam-admin0.cambridge.arm.com ([193.131.176.58]:43076 "EHLO
	cam-admin0.cambridge.arm.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751070AbYG1OmA convert rfc822-to-8bit
	(ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 28 Jul 2008 10:42:00 -0400
In-Reply-To: <20080728125039.GK32366@flint.arm.linux.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, linux-arm-kernel@lists.arm.linux.org.uk

(the e-mails are getting pretty long but I think this is useful as we'v=
e
never discussed properly about this in the past)

On Mon, 2008-07-28 at 13:50 +0100, Russell King - ARM Linux wrote:
> On Mon, Jul 28, 2008 at 12:45:11PM +0100, Catalin Marinas wrote:
> > On Sun, 2008-07-27 at 12:08 +0100, Russell King - ARM Linux wrote:
> > > There have been some valid but (iirc) non-vocal objections to the
> > > Thumb-2 support from a few people.  The biggest one is all the
> > > mess associated with supporting this "unified" assembler stuff.
> >=20
> > My first implementation of these patches (last year) created a sepa=
rate
> > arch/ directory and a lot of people objected to this recommending t=
o
> > merge it into the existing arch/arm. Once I posted the re-worked
> > implementation there were no big .
>=20
> I'm not surprised.  People don't want to duplicate their machine supp=
ort
> across two arch/arm for the same family of SoCs.

IIRC, I left most of the machine support under arch/arm/, only some
Makefile/Kconfig files needed to be duplicated.

> > I agree that the syntax isn't as readable as before but this is mai=
nly
> > because we need to support older binutils via conditional compilati=
on
> > (the unified assembly syntax itself isn't as bad). IIRC, some peopl=
e
> > were OK with this as long as, at some point, the conditional compil=
ation
> > can be removed once most of the binutils in use support it (I think=
 this
> > syntax is already 2 years old).
>=20
> How is that realistically achievable given the issues that I've raise=
d
> over the impossibility of review and the issues with gcc not knowing
> how many instructions an asm() statement generates?

What is this information used for? Size? AFAIK, gcc currently counts th=
e
number of new lines or semicolons but if it needs this to guess the siz=
e
of the asm block it is wrong anyway as Thumb-2 instructions have
variable size.

> > If you don't like the unified assembly syntax at all, I can't help =
much
> > (not even argue whether it makes sense or not, I wasn't involved in
> > designing it and it's pretty late to change it now anyway).
>=20
> If neither of us can "help much", then T2 won't be going in, and ARM
> Ltd is going to have to accept that T2 isn't going to be supported by
> mainline Linux.

The unified assembly can't be changed (unless there is a really good
reason like proving it inconsistent on the ARM/Thumb-2 instruction set
rather than Linux-related) - it is already implemented in gcc/binutils,
ARM compiler and some other proprietary toolchains and the cost of
changing this would be quite high. The main decision was taken when
breaking the compatibility with the old syntax and that's why in
new-syntax files you add ".syntax unified".

If you look at Thumb-2 as a new instruction set (though it's pretty
close to ARM, especially with the unified syntax), I don't see why this
couldn't go into mainline as arch/arm-t2/. If we want to go this route,
I don't think it should be your decision *exclusively* but rather a
combination of yours and others upstream.

> However, there is another solution to this: ARM Ltd could write a
> static checker to ensure that the 'itxxxx' instructions match the
> conditions in the following instructions, resulting in disagreements
> between them being spotted at build time, rather than having some
> data corrupting bug lurking around.
>=20
> I totally disagree with getting rid of those conditional suffixes
> even for T2 only code - doing so will make my objection even stronger
> against T2.  Rather than getting rid of the conditional suffixes, use
> them as a continuing existing check that the 'itxxxx' instructions ar=
e
> correct.

You might have read some (initial) draft documents but the unified
syntax enforces the IT instruction to match the subsequent conditional
suffixes. Have a look at my patches to see that everything conditional
instruction has a flag matching the corresponding IT flag. With -mthumb=
,
gas even complaints if a suffix is missing or incompatible with a
previous IT instruction. It doesn't do this for ARM as it ignores the I=
T
instruction completely (i.e. only takes the conditional suffixes into
account). Since the IT instruction in ARM isn't mandatory, there is no
be any reason to enforce it (if it exists, it could check it but you
easily find the problem by just compiling to Thumb-2).

I can point you to the right documentation if interested.

> I think I've proven my point well - at least one of those 'itxxxx'
> instructions in your patch is wrong, but not obviously wrong from
> reading the patches.  That's only one which looked at how the
> resulting code actually turns out.  I didn't thoroughly check the
> others, so there could be other issues lurking in the missing
> patch context lines.

I'll reply separately to those e-mails but the current behaviour is tha=
t
the matching of IT and conditional suffixes is always checked in Thumb-=
2
mode and the IT is ignored in ARM mode where, as before, only the
conditional suffixes are used.

> > IMHO, I don't think the assembly syntax for an architecture is a va=
lid
> > reason to reject patches.
>=20
> My objection is primerily on the readability of the code in the ARM
> kernel, and the viability of continued maintainence of it - which is
> an extremely important consideration and one which trumps *everything=
*
> else - and it's that basis which I'm rejecting the patches.

There is no easy way around. We could duplicate code in the existing
arch/arm by creating things like head-t2.S or entry-t2.S but we still
have to cope with inline assembly in header files plus the amount of
duplication in arch/arm/lib.

> That objection is directly caused by this crappy assembly syntax.  So
> you can turn it into something political by saying that it's the
> assembly syntax I'm objecting to.  My objection is _far_ more than
> that.

It looks to me like you are objecting to both the *unified syntax* and
the *Thumb-2 instruction set* in general (while missing the big
picture). The old syntax *cannot* fully accommodate the new Thumb-2
instruction set. Rather than having a completely separate assembly
syntax, ARM decided to slightly modify the existing one to accommodate
both and make life *easier* for developers (on new CPUs) but with the
risk of breaking backwards compatibility.

The main additions are the IT Thumb-2 instruction (not used in ARM
assembly) and a way to explicitly state whether you want a specific
instruction to be 32bit or 16bit wide in Thumb-2 (always 32 bit on ARM)
using the ".w" suffix.

If the syntax would have been completely different, no-one would have
asked for this Linux port to be merged into arch/arm/ (as it happened
when I first posted the patches).

I will restate - the Thumb-2 patches make the current assembly code les=
s
readable not only because of the unified syntax (this only adds the W
macro and IT instruction) but also the limitations of the Thumb-2
instruction set where I had to add conditional compilation. You can
argue that ARM Ltd should redesign the Thumb-2 instruction set to be
identical to ARM.

> > There were some public discussions in the past with Richard Earnsha=
w
> > (gcc/binutils) here in ARM regarding the assembly syntax but I don'=
t
> > think it can be changed in a fully backwards compatible way while
> > supporting a slightly different instruction set.
>=20
> Were there?  That's the first I've heard of them!  The use of "public=
"
> here is actually rather annoying.  They may have been "public" from t=
he
> point of view of being on some random mailing list on the Internet, b=
ut
> that doesn't mean that everyone concerned knows that they're going on=
=2E

OK, sorry for the confusion. I cc'ed Richard to a reply to Nicolas and
arm-linux-kernel but Richard decided to reply off-line only to Nicolas
and me:

=EF=BB=BFhttp://article.gmane.org/gmane.linux.ports.arm.kernel/38947

Anyway, the main summary is a few paragraphs above.

> > ???I would really like some clear statement from you to know where =
to
> > focus my attention (clean up the current patches even more or creat=
e
> > separate arch/arm-t2). AFAICT, you don't really like these patches
> > merged, in which case I'd have to focus on the second option.
>=20
> I've put my point of view forward in the responses to the patches.
> I'm not sure what "clear statement" you're really after.

The comments are useful and I'll reply to them separately.

But since you are objecting to the unified assembly syntax in general
which *cannot* be changed, my understanding is that you don't want this
set of patches under arch/arm/, no matter how much I try to adapt the
Thumb-2 patches. Is my understanding correct?

> Maybe if that ARM Linux developers conference had gone ahead, this
> could have been discussed there in a broader manner and some way
> forward could have been reached.

Well, it is pretty difficult to get a lot of people from around the
world together and since some of the main developers (including you)
couldn't make the specific date, it was cancelled. If you want, we can
have a few-hours conference call via phone/skype/gnome meeting/irc etc.
with ARM Linux developers joining in.

--=20
Catalin
