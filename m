From: Heiko Carstens <heiko.carstens@de.ibm.com>
Subject: Re: linux-next: manual merge of the rr tree
Date: Tue, 28 Oct 2008 08:19:31 +0100
Message-ID: <20081028071931.GA4959@osiris.boeblingen.de.ibm.com>
References: <20081028135558.536174c5.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mtagate5.uk.ibm.com ([195.212.29.138]:50320 "EHLO
	mtagate5.uk.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751041AbYJ1HTe (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 28 Oct 2008 03:19:34 -0400
Received: from d06nrmr1407.portsmouth.uk.ibm.com (d06nrmr1407.portsmouth.uk.ibm.com [9.149.38.185])
	by mtagate5.uk.ibm.com (8.13.8/8.13.8) with ESMTP id m9S7JXbF129400
	for <linux-next@vger.kernel.org>; Tue, 28 Oct 2008 07:19:33 GMT
Received: from d06av04.portsmouth.uk.ibm.com (d06av04.portsmouth.uk.ibm.com [9.149.37.216])
	by d06nrmr1407.portsmouth.uk.ibm.com (8.13.8/8.13.8/NCO v9.1) with ESMTP id m9S7JWqA2388006
	for <linux-next@vger.kernel.org>; Tue, 28 Oct 2008 07:19:32 GMT
Received: from d06av04.portsmouth.uk.ibm.com (loopback [127.0.0.1])
	by d06av04.portsmouth.uk.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id m9S7JWJk022964
	for <linux-next@vger.kernel.org>; Tue, 28 Oct 2008 07:19:32 GMT
Content-Disposition: inline
In-Reply-To: <20081028135558.536174c5.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Rusty Russell <rusty@rustcorp.com.au>, linux-next@vger.kernel.org, Martin Schwidefsky <schwidefsky@de.ibm.com>

On Tue, Oct 28, 2008 at 01:55:58PM +1100, Stephen Rothwell wrote:
> Hi Rusty,
> 
> Today's linux-next merge of the rr tree got a conflict in
> arch/s390/Kconfig between commit 0d2a4a69f5a01c8886323afe742487f35493e209
> ("[S390] convert s390 to generic IPI infrastructure") from the s390 tree
> and commit a5f0c6822e6795927091d756c51b51320305654a
> ("cpumask:centralize-common-maps") from the rr tree.
> 
> Just overlapping additions.  I fixed it up (see below) and can carry the fix.
> -- 
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
> http://www.canb.auug.org.au/~sfr/
> 
> diff --cc arch/s390/Kconfig
> index abcc7f9,f7270d5..0000000
> --- a/arch/s390/Kconfig
> +++ b/arch/s390/Kconfig
> @@@ -78,7 -75,7 +78,8 @@@ config S39
>   	select HAVE_KRETPROBES
>   	select HAVE_KVM if 64BIT
>   	select HAVE_ARCH_TRACEHOOK
>  +	select USE_GENERIC_SMP_HELPERS if SMP
> + 	select INIT_ALL_POSSIBLE

I will move the USE_GENERIC_SMP_HELPERS select to the top, so the merge
conflict should be resolved in future.
