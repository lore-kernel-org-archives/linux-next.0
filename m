From: Arnaldo Carvalho de Melo <acme@redhat.com>
Subject: Re: linux-next: Signed-off-by missing for commit in the tip tree
Date: Thu, 7 Dec 2017 09:27:16 -0200
Message-ID: <20171207112716.GB3138@redhat.com>
References: <20171207094016.32774ae8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:47164 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752670AbdLGL1U (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 7 Dec 2017 06:27:20 -0500
Content-Disposition: inline
In-Reply-To: <20171207094016.32774ae8@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Em Thu, Dec 07, 2017 at 09:40:16AM +1100, Stephen Rothwell escreveu:
> Hi all,
> 
> Commit
> 
>   0b44cfb8e40f ("tools/headers: Synchronize kernel x86 UAPI headers")
> 
> is missing a Signed-off-by from its committer.

oops, my bad :-\ I'll avoid this in the future with scripts before
pushing to Ingo.

- Arnaldo

commit 0b44cfb8e40f64cd72520be223414a7ef79c5d90
Author:     Ingo Molnar <mingo@kernel.org>
AuthorDate: Sat Nov 18 09:00:46 2017 +0100
Commit:     Arnaldo Carvalho de Melo <acme@redhat.com>
CommitDate: Tue Nov 28 14:29:05 2017 -0300

    tools/headers: Synchronize kernel x86 UAPI headers
    
    Two x86 headers got modified in this merge window:
    
     arch/x86/include/asm/cpufeatures.h
     arch/x86/include/asm/disabled-features.h
    
    To support x86 UMIP feature, to add new AVX instructions, plus
cleanups.
    
    None of those changes have an effect on tooling, so do a plain copy.
    
    Cc: Arnaldo Carvalho de Melo <acme@redhat.com>
    Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
    Cc: Linus Torvalds <torvalds@linux-foundation.org>
    Cc: Peter Zijlstra <peterz@infradead.org>
    Cc: Thomas Gleixner <tglx@linutronix.de>
    Cc: Peter Zijlstra <peterz@infradead.org>
    Cc: Namhyung Kim <namhyung@kernel.org>
    Cc: Jiri Olsa <jolsa@redhat.com>
    Cc: linux-kernel@vger.kernel.org
    Signed-off-by: Ingo Molnar <mingo@kernel.org>
