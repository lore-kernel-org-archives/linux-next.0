From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: Fwd: Re: [PATCH] kprobes: fix compilation break due to kprobe_mutex
Date: Sat, 17 May 2008 20:08:55 +0100
Message-ID: <20080517190855.GC13933@flint.arm.linux.org.uk>
References: <20080517114244.GB30141@flint.arm.linux.org.uk> <20080517220204.d78fdce2.sfr@canb.auug.org.au> <20080517133527.GC30141@flint.arm.linux.org.uk> <20080517235926.5133252f.sfr@canb.auug.org.au> <20080518022010.56a8bf46.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:46804 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751798AbYEQTJO (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 17 May 2008 15:09:14 -0400
Content-Disposition: inline
In-Reply-To: <20080518022010.56a8bf46.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org

On Sun, May 18, 2008 at 02:20:10AM +1000, Stephen Rothwell wrote:
> On Sat, 17 May 2008 23:59:26 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > On Sat, 17 May 2008 14:35:27 +0100 Russell King - ARM Linux <linux@arm.linux.org.uk> wrote:
> > >
> > > The answer is all of them.  I can't suggest any subset, mainly because
> > > I don't know what's in each and what each will cover.  The coverage of
> > > each is really up to each platform maintainer I'm afraid.
> > 
> > OK, I will see what happens if I add them all.  You may need to ping me
> > if any get added or removed.
> 
> I have added them all.  There are some results on the web page already
> (http://kisskb.ellerman.id.au/kisskb/compiler/11/) which are all ok.  On
> our internal page (which will be mirrored above in an hour or so) there
> are some failures (so far clps7500_defconfig, collie_defconfig,
> corgi_defconfig, eseries_pxa_defconfig and magician_defconfig). Check
> there later.

If I'm reading this right, it's taking you about 3.5 hours to build the
set?

spitz_defconfig - trivial fix (I'll push that with my upcoming set)
magican_defconfig - ditto
omap*_defconfig - hopefully my recent merge of fixes from Tony Lindgren
 should resolve this.
eseries_pxa_defconfig - looks like a botched defconfig file ;(
corgi_defconfig - tried to get the person concerned to submit a trivial
 patch but wants to introduce some infrastructure instead
clps7500_defconfig - you may as well disable, I'll probably eventually
 remove this platform.

Lastly, collie_defconfig seems to be broken as a result of 5025/1 -
which claims to be a "fix" patch but is actually a "break" patch. ;(

Thanks.
