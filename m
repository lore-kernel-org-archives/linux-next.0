From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: genirq tree build warning
Date: Thu, 23 Apr 2009 08:48:09 +0200
Message-ID: <20090423064809.GB14063@elte.hu>
References: <20090423161328.c81ecb3e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.mail.elte.hu ([157.181.151.9]:35241 "EHLO mx2.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752040AbZDWGsZ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 23 Apr 2009 02:48:25 -0400
Content-Disposition: inline
In-Reply-To: <20090423161328.c81ecb3e.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org, Luis Henriques <henrix@sapo.pt>


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> Today's linux-next build (powerpc allyesconfig gcc4.4.0) produced this
> warning:
> 
> kernel/irq/manage.c: In function 'request_threaded_irq':
> kernel/irq/manage.c:933: warning: suggest parentheses around operand of '!' or change '&' to '&&' or '!' to '~'
> 
> Introduced by commit ba71604fad348656071a2a76eef9a67dab85a773 
> ("genirq: do not execute DEBUG_SHIRQ when irq setup failed") from 
> the genirq tree.

This looks like a real bug - thanks for reporting this.

	Ingo
