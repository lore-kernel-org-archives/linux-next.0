From: Andi Kleen <ak@linux.intel.com>
Subject: Re: linux-next: build warning after merge of the tip tree
Date: Mon, 24 Feb 2014 07:48:41 -0800
Message-ID: <20140224154841.GG12219@tassilo.jf.intel.com>
References: <20140224151732.7461213fabef4fc1bbca8213@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:31445 "EHLO mga09.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752473AbaBXPs4 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 24 Feb 2014 10:48:56 -0500
Content-Disposition: inline
In-Reply-To: <20140224151732.7461213fabef4fc1bbca8213@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

> I guess that there may be more places where "asmlinkage" is used with
> "static" - I assume that they are all incorrect?

Likely they are bogus yes.

One issue is still the changed ABI on i386, so one has to double check
before removing if they have arguments.

-Andi
