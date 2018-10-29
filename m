From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: build failure in Linus' tree
Date: Sun, 28 Oct 2018 19:17:16 -0700 (PDT)
Message-ID: <20181028.191716.382124691461827661.davem@davemloft.net>
References: <20181029093532.38a3888e@canb.auug.org.au>
        <CAHk-=wi475eRvUDctiWdBWsEB7UYgr8OrpPzrd=xkevUpTSCuA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHk-=wi475eRvUDctiWdBWsEB7UYgr8OrpPzrd=xkevUpTSCuA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: torvalds@linux-foundation.org
Cc: sfr@canb.auug.org.au, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, liuhangbin@gmail.com
List-Id: linux-next.vger.kernel.org

From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 28 Oct 2018 15:45:16 -0700

> On Sun, Oct 28, 2018 at 3:35 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>
>> After merging the origin tree, today's linux-next build (powerpc
>> ppc64_defconfig) failed like this:
> 
> linux-next is back! Wheee..
> 
>>   5a2de63fd1a5 ("bridge: do not add port to router list when receives query with source 0.0.0.0")
> 
> David?

I'm on it and have a fix coming.
