From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: build failure after merge of most trees
Date: Thu, 22 Jun 2017 10:29:23 -0400 (EDT)
Message-ID: <20170622.102923.1704137848607888832.davem@davemloft.net>
References: <20170622152441.3704b3d9@canb.auug.org.au>
        <20170622184116.0ebaabd9@roar.ozlabs.ibm.com>
        <20170622.101306.2121302610489503804.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170622.101306.2121302610489503804.davem@davemloft.net>
Sender: linux-kernel-owner@vger.kernel.org
To: npiggin@gmail.com
Cc: sfr@canb.auug.org.au, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, yamada.masahiro@socionext.com, amodra@gmail.com
List-Id: linux-next.vger.kernel.org

From: David Miller <davem@davemloft.net>
Date: Thu, 22 Jun 2017 10:13:06 -0400 (EDT)

> From: Nicholas Piggin <npiggin@gmail.com>
> Date: Thu, 22 Jun 2017 18:41:16 +1000
> 
>> Is there any way for the linker to place the inputs to avoid unresolvable
>> relocations where possible?
> 
> I don't think so.
> 
>> A way to work around this is to make arch/sparc/lib/hweight.o an obj-y
>> rather than lib-y. That's a hack because it just serves to move the
>> input location, but not really any more of a hack than the current code
>> that also only works because of input locations...
> 
> I could adjust those branches in the sparc code into indirect calls
> but it's going to perform a bit poorly on older cpus.
> 
> Something like this:

I just wanted to mention something in passing.

On sparc64 we patch the first two instructions of memcpy, memset,
bzero, etc. in order to vector them to cpu optimized routines.

And we use the same kind of branch there.

Now because the branches are to routines in the same directory it
should never exceed the relocation limits.

However, if the relocation limits were exceeded in this case, the
build would still succeed and the kernel would be simply broken and
not bootup properly.
