From: Russell King <rmk@arm.linux.org.uk>
Subject: Re: linux-next: manual merge of the sound tree with the arm tree
Date: Wed, 11 Mar 2009 09:41:27 +0000
Message-ID: <20090311094126.GA4619@flint.arm.linux.org.uk>
References: <20090310144528.0fa208dd.sfr@canb.auug.org.au> <20090311085254.GA30970@flint.arm.linux.org.uk> <s5h63igifin.wl%tiwai@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:41269 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752148AbZCKJme (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 11 Mar 2009 05:42:34 -0400
Content-Disposition: inline
In-Reply-To: <s5h63igifin.wl%tiwai@suse.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Ben Dooks <ben@simtec.co.uk>, Mark Brown <broonie@opensource.wolfsonmicro.com>, Alexander Schulz <alex@shark-linux.de>

On Wed, Mar 11, 2009 at 10:18:40AM +0100, Takashi Iwai wrote:
> At Wed, 11 Mar 2009 08:52:54 +0000,
> Russell King wrote:
> > 
> > On Tue, Mar 10, 2009 at 02:45:28PM +1100, Stephen Rothwell wrote:
> > > Hi Takashi,
> > > 
> > > Today's linux-next merge of the sound tree got a conflict in
> > > arch/arm/mach-shark/include/mach/io.h between commit
> > > eab184c2362567f2b2e951b7bd0e0d353a7e5091 ("[ARM] 5363/1: Shark cleanup
> > > and new defconfig") from the arm tree and commit
> > > 8150bc886be5ce3cc301a2baca1fcf2cf7bd7f39 ("S3C24XX: Move and update IIS
> > > headers") from the sound tree.
> > > 
> > > I fixed it up (see below) and can carry the fix as necessary.
> > 
> > NAK to this patch.
> > 
> > The greater concern is WTF are cleanup patches for the ARM architecture
> > going via the sound tree.  Especially patches which I have concerns about.
> > 
> > > --- a/arch/arm/mach-shark/include/mach/io.h
> > > +++ b/arch/arm/mach-shark/include/mach/io.h
> > > @@@ -11,10 -11,10 +11,10 @@@
> > >   #ifndef __ASM_ARM_ARCH_IO_H
> > >   #define __ASM_ARM_ARCH_IO_H
> > >   
> > >  -#define PCIO_BASE	0xe0000000
> > >  -#define IO_SPACE_LIMIT	0xffffffff
> > >  +#define IO_SPACE_LIMIT 0xffffffff
> > >   
> > > - #define __io(a)                 ((void __iomem *)(0xe0000000 + (a)))
> > >  -#define __io(a)		__typesafe_io(PCIO_BASE + (a))
> > >  -#define __mem_pci(addr)	(addr)
> > > ++#define __io(a)		__typesafe_io(0xe0000000 + (a))
> > 
> > Do not use __typesafe_io() with the addition here without first ensuring
> > that you've investigated whether it causes the compiler to mis-optimise
> > the code.
> 
> Hrm, is that particular change also in ARM tree, no?  Judging from the
> conflict-diff above, it looks like the patch just follows that...
> 
> > Takashi - please remove all such patches from the sound tree.  They
> > should not be in there.
> 
> Oh, I thought Mark already sent you Ben's patches.

What is in my tree is:

------
diff --git a/arch/arm/mach-shark/include/mach/io.h b/arch/arm/mach-shark/include/mach/io.h
index c5cee82..9ccbcec 100644
--- a/arch/arm/mach-shark/include/mach/io.h
+++ b/arch/arm/mach-shark/include/mach/io.h
@@ -11,10 +11,10 @@
 #ifndef __ASM_ARM_ARCH_IO_H
 #define __ASM_ARM_ARCH_IO_H

-#define PCIO_BASE      0xe0000000
-#define IO_SPACE_LIMIT 0xffffffff
+#define IO_SPACE_LIMIT 0xffffffff

-#define __io(a)                ((void __iomem *)(PCIO_BASE + (a)))
-#define __mem_pci(addr)        (addr)
+#define __io(a)                 ((void __iomem *)(0xe0000000 + (a)))
+
+#define __mem_pci(addr) (addr)

 #endif
------

which is basically the same thing from Alexander Schulz but without the
addition of __typesafe_io(), and it's that which I'm objecting to.

> Sorry if it wasn't done yet.

It seems not.  Searching for all messages from Mark containing the
string 'typesafe' results in no matches for messages since 1st January.

> Basically it's two patches to create a branch to move and update IIS
> and audio.h headers.  Since some drivers require these changes, they
> have to be in the sound tree, too.  Otherwise the tree gets
> inconsistent and can't be built.

Maybe, but the point here is that's not the only thing it does.  It also
makes other changes _as well_ that are not relevent to the changes you're
talking about above.

> The relevant changes are in another branch (s3c-iis-header) of asoc
> tree so that it can be easily pulled to another tree:
>    git://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound-2.6.git s3c-iis-header
> 
> So, if you can pull these changes above into your GIT tree simply via
> "git pull", everything will settle down (as both trees share the same
> GIT objects).

Why do I want to pull stuff that I consider broken into my tree?  Please
get rid of the use of __typesafe_io in the shark io.h header in your tree
or drop these patches entirely and ask the submitter to fix (whatever's
easier for you.)

As I said when Daniel proposed the change to Footbridge and I avoided
his patch for footbridge's io.h:

| On Mon, Feb 02, 2009 at 03:59:56PM +0000, Daniel Silverstone wrote:
| > Footbridge: __io() should __force to __iomem pointer
| >
| > This trivial patch fixes many warnings (around 850) by forcing
| > the return from __io() to be 'void __iomem *'. This stops sparse
| > warning about the implicit casting into an address space.
| 
| I don't think gcc is bright enough to handle this - rather than doing
| the addition in the load/store instruction, I think you'll find that
| gcc will issue a separate add instruction with this.
| 
| That's why I never converted any of the __io() macros which have an
| addition in them to use __typesafe_io().

the same applies to shark's io.h.  The effect of this change has not been
evaluated and so should NOT be merged for mainline yet.

So, in case it still isn't clear, what I'm objecting to is replacing:

+#define __io(a)		 ((void __iomem *)(0xe0000000 + (a)))

with:

+#define __io(a)		__typesafe_io(0xe0000000 + (a))

I repeat: please back this change out of your tree.

-- 
Russell King
 Linux kernel    2.6 ARM Linux   - http://www.arm.linux.org.uk/
 maintainer of:
