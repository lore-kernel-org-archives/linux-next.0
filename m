From: "H. Peter Anvin" <hpa@zytor.com>
Subject: Re: linux-next: manual merge of the akpm tree with the tip tree
Date: Wed, 13 Feb 2013 20:34:26 -0800
Message-ID: <511C6952.10802@zytor.com>
References: <20130214152515.b11be705b26defa876e4973e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from terminus.zytor.com ([198.137.202.10]:48829 "EHLO mail.zytor.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755089Ab3BNEgC (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 13 Feb 2013 23:36:02 -0500
In-Reply-To: <20130214152515.b11be705b26defa876e4973e@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, Peter Zijlstra <peterz@infradead.org>, =?UTF-8?B?RGFnZmlubiBJbG1hcmkgTWFubnPDpWtlcg==?= <ilmari@ilmari.org>

On 02/13/2013 08:25 PM, Stephen Rothwell wrote:
> Hi Andrew,
>
> Today's linux-next merge of the akpm tree got a conflict in
> kernel/timeconst.pl between commit 63a3f603413f ("timeconst.pl: Eliminate
> Perl warning") from the tip tree and commit "timeconst.pl: remove
> deprecated defined(@array)" from the akpm tree.
>
> These both fix the same problem, I arbitrarily chose the akpm tree version.
>

I should try to resurrect the bc version (which doesn't need the canning 
junk, bc being the POSIX tool for arbitrary-precision arithmetic.) 
There was an error on one of akpm's machines long ago which confused the 
bcrap out of us, because bc hadn't changed, but recently someone pointed 
to a bug in *make* (relating to pipes) from around that era which would 
have explained (a) the failure, and (b) why it only hit one box even 
though bc was the exact same version.
	
	-hpa


-- 
H. Peter Anvin, Intel Open Source Technology Center
I work for Intel.  I don't speak on their behalf.
