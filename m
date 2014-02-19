From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: Re: [PATCH] samples/seccomp/Makefile: Do not build tests if
 cross-compiling for MIPS
Date: Tue, 18 Feb 2014 23:21:09 -0500
Message-ID: <20140219042109.GE5799@windriver.com>
References: <1392312460-24902-1-git-send-email-markos.chandras@imgtec.com>
 <52FD0F46.6040503@gmail.com>
 <CAP=VYLr1D-DQz8U4naa5aEL_AFa_JkO5e+TgFSxpsd_2t3dahQ@mail.gmail.com>
 <53020D12.6060000@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.windriver.com ([147.11.1.11]:65112 "EHLO
	mail.windriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751165AbaBSEUh (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 18 Feb 2014 23:20:37 -0500
Content-Disposition: inline
In-Reply-To: <53020D12.6060000@imgtec.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Markos Chandras <Markos.Chandras@imgtec.com>
Cc: David Daney <ddaney.cavm@gmail.com>, "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>

[Re: [PATCH] samples/seccomp/Makefile: Do not build tests if cross-compiling for MIPS] On 17/02/2014 (Mon 13:22) Markos Chandras wrote:

> On 02/14/2014 01:33 AM, Paul Gortmaker wrote:
> >On Thu, Feb 13, 2014 at 1:30 PM, David Daney <ddaney.cavm@gmail.com> wrote:
> >>Really I think we should add a Kconfig item for this and disable the whole
> >>directory for targets that do not support it.
> >
> >Can we do something based on  CONFIG_CROSS_COMPILE vs. adding more Kconfig?
> >
> >Paul.
> >--
> 
> Hi Paul,
> 
> I am not sure how this would solve anything. CONFIG_CROSS_COMPILE
> could be empty, but you can still use 'make
> CROSS_COMPILE=mips-linux-foobar-' or whatever to cross-compile for
> MIPS. So using this symbol to disable tests does not seem right to
> me.
> 
> Another Kconfig symbol should be more appropriate but as far as I
> can see MIPS is the only architecture which has this problem (or I
> may have missed all{yes,mod}config failures from other
> architectures).
> 
> I still think that an "ifndef CONFIG_MIPS" is good enough for now
> until more architectures suffer from this problem in the future. So
> far (and looking at the git history of that file) other
> architectures managed to workaround this.

I don't have a specific preference to any one fix over another; I leave
that to the seccomp folks who review the fix.  But I would like to see
it dealt with ASAP.  The regression has been in linux-next for roughly a
week now, and doing that can mask us from seeing other build regressions
silently stacking up behind this one.  

Thanks,
Paul.
--

> 
> -- markos
> 
