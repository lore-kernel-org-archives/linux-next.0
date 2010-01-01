From: "Rafael J. Wysocki" <rjw@sisk.pl>
Subject: Re: linux-next: origin tree build warning
Date: Fri, 1 Jan 2010 02:16:32 +0100
Message-ID: <201001010216.32396.rjw@sisk.pl>
References: <20100101112914.41bc5f77.sfr@canb.auug.org.au> <alpine.LFD.2.00.0912311634110.3630@localhost.localdomain> <20100101120228.04a21224.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ogre.sisk.pl ([217.79.144.158]:46608 "EHLO ogre.sisk.pl"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751284Ab0AABQ2 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 31 Dec 2009 20:16:28 -0500
In-Reply-To: <20100101120228.04a21224.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Friday 01 January 2010, Stephen Rothwell wrote:
> Hi Linus,
> 
> On Thu, 31 Dec 2009 16:34:37 -0800 (PST) Linus Torvalds <torvalds@linux-foundation.org> wrote:
> > On Fri, 1 Jan 2010, Stephen Rothwell wrote:
> > >
> > > Today's linux-next build (powerpc allnoconfig) produced this warning:
> >
> > Does this trivial patch get rid of it?
> 
> Yep.
> 
> Tested-by: Stephen Rothwell <sfr@canb.auug.org.au>
> 
> I did actually get this warning for all sorts of configs/architectures,
> obviously, I just reported it against the first that popped up.

Sorry for that, should have double checked.

Rafael
