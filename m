From: Cyrill Gorcunov <gorcunov@gmail.com>
Subject: Re: linux-next: tip tree build warning
Date: Sun, 8 Nov 2009 16:43:59 +0300
Message-ID: <20091108134359.GF5300@lenovo>
References: <20091028181443.50a09dbb.sfr@canb.auug.org.au> <20091028073145.GD6353@elte.hu> <20091028184126.b5f52d1b.sfr@canb.auug.org.au> <20091028184851.504752ef.sfr@canb.auug.org.au> <20091028075012.GD19402@elte.hu> <20091108131645.GD5300@lenovo> <20091108133247.GA14807@elte.hu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ew0-f207.google.com ([209.85.219.207]:41434 "EHLO
	mail-ew0-f207.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752802AbZKHNn4 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 8 Nov 2009 08:43:56 -0500
Content-Disposition: inline
In-Reply-To: <20091108133247.GA14807@elte.hu>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

[Ingo Molnar - Sun, Nov 08, 2009 at 02:32:47PM +0100]
...
| 
| > +
| > +#ifdef CONFIG_X86_32
| >  	.apicid_to_cpu_present		= default_apicid_to_cpu_present,
| > +#else
| > +	.apicid_to_cpu_present		= NULL,
| > +#endif
| 
| would be better to unify this instead ...
| 
| 	Ingo
| 

OK, wait a bit.

	-- Cyrill
