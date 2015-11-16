From: Michal Marek <mmarek@suse.cz>
Subject: Re: linux-next: clean up the kbuild tree?
Date: Mon, 16 Nov 2015 14:01:45 +0100
Message-ID: <5649D3B9.7020701@suse.cz>
References: <20151115112705.0bf4f0ed@canb.auug.org.au>
 <20151115175848.GD10150@tassilo.jf.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:33831 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751843AbbKPNBt (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 16 Nov 2015 08:01:49 -0500
In-Reply-To: <20151115175848.GD10150@tassilo.jf.intel.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andi Kleen <ak@linux.intel.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Dne 15.11.2015 v 18:58 Andi Kleen napsal(a):
> On Sun, Nov 15, 2015 at 11:27:05AM +1100, Stephen Rothwell wrote:
>> Hi Michal,
>>
>> I notice that the kbuild tree (relative to Linus' tree) only contains
>> lots of merges and these 2 commits from April 2014:
> 
> Really should get in that patch officially. I have a variety of users.
> And it clearly has been tested long enough in linux-next :)
> Michal, enough to just repost it?

So the commit in kbuild.git tree is identical to what is being tested
out of tree? Could you nevertheless provide an updated changelog? One
(and actually only) of Linus' objections was that it was not clear at
all what the actual benefits for the kernel itself are. Do you have some
benchmarks perhaps, where LTO achieves a preformance gain? Also, did the
compile time impact change with gcc 5.x?

Thanks,
Michal
