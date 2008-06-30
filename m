From: Ingo Molnar <mingo@elte.hu>
Subject: Re: [BUILD-FAILURE] linux-next: Tree for June 30
Date: Mon, 30 Jun 2008 22:11:16 +0200
Message-ID: <20080630201116.GA13605@elte.hu>
References: <20080701001656.e156585c.sfr@canb.auug.org.au> <48690385.7030500@linux.vnet.ibm.com> <48690D3C.1060803@linux.vnet.ibm.com> <20080630185943.GA24692@uranus.ravnborg.org> <20080630192610.GA6584@elte.hu> <20080630194727.GA26682@uranus.ravnborg.org> <20080630200623.GE6584@elte.hu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.mail.elte.hu ([157.181.151.9]:53118 "EHLO mx2.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751553AbYF3UML (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 30 Jun 2008 16:12:11 -0400
Content-Disposition: inline
In-Reply-To: <20080630200623.GE6584@elte.hu>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Kamalesh Babulal <kamalesh@linux.vnet.ibm.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Jens Axboe <jens.axboe@oracle.com>, Andy Whitcroft <apw@shadowen.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>


* Ingo Molnar <mingo@elte.hu> wrote:

> ah, ok. So the patch below should solve this for now?

s/patch below/hack below/. (The real fix has to tur it into a 
well-documented limit instead of adding yet another hardcoded arbitrary 
limit that we'll hit in 5 years or so.)

	Ingo
