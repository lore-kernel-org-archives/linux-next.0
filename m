From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: crisv32 runtime failure in -next due to 'page-flags: define
 behavior SL*B-related flags on compound pages'
Date: Tue, 22 Sep 2015 08:18:35 -0700
Message-ID: <20150922151835.GM4029@linux.vnet.ibm.com>
References: <20150922132751.GB17969@node.dhcp.inet.fi>
 <201509221357.t8MDv6G5015271@ignucius.se.axis.com>
Reply-To: paulmck@linux.vnet.ibm.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e33.co.us.ibm.com ([32.97.110.151]:38500 "EHLO
	e33.co.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755471AbbIVPSn (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 22 Sep 2015 11:18:43 -0400
Received: from /spool/local
	by e33.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-next@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
	Tue, 22 Sep 2015 09:18:43 -0600
Content-Disposition: inline
In-Reply-To: <201509221357.t8MDv6G5015271@ignucius.se.axis.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Hans-Peter Nilsson <hans-peter.nilsson@axis.com>
Cc: kirill@shutemov.name, starvik@axis.com, linux@roeck-us.net, jespern@axis.com, hughd@google.com, kirill.shutemov@linux.intel.com, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, akpm@linux-foundation.org, minchan@kernel.org, linux-cris-kernel@axis.com

On Tue, Sep 22, 2015 at 03:57:06PM +0200, Hans-Peter Nilsson wrote:
> > From: "Kirill A. Shutemov" <kirill@shutemov.name>
> > Date: Tue, 22 Sep 2015 15:27:51 +0200
> 
> > On Tue, Sep 22, 2015 at 02:50:19PM +0200, Hans-Peter Nilsson wrote:
> > > That element (the struct) needs *explicit* padding or alignment
> > > to the required multiplicity of bytes for anyone to portably be
> > > able to imply something other than "byte alignment" for the
> > > layout of it, as elements of an array, across systems.  Use
> > > dummy elements or a compiler construct like __attribute__
> > > ((__aligned__ (...))) per kernel policy or taste.  I'd recommend
> > > specifying the alignment, so TRT will happen for it when it in
> > > turn is an element of an otherwise unpadded struct.
> 
> > I see. I would say it's very risky ABI choice, but okay.
> > 
> > What was the reason behind? I don't understand it.
> 
> It was made some 20+ years ago, some of the reason being (here's
> the irony) compatibility with a toolchain for another
> architecture, popular at the time, now forgotten.
> Another reason (IIRC) was that it saves space. :)
> 
> > Is it free to make misaligned memory access on CRIS?
> 
> Within a cache-line for CRIS v32, it's free.
> 
> > What about atomicity? How it works for misaligned accesses?
> 
> Good spotting.  No system with page layouts fixed at size
> multiples (all are, it'd be crazy to split pages as low as byte
> boundaries) can support naturally-misaligned atomic accesses.
> 
> Therefore elements with access expecting atomicity, have be
> decorated with alignment-inducing attributes, for portability,
> e.g. to work for CRIS.  In userspace, I can at times get away
> with calling a special function with a process-wide lock, in
> those cases where the upstream project is unlikely to timely
> understand e.g. that a naked "int" is not naturally aligned.
> 
> > The patch below fixes issue for me.
> 
> Thanks.
> 
> > I'm not sure if we want to ask for alignment to sizeof(long).
> > aligned(2) works too.
> 
> I guess you hit the right spot, but I'd think people would be
> more comfortable with aligning to sizeof (void *).

I would indeed prefer sizeof(void *).

						Thanx, Paul
