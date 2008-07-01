From: Ingo Molnar <mingo@elte.hu>
Subject: Re: [BUILD-FAILURE] linux-next: Tree for June 30
Date: Tue, 1 Jul 2008 08:56:14 +0200
Message-ID: <20080701065614.GA26601@elte.hu>
References: <20080701001656.e156585c.sfr@canb.auug.org.au> <48690385.7030500@linux.vnet.ibm.com> <48690D3C.1060803@linux.vnet.ibm.com> <20080630185943.GA24692@uranus.ravnborg.org> <20080630192610.GA6584@elte.hu> <20080630194727.GA26682@uranus.ravnborg.org> <20080630200623.GE6584@elte.hu> <20080630202506.GA28050@uranus.ravnborg.org> <486943F1.80606@zytor.com> <48695449.5010602@zytor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.mail.elte.hu ([157.181.151.9]:52407 "EHLO mx2.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751948AbYGAG55 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 1 Jul 2008 02:57:57 -0400
Content-Disposition: inline
In-Reply-To: <48695449.5010602@zytor.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Sam Ravnborg <sam@ravnborg.org>, Kamalesh Babulal <kamalesh@linux.vnet.ibm.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Jens Axboe <jens.axboe@oracle.com>, Andy Whitcroft <apw@shadowen.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Vivek Goyal <vgoyal@in.ibm.com>, "Eric W. Biederman" <ebiederm@xmission.com>


* H. Peter Anvin <hpa@zytor.com> wrote:

> Here is a patch to replace the hard-coded limit with dynamic 
> allocation.
>  I have only build-tested it, but it seems to work.
>
> Please try it out; barring any screams to the contrary I'll add it to 
> -tip.

it's looking good here too in my testing.

I dont think there's a v2.6.26 urgency as the first time we've ever seen 
this warning was in linux-next. If it passes testing i agree that it's 
good for v2.6.27.

	Ingo
