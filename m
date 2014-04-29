From: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: kissb mkimage doesn't support extensa
Date: Tue, 29 Apr 2014 17:50:54 +1000
Message-ID: <1398757854.27852.0.camel@concordia>
References: <CAMuHMdU2L+m4-dKNAacqrLw66obsFYVKu8x1n6=up7Mkg1HL_Q@mail.gmail.com>
	 <1398743403.8217.7.camel@concordia>
	 <CAOMZO5ADi5=pUYfknESjJfYXBn_xwQJ0zyG5=tRmzDpZoaf8Sw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:60306 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755074AbaD2Hu4 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 29 Apr 2014 03:50:56 -0400
In-Reply-To: <CAOMZO5ADi5=pUYfknESjJfYXBn_xwQJ0zyG5=tRmzDpZoaf8Sw@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Fabio Estevam <festevam@gmail.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next <linux-next@vger.kernel.org>

On Tue, 2014-04-29 at 01:42 -0300, Fabio Estevam wrote:
> On Tue, Apr 29, 2014 at 12:50 AM, Michael Ellerman <mpe@ellerman.id.au> wrote:
> > On Sun, 2014-03-02 at 11:25 +0100, Geert Uytterhoeven wrote:
> >> http://kisskb.ellerman.id.au/kisskb/buildresult/10665903/
> >>
> >> Invalid CPU Type - valid names are: alpha, arm, x86, ia64, m68k,
> >> microblaze, mips, mips64, nios, nios2, ppc, s390, sh, sparc, sparc64,
> >> blackfin, avr32
> >
> > I've upgraded to the latest version in Debian (2014.01), but it still doesn't
> > seem to support xtensa.
> >
> >   $ /usr/bin/mkimage -A xtensa
> >
> >   Invalid CPU Type - valid names are: alpha, arm, x86, ia64, m68k, microblaze,
> >   mips, mips64, nios2, powerpc, ppc, s390, sh, sparc, sparc64, blackfin, avr32,
> >   nds32, or1k, sandbox, arm64
> 
> I will submit a patch to U-boot in order to include extensa and will
> Cc you and Geert.

Thanks.

cheers
