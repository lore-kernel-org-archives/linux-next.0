From: Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: linux-next: manual merge of the rr tree
Date: Tue, 6 Jan 2009 19:21:48 +1030
Message-ID: <200901061921.49131.rusty@rustcorp.com.au>
References: <20090105143239.08b1a060.sfr@canb.auug.org.au> <200901051727.11403.rusty@rustcorp.com.au> <20090105124745.GC29758@elte.hu>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([203.10.76.45]:59656 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751617AbZAFIvy (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 6 Jan 2009 03:51:54 -0500
In-Reply-To: <20090105124745.GC29758@elte.hu>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Mike Travis <travis@sgi.com>, Christoph Lameter <cl@linux-foundation.org>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>

On Monday 05 January 2009 23:17:45 Ingo Molnar wrote:
> That would allow Mike, Christoph and you to work this out cleanly from 
> scratch. It would also solve your merge conflict.
> 
> Does that sound like a good solution?

Sure, but it won't make this window.  I guess since those patches don't
do anything but lay groundwork it's not critical, but annoying they've
lain fallow so long.

I'm happy to put them with the cpualloc patches, since they're related
and going to conflict, but I still want to see if Mike has the rest of them?

Thanks,
Rusty.
