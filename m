From: Ingo Molnar <mingo@elte.hu>
Subject: Re: [PATCH -next] x86: fix longstanding setup.c printk format
	warning
Date: Tue, 10 Jun 2008 12:24:52 +0200
Message-ID: <20080610102452.GD19136@elte.hu>
References: <Pine.LNX.4.64.0806051107200.702@shark.he.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.mail.elte.hu ([157.181.1.138]:46378 "EHLO mx3.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753344AbYFJKZO (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 10 Jun 2008 06:25:14 -0400
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.64.0806051107200.702@shark.he.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Randy.Dunlap" <rdunlap@xenotime.net>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, tglx@linutronix.de, mingo@redhat.com, hpa@zytor.com, the arch/x86 maintainers <x86@kernel.org>


* Randy.Dunlap <rdunlap@xenotime.net> wrote:

> From: Randy Dunlap <randy.dunlap@oracle.com>
> 
> Note: for -next only, not mainline.
> 
> Fix setup.c printk format warning:
> 
> linux-next-20080605/arch/x86/kernel/setup.c: In function 'setup_per_cpu_areas':
> linux-next-20080605/arch/x86/kernel/setup.c:173: warning: format '%lu' expects type 'long unsigned int', but argument 2 has type 'ssize_t'

applied to tip/x86/numa - thanks Randy.

	Ingo
