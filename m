From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: linux-next: manual merge of the kvm tree with Linus' tree
Date: Wed, 17 Jan 2018 13:17:03 +0100
Message-ID: <b54c26df-cee2-a930-7e34-47701e852f9e@redhat.com>
References: <20180117144817.1cba736f@canb.auug.org.au>
 <alpine.DEB.2.20.1801171243230.1777@nanos>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.20.1801171243230.1777@nanos>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@redhat.com>, KVM <kvm@vger.kernel.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, David Woodhouse <dwmw@amazon.co.uk>, Ingo Molnar <mingo@kernel.org>, Brijesh Singh <brijesh.singh@amd.com>
List-Id: linux-next.vger.kernel.org

On 17/01/2018 12:45, Thomas Gleixner wrote:
> On Wed, 17 Jan 2018, Stephen Rothwell wrote:
>> [This is the same conflict I reported the day before yesterday, but one
>> of the commits has moved and another that contributed has been dropped.]
>> diff --cc arch/x86/include/asm/cpufeatures.h
>> index aa09559b2c0b,19f35be95f16..000000000000
>> --- a/arch/x86/include/asm/cpufeatures.h
>> +++ b/arch/x86/include/asm/cpufeatures.h
>> @@@ -211,7 -209,6 +211,8 @@@
>>   #define X86_FEATURE_AVX512_4FMAPS	( 7*32+17) /* AVX-512 Multiply Accumulation Single precision */
>>   
>>   #define X86_FEATURE_MBA			( 7*32+18) /* Memory Bandwidth Allocation */
>>  +#define X86_FEATURE_RSB_CTXSW		( 7*32+19) /* Fill RSB on context switches */
>> ++#define X86_FEATURE_SEV			( 7*32+20) /* AMD Secure Encrypted Virtualization */
> Groan.....
> 

Brijesh,

please send out again the (host-side) SEV series so that they are merged
through the TIP tree instead of kvm.git.

Even though Boris did review it, there's just too much stuff in there
outside arch/x86/kvm.

Thanks,

Paolo
