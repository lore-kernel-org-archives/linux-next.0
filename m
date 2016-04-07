From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build warning after merge of the tip tree
Date: Thu, 7 Apr 2016 22:03:46 +1000
Message-ID: <20160407220346.2074105e@canb.auug.org.au>
References: <20160407152603.173426e5@canb.auug.org.au>
	<20160407084833.GA2288@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:55870 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755460AbcDGMDu (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 7 Apr 2016 08:03:50 -0400
In-Reply-To: <20160407084833.GA2288@gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Ingo,

On Thu, 7 Apr 2016 10:48:33 +0200 Ingo Molnar <mingo@kernel.org> wrote:
>
> Indeed - and this only triggers on HAVE_GENERIC_RCU_GUP.
> 
> I've amended the commit.

Thanks.

-- 
Cheers,
Stephen Rothwell
