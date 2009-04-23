From: Benny Halevy <bhalevy@panasas.com>
Subject: Re: [PATCH -next] lib: Move find_last_bit.o to obj-y to enable use
 by modules.
Date: Thu, 23 Apr 2009 13:12:54 +0300
Message-ID: <49F03F26.4060103@panasas.com>
References: <20090416030704.GH16961@linux-sh.org> <49E6E816.8010709@panasas.com> <20090423065006.GB21733@linux-sh.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from gw-ca.panasas.com ([209.116.51.66]:10766 "EHLO
	laguna.int.panasas.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1754378AbZDWKOe (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 23 Apr 2009 06:14:34 -0400
In-Reply-To: <20090423065006.GB21733@linux-sh.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Mundt <lethal@linux-sh.org>, Rusty Russell <rusty@rustcorp.com.au>, Ingo Molnar <mingo@elte.hu>
Cc: Trond Myklebust <Trond.Myklebust@netapp.com>, linux-next@vger.kernel.org, Andy Adamson <andros@netapp.com>, Fredric Isaman <iisaman@citi.umich.edu>, Stephen Rothwell <sfr@canb.auug.org.au>, Alexander Beregalov <a.beregalov@gmail.com>, Subrata Modak <subrata@linux.vnet.ibm.com>, sachinp <sachinp@linux.vnet.ibm.com>

On Apr. 23, 2009, 9:50 +0300, Paul Mundt <lethal@linux-sh.org> wrote:
> On Thu, Apr 16, 2009 at 11:11:02AM +0300, Benny Halevy wrote:
>> On Apr. 16, 2009, 6:07 +0300, Paul Mundt <lethal@linux-sh.org> wrote:
>>> Caught with the sh allmodconfig:
>>>
>>> 	ERROR: "find_last_bit" [fs/nfs/nfs.ko] undefined!
>>> 	make[2]: *** [__modpost] Error 1
>>> 	make[1]: *** [modules] Error 2
>>> 	make: *** [sub-make] Error 2
>>>
>>> find_last_bit.o is currently built with lib-y, which ends up breaking
>>> the nfs module build after the ("nfs41: free slot") commit. Move it
>>> to obj-y so the EXPORT_SYMBOL() actually has some effect.
>>>
>>> Signed-off-by: Paul Mundt <lethal@linux-sh.org>
>>> Cc: Benny Halevy <bhalevy@panasas.com>
>> ACK. and thanks!
>>
>> FYI, Fred's original patch can be found here:
>> http://patchwork.kernel.org/patch/14572/
>>
>> It is also queued in the linux-pnfs tree:
>> http://git.linux-nfs.org/?p=bhalevy/linux-pnfs.git;a=commitdiff;h=1e3a7552d9de2ba101b76deed99605f0145fc4d5
>> but I haven't submitted it to Trond since I expected
>> it to get upstream (and to -next) via linux-kbuild.
>>
>> Trond, would you like to pull this change to your nfsv41 branch?
>> (should appear before "nfs41: free slot" as Paul noticed)
>>
> Ok, so we have two different trivial patches for fixing the same thing,
> and a week later it is still broken.
> 
> I realize it is a trivial patch, but it does break builds. If folks
> aren't going to take these sorts of things more seriously, then their
> tree should be dropped after a grace period (say 2 days or so).
> 
> Beyond that, it doesn't seem like -next has any sort of coherent policy
> for dealing with trivial patches. If the emphasis is on the tree that
> introduced the regression to deal with it, then trees need to be
> aggressively dropped when these things go unfixed.
> 
> Having builds broken for a week for an issue that has been spotted and
> fixed by several people is simply unacceptable.

Paul, that's a valid point but I don't set these polices.
Trond suggested to just commit this to 2.6.30
and I asked Rusty's Ack here:
http://lkml.org/lkml/2009/4/21/489

Like I said there, I'm not sure who to send this patch to.
Ingo?

Benny
