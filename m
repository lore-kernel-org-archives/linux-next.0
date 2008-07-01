From: Vivek Goyal <vgoyal@redhat.com>
Subject: Re: [BUILD-FAILURE] linux-next: Tree for June 30
Date: Mon, 30 Jun 2008 22:10:46 -0400
Message-ID: <20080701021046.GA30401@redhat.com>
References: <20080701001656.e156585c.sfr@canb.auug.org.au> <48690385.7030500@linux.vnet.ibm.com> <48690D3C.1060803@linux.vnet.ibm.com> <20080630185943.GA24692@uranus.ravnborg.org> <20080630192610.GA6584@elte.hu> <20080630194727.GA26682@uranus.ravnborg.org> <20080630200623.GE6584@elte.hu> <20080630202506.GA28050@uranus.ravnborg.org> <486943F1.80606@zytor.com> <48695449.5010602@zytor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([66.187.233.31]:42369 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756429AbYGACX2 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 30 Jun 2008 22:23:28 -0400
Content-Disposition: inline
In-Reply-To: <48695449.5010602@zytor.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Sam Ravnborg <sam@ravnborg.org>, Ingo Molnar <mingo@elte.hu>, Kamalesh Babulal <kamalesh@linux.vnet.ibm.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Jens Axboe <jens.axboe@oracle.com>, Andy Whitcroft <apw@shadowen.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Vivek Goyal <vgoyal@in.ibm.com>, "Eric W. Biederman" <ebiederm@xmission.com>

On Mon, Jun 30, 2008 at 02:46:49PM -0700, H. Peter Anvin wrote:
> Here is a patch to replace the hard-coded limit with dynamic allocation.  
>  I have only build-tested it, but it seems to work.
>
> Please try it out; barring any screams to the contrary I'll add it to -tip.
>
> 	-hpa

I think there was no specific reason for limit 100. Just that probably at
that point Eric thought 100 is sufficient. Dynamic allocation is much
better.

This patch looks good. Thanks.

Vivek
