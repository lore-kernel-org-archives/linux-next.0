From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: manual merg of x86 tree
Date: Fri, 13 Jun 2008 06:39:30 +0200
Message-ID: <20080613043929.GA5427@elte.hu>
References: <20080613133240.b8e527b7.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.mail.elte.hu ([157.181.1.138]:40055 "EHLO mx3.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752030AbYFMEjq (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 13 Jun 2008 00:39:46 -0400
Content-Disposition: inline
In-Reply-To: <20080613133240.b8e527b7.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> Today's linux-next merge of the x86 tree got a conflict involving 
> these commits:
> 
> 0b6a39f7ebcb1c82587ce35b401c513eed41ac5c ("Revert "x86: fix ioapic bug again"") from Linus' tree
> b61d37f073055f838b03c4ad5683a4d05bb95fbf ("Revert "x86: fix ioapic bug again"") from the x86 tree
> b697c77b2ce6f526abbe749afec51666b6a69f45 ("Revert "Revert "x86: fix ioapic bug again""") from the x86 tree
> 4b151813a40a968fce405ee561a321bea23f459c ("x86: I/O APIC: remove parameters to fiddle with the 8259A") from the x86 tree
> 
> I simply used the version of the file in the x86 tree.

thanks for the reporting - this conflict should go away on the next 
iteration of -tip (today-ish), when it will be merged up to 
linus-latest.

	Ingo
