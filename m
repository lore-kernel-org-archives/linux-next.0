From: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [DLPAR CPU][Oops] Bad kernel stack pointer
Date: Fri, 22 Sep 2017 22:26:10 +1000
Message-ID: <87poaiudgd.fsf@concordia.ellerman.id.au>
References: <1505729319.6990.5.camel@abdul.in.ibm.com> <878th9lhpe.fsf@concordia.ellerman.id.au> <1506074224.17232.8.camel@abdul.in.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:54445 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752116AbdIVM0P (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 22 Sep 2017 08:26:15 -0400
In-Reply-To: <1506074224.17232.8.camel@abdul.in.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Abdul Haleem <abdhalee@linux.vnet.ibm.com>
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-next <linux-next@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Rob Herring <robh@kernel.org>, Paul Mackerras <paulus@samba.org>

Abdul Haleem <abdhalee@linux.vnet.ibm.com> writes:

> On Wed, 2017-09-20 at 21:42 +1000, Michael Ellerman wrote:
>> Abdul Haleem <abdhalee@linux.vnet.ibm.com> writes:
>> 
>> > Hi,
>> >
>> > Dynamic CPU remove operation resulted in Kernel Panic on today's
>> > next-20170915 kernel.
>> >
>> > Machine Type: Power 7 PowerVM LPAR
>> > Kernel : 4.13.0-next-20170915
>> > config : attached
>> > test: DLPAR CPU remove
>> >
>> >
>> > dmesg logs:
>> > ----------
>> > cpu 37 (hwid 37) Ready to die...
>> > cpu 38 (hwid 38) Ready to die...
>> > cpu 39 (hwid 39)
>> > ******* RTAS CReady to die...
>> > ALL BUFFER CORRUPTION *******
>> 
>> Cool. Does that come from RTAS itself? I have never seen that happen
>> before.
>
> Not sure, the var logs does not have any messages captured. This is
> first time we hit this type of issue.

Yeah it is from RTAS:

# lsprop /proc/device-tree/rtas/linux,rtas-base 
/proc/device-tree/rtas/linux,rtas-base
		 1eca0000 (516554752)
# lsprop /proc/device-tree/rtas/rtas-size
/proc/device-tree/rtas/rtas-size
		 01360000 (20316160)

# dd if=/dev/mem bs=4096 skip=126112 count=4960 of=rtas.bin
# strings rtas.bin | grep "RTAS CALL BUFFER"
******* RTAS CALL BUFFER CORRUPTION *******


So we were doing an RTAS call and RTAS itself detected that the call
buffer was corrupted. I'm not sure how it detects that, but something is
definitely screwed up.

>> Is this easily reproducible?
>
> I am unable to reproduce it again. I will keep an eye on our CI runs for
> few more runs.

OK thanks.

cheers
