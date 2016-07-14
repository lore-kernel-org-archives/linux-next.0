From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build warnings after merge of the tip tree
Date: Thu, 14 Jul 2016 14:18:00 +1000
Message-ID: <20160714141800.3eaf05ae@canb.auug.org.au>
References: <20160714133729.557eb734@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:49551 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751019AbcGNESC (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 14 Jul 2016 00:18:02 -0400
In-Reply-To: <20160714133729.557eb734@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Arnaldo Carvalho de Melo <acme@redhat.com>

Hi all,

On Thu, 14 Jul 2016 13:37:29 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> After merging the tip tree, today's linux-next build (powerpc64le perf)
> produced these warnings:
> 
> Warning: tools/include/uapi/linux/bpf.h differs from kernel
> Warning: tools/arch/x86/include/asm/disabled-features.h differs from kernel
> Warning: tools/arch/x86/include/asm/required-features.h differs from kernel
> Warning: tools/arch/x86/include/asm/cpufeatures.h differs from kernel
> 
> Introduced by commits
> 
>   7d7d1bf1d1da ("perf bench: Copy kernel files needed to build mem{cpy,set} x86_64 benchmarks")
>   971e827bffef ("tools lib bpf: Copy bpf.h and bpf_common.h from the kernel")

The kvm tree has introduced a few more:

Warning: tools/arch/s390/include/uapi/asm/kvm.h
Warning: tools/arch/s390/include/uapi/asm/sie.h

-- 
Cheers,
Stephen Rothwell
