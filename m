From: Jason Wessel <jason.wessel@windriver.com>
Subject: Re: linux-next: kgdb tree build warning
Date: Thu, 24 Dec 2009 08:44:48 -0600
Message-ID: <4B337E60.4000200@windriver.com>
References: <20091224104812.7f2495f3.sfr@canb.auug.org.au><4B32E95C.3030201@windriver.com> <20091224162117.ac18e50f.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.windriver.com ([147.11.1.11]:62877 "EHLO
	mail.windriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751851AbZLXOoy (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 24 Dec 2009 09:44:54 -0500
In-Reply-To: <20091224162117.ac18e50f.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Martin Hicks <mort@sgi.com>

Stephen Rothwell wrote:
> Hi Jason,
>
> On Wed, 23 Dec 2009 22:09:00 -0600 Jason Wessel <jason.wessel@windriver.com> wrote:
>   
>> Stephen Rothwell wrote:
>>     
>>> Today's linux-next build (x86_64_allmodconfig) produced this warning:
>>>
>>> kernel/debug/kdb/kdb_bp.c: In function 'kdb_bp':
>>> kernel/debug/kdb/kdb_bp.c:434: warning: the frame size of 32880 bytes is larger than 2048 bytes
>>>
>>>       
> That function has a kdb_bp_t on its stack which contains an NR_CPUS array
> of pointers.  NR_CPUS is 4096 (in this build) and pointers are 8 bytes,
> so there is 32K right there :-(
>
>   

Thank you for the details.  I see that I can see the same problem if I
set CONFIG_MAXSMP and use CONFIG_FRAME_WARN=2048.  It also allowed me to
test that the problem is really fixed. :-)

I had talked with Martin a while back and he gave me some patches which
cleaned up the breakpoint code (kdb_bp.c).   The hw breakpoint support
was implemented a different way in the new kdb/kgdb.   You stumbled upon
something that was intended to already be removed from the source.

As a side point you pointed me to an area where I could remove some
other code that should not be there because the debug core is already
handling the operations.  The net result is this problem is fixed, and 2
more variables are gone out of that struct.


-       int             bp_cpu;         /* Cpu #  (if bp_global == 0) */
-       kdbhard_bp_t   *bp_hard[NR_CPUS]; /* Hardware breakpoint
structure */
-       int             bp_adjust;      /* Adjustment to PC for real
-                                        * instruction */

Thanks,
Jason.
