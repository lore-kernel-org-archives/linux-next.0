From: Mike Galbraith <efault@gmx.de>
Subject: Re: [next-20120823] NOHZ: local_softirq_pending 200 on s/r
Date: Fri, 24 Aug 2012 09:26:08 +0200
Message-ID: <1345793168.4331.64.camel@marge.simpson.net>
References: <CA+icZUW2aUP=vjBeoksFU=NAVFMJEiBQy6sNKZczzRPEP9kOfw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mailout-de.gmx.net ([213.165.64.22]:58258 "HELO
	mailout-de.gmx.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1752688Ab2HXH0N (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 24 Aug 2012 03:26:13 -0400
In-Reply-To: <CA+icZUW2aUP=vjBeoksFU=NAVFMJEiBQy6sNKZczzRPEP9kOfw@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sedat.dilek@gmail.com
Cc: Paul McKenney <paul.mckenney@linaro.org>, Paul McKenney <paulmck@linux.vnet.ibm.com>, LKML <linux-kernel@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>, x86@kernel.org, linux-next <linux-next@vger.kernel.org>

On Thu, 2012-08-23 at 12:04 +0200, Sedat Dilek wrote:

> Jack Winter confirmed to see similiar NOHZ messages also on
> v3.4.9-rt17 kernel (CPU: Core2Duo when no suspend performed):
> 
> [15223.171585] NOHZ: local_softirq_pending 08

These can be caused by blocking while holding local_softirq_lock.

Even with per softirq threads, and then (yet more overhead) splitting
the lock to make sure one softirq type can't block another, _and_ only
griping if the lock for the pending softirq is _not_ held, seems the
little bugger can still be triggered very rarely by syn flood induced
handler bail/raise.  Annoying little gripe :)

-Mike
