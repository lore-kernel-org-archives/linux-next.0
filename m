From: "Vegard Nossum" <vegard.nossum@gmail.com>
Subject: Re: Git next: Second stage of cpu_alloc patches
Date: Wed, 5 Nov 2008 08:52:01 +0100
Message-ID: <19f34abd0811042352q2df6ed0r6c92a35159d2b04c@mail.gmail.com>
References: <Pine.LNX.4.64.0811042053510.31638@quilx.com>
	 <20081104195205.fe1bf62b.akpm@linux-foundation.org>
	 <20081105182642.8497301a.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from wa-out-1112.google.com ([209.85.146.179]:49787 "EHLO
	wa-out-1112.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752765AbYKEHwC (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 5 Nov 2008 02:52:02 -0500
In-Reply-To: <20081105182642.8497301a.sfr@canb.auug.org.au>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Christoph Lameter <cl@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, travis@sgi.com, linux-next@vger.kernel.org

On Wed, Nov 5, 2008 at 8:26 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Christoph,
>
> On Tue, 4 Nov 2008 19:52:05 -0800 Andrew Morton <akpm@linux-foundation.org> wrote:
>>
>> On Tue, 4 Nov 2008 20:56:52 -0600 (CST) Christoph Lameter <cl@linux-foundation.org> wrote:
>>
>> > The second stage of the cpu_alloc patchset can be pulled from
>> >
>> > kernel.org/pub/scm/linux/kernel/git/christoph/work.git cpu_alloc_stage2
>>
>> Please send the patches for review.  Always.
>
> And I would like to see a bit of positive feedback from the first set
> (given we have boot failures bisected down to this stuff) before we add
> more on top.

Thanks. I will try out today's linux-next later today (if I can find
the time for it).

Just in case it helps track down the problem: Adding percpu=100000 to
the kernel command line got the thing booting for me. The number
itself was picked at random, but it worked on the first try. The
machine is a single-core P4 3.0 GHz with HT, 1G RAM, using slightly
modified F9 config.


Vegard

-- 
"The animistic metaphor of the bug that maliciously sneaked in while
the programmer was not looking is intellectually dishonest as it
disguises that the error is the programmer's own creation."
	-- E. W. Dijkstra, EWD1036
