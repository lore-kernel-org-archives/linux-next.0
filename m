From: Ingo Molnar <mingo@kernel.org>
Subject: Re: linux-next: manual merge of the xen-tip tree with the tip tree
Date: Thu, 13 Aug 2015 08:45:19 +0200
Message-ID: <20150813064519.GA16365@gmail.com>
References: <20150812150954.36bc605c@canb.auug.org.au>
 <55CB49CA.8050305@oracle.com>
 <20150812172105.GW16853@twins.programming.kicks-ass.net>
 <20150812174625.GH18673@twins.programming.kicks-ass.net>
 <55CB8DAD.6090508@oracle.com>
 <BB71B9C8-8FA6-4BED-8C80-BCBF08A66812@zytor.com>
 <20150812183614.GY16853@twins.programming.kicks-ass.net>
 <55CB9424.7030801@oracle.com>
 <20150812190422.GZ16853@twins.programming.kicks-ass.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wi0-f179.google.com ([209.85.212.179]:37489 "EHLO
	mail-wi0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750960AbbHMGpY (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 13 Aug 2015 02:45:24 -0400
Content-Disposition: inline
In-Reply-To: <20150812190422.GZ16853@twins.programming.kicks-ass.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>, "H. Peter Anvin" <hpa@zytor.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Jeremy Fitzhardinge <jeremy@goop.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Stefano Stabellini <stefano.stabellini@eu.citrix.com>, Xen Devel <Xen-devel@lists.xensource.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Andy Lutomirski <luto@kernel.org>, David Vrabel <david.vrabel@citrix.com>


* Peter Zijlstra <peterz@infradead.org> wrote:

> On Wed, Aug 12, 2015 at 02:44:52PM -0400, Boris Ostrovsky wrote:
> > On 08/12/2015 02:36 PM, Peter Zijlstra wrote:
> > >On Wed, Aug 12, 2015 at 11:26:41AM -0700, H. Peter Anvin wrote:
> > >>One option might be to do the addition in assembly, i.e.:
> > >>
> > >>"i" (key), "i" (index)
> > >>
> > >>... and put the addition into the assembly source.
> > >Like so? Seems to build on gcc-4.6.
> > 
> > Yes, this builds on 4.4.4. as well.
> 
> Thanks, Ingo / Hpa, can you make the below patch appear in the right tip
> branch?

Applied, it will show up as the following commit:

  d420acd816c0 ("jump_label/x86: Work around asm build bug on older/backported GCCs")

Thanks,

	Ingo
