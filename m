From: Martin Schwidefsky <schwidefsky@de.ibm.com>
Subject: Re: linux-next: manual merge of the tip tree with the cputime tree
Date: Wed, 7 Dec 2011 12:59:37 +0100
Message-ID: <20111207125937.4d4adc38@de.ibm.com>
References: <20111207150956.52d41fd8580de3b66abd5d2d@canb.auug.org.au>
	<4EDF4F6D.1040806@parallels.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e06smtp15.uk.ibm.com ([195.75.94.111]:43859 "EHLO
	e06smtp15.uk.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755357Ab1LGL7q (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 7 Dec 2011 06:59:46 -0500
Received: from /spool/local
	by e06smtp15.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-next@vger.kernel.org> from <schwidefsky@de.ibm.com>;
	Wed, 7 Dec 2011 11:59:41 -0000
In-Reply-To: <4EDF4F6D.1040806@parallels.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Glauber Costa <glommer@parallels.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, 7 Dec 2011 09:35:09 -0200
Glauber Costa <glommer@parallels.com> wrote:

> On 12/07/2011 02:09 AM, Stephen Rothwell wrote:
> > + 	index = (TASK_NICE(p)>  0) ? CPUTIME_NICE : CPUTIME_USER;
> > +
> >    	/* Add user time to cpustat. */
> > - 	if (TASK_NICE(p)>  0)
> > - 		cpustat->nice += (__force cputime64_t) cputime;
> > - 	else
> > - 		cpustat->user += (__force cputime64_t) cputime;
> >   -	task_group_account_field(p, index, cputime);
> > ++	task_group_account_field(p, index, (__force cputime64_t) cputime);
> 
> 
> I doubt __force cputime64_t is necessary. After these patches, those 
> fields are all u64.

You need the __force keyword whenever a conversion between a cputime[64]_t
and a plain scalar type is done. The cputime[64]_t types are defined with
__nocast so that sparse can find bugs in the usage of cputime.

-- 
blue skies,
   Martin.

"Reality continues to ruin my life." - Calvin.
