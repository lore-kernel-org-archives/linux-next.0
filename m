From: Markos Chandras <Markos.Chandras@imgtec.com>
Subject: Re: [PATCH] samples/seccomp/Makefile: Do not build tests if cross-compiling
 for MIPS
Date: Mon, 17 Feb 2014 13:22:26 +0000
Message-ID: <53020D12.6060000@imgtec.com>
References: <1392312460-24902-1-git-send-email-markos.chandras@imgtec.com> <52FD0F46.6040503@gmail.com> <CAP=VYLr1D-DQz8U4naa5aEL_AFa_JkO5e+TgFSxpsd_2t3dahQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from multi.imgtec.com ([194.200.65.239]:19761 "EHLO multi.imgtec.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752702AbaBQNV5 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 17 Feb 2014 08:21:57 -0500
In-Reply-To: <CAP=VYLr1D-DQz8U4naa5aEL_AFa_JkO5e+TgFSxpsd_2t3dahQ@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Gortmaker <paul.gortmaker@windriver.com>, David Daney <ddaney.cavm@gmail.com>
Cc: "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>

On 02/14/2014 01:33 AM, Paul Gortmaker wrote:
> On Thu, Feb 13, 2014 at 1:30 PM, David Daney <ddaney.cavm@gmail.com> wrote:
>> Really I think we should add a Kconfig item for this and disable the whole
>> directory for targets that do not support it.
>
> Can we do something based on  CONFIG_CROSS_COMPILE vs. adding more Kconfig?
>
> Paul.
> --

Hi Paul,

I am not sure how this would solve anything. CONFIG_CROSS_COMPILE could 
be empty, but you can still use 'make CROSS_COMPILE=mips-linux-foobar-' 
or whatever to cross-compile for MIPS. So using this symbol to disable 
tests does not seem right to me.

Another Kconfig symbol should be more appropriate but as far as I can 
see MIPS is the only architecture which has this problem (or I may have 
missed all{yes,mod}config failures from other architectures).

I still think that an "ifndef CONFIG_MIPS" is good enough for now until 
more architectures suffer from this problem in the future. So far (and 
looking at the git history of that file) other architectures managed to 
workaround this.

-- 
markos
