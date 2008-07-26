From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: linux-next: kbuild tree build failure
Date: Sat, 26 Jul 2008 12:06:32 +0200
Message-ID: <20080726100631.GA3714@uranus.ravnborg.org>
References: <20080707184038.aaeb8d40.sfr@canb.auug.org.au> <20080725141330.c58e0a07.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtpout3.tre.se ([80.251.192.228]:56511 "EHLO smtpout3.tre.se"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750934AbYGZKHk (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sat, 26 Jul 2008 06:07:40 -0400
Content-Disposition: inline
In-Reply-To: <20080725141330.c58e0a07.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Roman Zippel <zippel@linux-m68k.org>, Paul Mackerras <paulus@samba.org>, linuxppc-dev@ozlabs.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Milton Miller <miltonm@bga.com>, Michael Ellerman <michael@ellerman.id.au>

On Fri, Jul 25, 2008 at 02:13:30PM +1000, Stephen Rothwell wrote:
> Hi Sam,
> 
> On Mon, 7 Jul 2008 18:40:38 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > Today's linux-next build (powerpc ppc64_defconfig) failed like this:
> > 
> > arch/powerpc/platforms/cell/spu_base.c: In function '__spu_trap_data_seg':
> > arch/powerpc/platforms/cell/spu_base.c:194: error: duplicate case value
> > arch/powerpc/platforms/cell/spu_base.c:177: error: previously used here
> 
> This still fails in linux-next today.  We need some solution before you
> send these commits to Linus.
I removed the offending commits from kbuild-next before I
sent the pull request.
I will though revisit the issue after -rc1.

	Sam
