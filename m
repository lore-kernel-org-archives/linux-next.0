From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: next-20120313 cpuidle freezes when booting
Date: Wed, 14 Mar 2012 12:29:26 +0100
Message-ID: <4F608116.80508@linaro.org>
References: <alpine.LSU.2.00.1203131454500.1335@eggly.anvils>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-bk0-f46.google.com ([209.85.214.46]:60870 "EHLO
	mail-bk0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756084Ab2CNL3a (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 14 Mar 2012 07:29:30 -0400
Received: by bkcik5 with SMTP id ik5so1172020bkc.19
        for <linux-next@vger.kernel.org>; Wed, 14 Mar 2012 04:29:29 -0700 (PDT)
In-Reply-To: <alpine.LSU.2.00.1203131454500.1335@eggly.anvils>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Hugh Dickins <hughd@google.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Andrew Morton <akpm@linux-foundation.org>, Robert Lee <rob.lee@linaro.org>, Jean Pihet <j-pihet@ti.com>, Kevin Hilman <khilman@ti.com>, Deepthi Dharwar <deepthi@linux.vnet.ibm.com>, Dan Carpenter <dan.carpenter@oracle.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On 03/13/2012 11:29 PM, Hugh Dickins wrote:
> Hi Stephen,
>
> Yesterday's 3.3.0-rc7-next-20120313 gives me unpredictable freezes
> on x86_64, on a ThinkPad T420s - I've not dared it on more machines.
>
> Usually when booting up (sometimes just after Freeing unused kernel
> memory, sometimes random places elsewhere), but occasionally it manag=
es
> to get as far as X; doesn't usually manage to complete suspend+resume=
=2E
>
> 3.3.0-rc6-nex-20120309 behaved similarly; the last I tried before
> that was 3.3.0-rc5-next20120227, which was okay.
>
> Bisection led me to "cpuidle: Add common time keeping and irq enablin=
g",
> (from the cpuidle-cons tree I think), and reverting that has so far
> given me a working system (it's a success if I complete this mail).
>
> Below is the patch I've used to revert it (for other people having
> problems with recent linux-next to try); but it's not quite correct,
> because you did a merge on conflicting trees there, and I didn't spen=
d
> time to unravel all that, just get a working x86 system - since I've
> left out some of your merge (in arch/arm/kernel/Makefile and arch/arm=
/
> mach-at91/cpuidle.c), this reversion probably breaks arm as is.

Hi Hugh,

is it possible you give the cpuidle driver your host is using ?

Thanks
   -- Daniel

--=20
  <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software fo=
r ARM SoCs

=46ollow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
