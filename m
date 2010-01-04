From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: tip tree build failure
Date: Mon, 4 Jan 2010 17:32:00 +0100
Message-ID: <20100104163159.GD23652@elte.hu>
References: <20100104235931.abcf2bc5.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.mail.elte.hu ([157.181.1.138]:32955 "EHLO mx3.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753372Ab0ADQcO (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 4 Jan 2010 11:32:14 -0500
Content-Disposition: inline
In-Reply-To: <20100104235931.abcf2bc5.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Thiago Farina <tfransosi@gmail.com>


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> Today's linux-next build (s390x defconfig) failed like this:
> 
> kernel/panic.c:134: error: 'CALLER_ADDR0' undeclared (first use in this function)
> 
> Caused by commit eba3fe4416f3cc2ce043fb304b6c35a69dca3bdb ("kernel: Use
> CALLER_ADDR0 macro").

Thanks - apparently CALLER_ADDR0 isnt generally available. I've reverted this 
patch for now.

	Ingo
