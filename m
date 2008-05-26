From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: rcu and locking trees unfetchable
Date: Mon, 26 May 2008 10:38:33 +0200
Message-ID: <20080526083833.GA24419@elte.hu>
References: <20080526135444.f7cb038d.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.mail.elte.hu ([157.181.1.138]:50835 "EHLO mx3.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753151AbYEZIiu (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 26 May 2008 04:38:50 -0400
Content-Disposition: inline
In-Reply-To: <20080526135444.f7cb038d.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Ingo,
> 
> Fetching the rcu and locking trees failed this morning, so I have left 
> them out of linux-next for today.

-tip tree is undergoing restructuring, the new branch structure is:

  auto-ftrace-next            [ relative to auto-ftrace-next-base ]
  auto-sched-next             [ relative to auto-sched-next-base  ]
  auto-x86-next               [ relative to auto-x86-next-base    ]

rcu got renamed to "core/rcu" - that will likely grow a -next postfix as 
well. Locking got renamed to "core/locking" - that too will likely get a 
-next topic branch as well. (but please use core/rcu and core/locking in 
the meantime)

	Ingo
