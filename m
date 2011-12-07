From: Glauber Costa <glommer@parallels.com>
Subject: Re: linux-next: manual merge of the tip tree with the cputime tree
Date: Wed, 7 Dec 2011 09:35:09 -0200
Message-ID: <4EDF4F6D.1040806@parallels.com>
References: <20111207150956.52d41fd8580de3b66abd5d2d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.parallels.com ([64.131.90.16]:50321 "EHLO mx2.parallels.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754732Ab1LGLfn (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 7 Dec 2011 06:35:43 -0500
In-Reply-To: <20111207150956.52d41fd8580de3b66abd5d2d@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Martin Schwidefsky <schwidefsky@de.ibm.com>

On 12/07/2011 02:09 AM, Stephen Rothwell wrote:
> + 	index = (TASK_NICE(p)>  0) ? CPUTIME_NICE : CPUTIME_USER;
> +
>    	/* Add user time to cpustat. */
> - 	if (TASK_NICE(p)>  0)
> - 		cpustat->nice += (__force cputime64_t) cputime;
> - 	else
> - 		cpustat->user += (__force cputime64_t) cputime;
>   -	task_group_account_field(p, index, cputime);
> ++	task_group_account_field(p, index, (__force cputime64_t) cputime);


I doubt __force cputime64_t is necessary. After these patches, those 
fields are all u64.
