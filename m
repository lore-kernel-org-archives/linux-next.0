From: Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: linux-next: sched tree build warning
Date: Tue, 21 Apr 2009 15:51:26 +0930
Message-ID: <200904211551.27515.rusty@rustcorp.com.au>
References: <20090421102706.e19240a0.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([203.10.76.45]:39589 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750975AbZDUGVd (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 21 Apr 2009 02:21:33 -0400
In-Reply-To: <20090421102706.e19240a0.sfr@canb.auug.org.au>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org, Gautham R Shenoy <ego@in.ibm.com>

On Tue, 21 Apr 2009 09:57:06 am Stephen Rothwell wrote:
> Should this call to first_cpu be cpumask_first?

Always.  Old cpu ops should die.  (I didn't actually read this code,
but it's a truism).

Thanks,
Rusty.
