From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: manual merge of the tip tree with Linus' tree
Date: Mon, 18 Jan 2010 08:50:25 +0100
Message-ID: <20100118075025.GA22476@elte.hu>
References: <20100118180841.96628ee6.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.mail.elte.hu ([157.181.151.9]:46185 "EHLO mx2.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754416Ab0ARHup (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 18 Jan 2010 02:50:45 -0500
Content-Disposition: inline
In-Reply-To: <20100118180841.96628ee6.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jan Kiszka <jan.kiszka@siemens.com>, Steven Rostedt <rostedt@goodmis.org>, Wolfram Sang <w.sang@pengutronix.de>


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> Today's linux-next merge of the tip tree got a conflict in
> scripts/recordmcount.pl between commit
> b82a4045f7962483a78a874343dc6e31b79c96c1 ("tracing/x86: Derive arch from
> bits argument in recordmcount.pl") from Linus' tree and commit
> dfaa9e2c5707b2c217c0121aac796e0fa3051482 ("tracing: Use appropriate perl
> constructs in recordmcount.pl") from the tip tree.
> 
> I fixed it up (see below) and can carry the fix for a while.

FYI, i resolved the conflict already in tip:master yesterday, a bit 
differently.

Thanks,

	Ingo
