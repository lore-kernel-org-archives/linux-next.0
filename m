From: Ingo Molnar <mingo@elte.hu>
Subject: Re: [PATCH] ftrace: remove warning of old objcopy and local
	functions
Date: Thu, 28 Aug 2008 09:52:01 +0200
Message-ID: <20080828075201.GJ21875@elte.hu>
References: <20080825130117.33fe34bc.sfr@canb.auug.org.au> <20080825060934.GB14993@elte.hu> <alpine.DEB.1.10.0808251434000.23923@gandalf.stny.rr.com> <20080825190103.GA24029@elte.hu> <20080826094627.5d627b5b.sfr@canb.auug.org.au> <20080826115113.806cfe23.sfr@canb.auug.org.au> <alpine.DEB.1.10.0808252324050.966@gandalf.stny.rr.com> <20080826154721.9416e2e9.sfr@canb.auug.org.au> <alpine.DEB.1.10.0808271300540.16904@gandalf.stny.rr.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.mail.elte.hu ([157.181.1.138]:35046 "EHLO mx3.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752841AbYH1HwR (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 28 Aug 2008 03:52:17 -0400
Content-Disposition: inline
In-Reply-To: <alpine.DEB.1.10.0808271300540.16904@gandalf.stny.rr.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>


* Steven Rostedt <rostedt@goodmis.org> wrote:

> The warning messages about old objcopy and local functions spam the 
> user quite drastically.  Remove the warning until we can find a nicer 
> way of tell the user to upgrade their objcopy.

applied to tip/tracing/ftrace, thanks!

	Ingo
