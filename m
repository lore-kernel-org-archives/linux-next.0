From: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
Date: Wed, 21 Sep 2016 10:27:46 +1000
Message-ID: <87bmzirta5.fsf@concordia.ellerman.id.au>
References: <20160920164414.4062bb0b@canb.auug.org.au> <20160920173012.1abe1d84@canb.auug.org.au> <87mvj2srvj.fsf@concordia.ellerman.id.au> <20160921091622.53067648@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160921091622.53067648@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "bauerman@linux.vnet.ibm.com" <bauerman@linux.vnet.ibm.com>
List-Id: linux-next.vger.kernel.org

Stephen Rothwell <sfr@canb.auug.org.au> writes:

> On Tue, 20 Sep 2016 22:00:32 +1000 Michael Ellerman <mpe@ellerman.id.au> wrote:
>>
>> Ah yep looks like that's the problem, patch below should fix it?
>
> Yeah, I am just going to (logically) run "sed 's/CONFIG_WORD_SIZE/BITS/'"
> over the tree during the merge of the apm-current tree today.
>
>> I think I'd actually prefer it if purgatory didn't redefine the CFLAGS
>> from scratch, so I'll see if Thiago can do that and send a new version.
>
> That could be better, but there are still some additions of
> CONFIG_WORD_SIZE elsewhere :-(

I don't see any others in yesterday's next?

cheers
