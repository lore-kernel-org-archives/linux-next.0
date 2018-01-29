From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: linux-next: manual merge of the kvm tree with Linus' tree
Date: Mon, 29 Jan 2018 11:35:29 +0100
Message-ID: <fb45f2c2-2025-af25-1604-dc8c2f7c00f6@redhat.com>
References: <20180117144817.1cba736f@canb.auug.org.au>
 <alpine.DEB.2.20.1801171243230.1777@nanos>
 <b54c26df-cee2-a930-7e34-47701e852f9e@redhat.com>
 <alpine.DEB.2.20.1801171321580.1777@nanos>
 <20180117234326.24a2c0c3@canb.auug.org.au>
 <alpine.DEB.2.20.1801171353100.1777@nanos>
 <20180129150208.4073e973@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180129150208.4073e973@canb.auug.org.au>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@redhat.com>, KVM <kvm@vger.kernel.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, David Woodhouse <dwmw@amazon.co.uk>, Ingo Molnar <mingo@kernel.org>, Brijesh Singh <brijesh.singh@amd.com>
List-Id: linux-next.vger.kernel.org

On 29/01/2018 05:02, Stephen Rothwell wrote:
> Hi all,
> 
> On Wed, 17 Jan 2018 13:53:26 +0100 (CET) Thomas Gleixner <tglx@linutronix.de> wrote:
>>
>> On Wed, 17 Jan 2018, Stephen Rothwell wrote:
>>> On Wed, 17 Jan 2018 13:23:17 +0100 (CET) Thomas Gleixner <tglx@linutronix.de> wrote:  
>>>> No. Keep it and lets next time coordinate the relevant bits and pieces
>>>> better. I reserve that bit 20 and let Linus sort out the trivial conflict
>>>> when merging the stuff.  
>>>
>>> I just picked that bit 20 when resolving the conflict.  The original patch used
>>> bit 11, so the resolution could use any other sensible bit.  
>>
>> 20 is fine :)
> 
> So maybe this (X86_FEATURE_SEV) should be fixed up to use "( 7*32+20)" in
> the kvm tree?  (Just a followup patch changing the value/position in the
> file would be fine).

Yes, we'll fix this and the other conflicts with Linus's tree before
sending out the pull request.

Paolo
