From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: manual merge of the x86 tree
Date: Tue, 8 Jul 2008 07:39:49 +0200
Message-ID: <20080708053949.GA19939@elte.hu>
References: <20080708105658.1a9deedc.sfr@canb.auug.org.au> <4872DD62.1060708@goop.org> <20080708150103.3d52c0d0.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.mail.elte.hu ([157.181.151.9]:48442 "EHLO mx2.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750973AbYGHFkJ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 8 Jul 2008 01:40:09 -0400
Content-Disposition: inline
In-Reply-To: <20080708150103.3d52c0d0.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jeremy Fitzhardinge <jeremy@goop.org>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org, Steven Rostedt <srostedt@redhat.com>


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Jeremy,
> 
> On Mon, 07 Jul 2008 20:22:10 -0700 Jeremy Fitzhardinge <jeremy@goop.org> wrote:
> >
> > I must be missing something.  Don't all those already come from 
> > tip.git pre-merged?  Or are you merging various tip.git topic 
> > branches yourself?  Or are some of these coming from elsewhere?
> 
> I merge a set of branches that are specially maintained for linux-next 
> (see the Next/Trees file in the linux-next tree). I assume that Linus 
> is probably not going to just merge in tip.get in one enormous merge 
> ...

correct, but he wont have to do merge conflict resolutions either - i'll 
do them when i prepare the pulls for Linus.

	Ingo
