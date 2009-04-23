From: Luis Henriques <henrix@sapo.pt>
Subject: Re: linux-next: genirq tree build warning
Date: Thu, 23 Apr 2009 18:14:57 +0100
Message-ID: <20090423171457.GA4220@hades.domain.com>
References: <20090423161328.c81ecb3e.sfr@canb.auug.org.au> <20090423064809.GB14063@elte.hu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from relay4.ptmail.sapo.pt ([212.55.154.24]:45697 "HELO sapo.pt"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with SMTP
	id S1752530AbZDWRRx (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 23 Apr 2009 13:17:53 -0400
Content-Disposition: inline
In-Reply-To: <20090423064809.GB14063@elte.hu>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org

On Thu, Apr 23, 2009 at 08:48:09AM +0200, Ingo Molnar wrote:
> 
> * Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> 
> > Hi all,
> > 
> > Today's linux-next build (powerpc allyesconfig gcc4.4.0) produced this
> > warning:
> > 
> > kernel/irq/manage.c: In function 'request_threaded_irq':
> > kernel/irq/manage.c:933: warning: suggest parentheses around operand of '!' or change '&' to '&&' or '!' to '~'
> > 
> > Introduced by commit ba71604fad348656071a2a76eef9a67dab85a773 
> > ("genirq: do not execute DEBUG_SHIRQ when irq setup failed") from 
> > the genirq tree.
> 
> This looks like a real bug - thanks for reporting this.

Yep, mea culpa!
