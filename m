From: Don Zickus <dzickus@redhat.com>
Subject: Re: linux-next: Tree for December 10 (x86 nmi_watchdog)
Date: Tue, 14 Dec 2010 10:07:46 -0500
Message-ID: <20101214150746.GS18577@redhat.com>
References: <20101210135746.0cf6cbcd.sfr@canb.auug.org.au>
 <20101210092533.4f426650.randy.dunlap@oracle.com>
 <AANLkTi=bw8EcxEffbVV6CfdAPVdM25ZMxHqAmz1yukq3@mail.gmail.com>
 <20101213144434.GB18577@redhat.com>
 <20101214100849.52374e25.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:15287 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752752Ab0LNPIN (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 14 Dec 2010 10:08:13 -0500
Content-Disposition: inline
In-Reply-To: <20101214100849.52374e25.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Rakib Mullick <rakib.mullick@gmail.com>, Randy Dunlap <randy.dunlap@oracle.com>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@elte.hu>, Thomas Gleixner <tglx@linutronix.de>, x86@kernel.org

On Tue, Dec 14, 2010 at 10:08:49AM +1100, Stephen Rothwell wrote:
> Hi Don,
> 
> On Mon, 13 Dec 2010 09:44:34 -0500 Don Zickus <dzickus@redhat.com> wrote:
> >
> > On Sun, Dec 12, 2010 at 11:27:02AM +0600, Rakib Mullick wrote:
> > > On Fri, Dec 10, 2010 at 11:25 PM, Randy Dunlap <randy.dunlap@oracle.com> wrote:
> > > > On Fri, 10 Dec 2010 13:57:46 +1100 Stephen Rothwell wrote:
> > > >
> > > >> Hi all,
> > > >>
> > > >> Changes since 20101209:
> > > >
> > > >
> > > > arch/x86/kernel/apic/hw_nmi.c:28: error: redefinition of 'touch_nmi_watchdog'
> > > > include/linux/nmi.h:22: note: previous definition of 'touch_nmi_watchdog' was here
> > 
> > I'll have to checkout that branch to see what got merged.  I thought I
> > fixed all these.  Is there a config I can use to duplicate these?
> 
> Randy's original post had the config attached.

Thanks.  My patch in a different post on this thread should resolve the
issue.

Cheers,
Don
