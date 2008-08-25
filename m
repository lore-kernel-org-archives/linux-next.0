From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next:  x86 tree build failure
Date: Mon, 25 Aug 2008 12:28:53 +0200
Message-ID: <20080825102853.GB15810@elte.hu>
References: <20080825202221.18567cfb.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.mail.elte.hu ([157.181.1.138]:34693 "EHLO mx3.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753150AbYHYK3N (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 25 Aug 2008 06:29:13 -0400
Content-Disposition: inline
In-Reply-To: <20080825202221.18567cfb.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org, Rene Herman <rene.herman@keyaccess.nl>


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> Today's linux-next build (powerpc allyesconfig) failed like this:
> 
> drivers/char/agp/uninorth-agp.c:541: error: unknown field 'agp_destroy_paged' specified in initializer
> 
> Caused by commit 5f310b63781f6777bf4e812570560ec0f8ea42d8 ("agp: 
> enable optimized agp_alloc_pages methods").  A simple typo ...
> 
> I applied the following patch.

applied to tip/x86/pat - thanks Stephen!

	Ingo
