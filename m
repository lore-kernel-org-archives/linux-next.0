From: Kamalesh Babulal <kamalesh@linux.vnet.ibm.com>
Subject: Re: [BUILD-FAILURE] linux-next: Tree for June 30
Date: Tue, 01 Jul 2008 14:51:00 +0530
Message-ID: <4869F6FC.7040301@linux.vnet.ibm.com>
References: <20080701001656.e156585c.sfr@canb.auug.org.au> <48690385.7030500@linux.vnet.ibm.com> <48690D3C.1060803@linux.vnet.ibm.com> <20080630185943.GA24692@uranus.ravnborg.org> <20080630192610.GA6584@elte.hu> <20080630194727.GA26682@uranus.ravnborg.org> <20080630200623.GE6584@elte.hu> <20080630202506.GA28050@uranus.ravnborg.org> <486943F1.80606@zytor.com> <48695449.5010602@zytor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from E23SMTP03.au.ibm.com ([202.81.18.172]:48441 "EHLO
	e23smtp03.au.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752895AbYGAJVL (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 1 Jul 2008 05:21:11 -0400
In-Reply-To: <48695449.5010602@zytor.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Sam Ravnborg <sam@ravnborg.org>, Ingo Molnar <mingo@elte.hu>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Jens Axboe <jens.axboe@oracle.com>, Andy Whitcroft <apw@shadowen.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Vivek Goyal <vgoyal@in.ibm.com>, "Eric W. Biederman" <ebiederm@xmission.com>

H. Peter Anvin wrote:
> Here is a patch to replace the hard-coded limit with dynamic allocation. 
>   I have only build-tested it, but it seems to work.
> 
> Please try it out; barring any screams to the contrary I'll add it to -tip.
> 
> 	-hpa
> 
> 
> 
<snip>

Thanks, the patch is working good on my machine.

-- 
Thanks & Regards,
Kamalesh Babulal,
Linux Technology Center,
IBM, ISTL.
