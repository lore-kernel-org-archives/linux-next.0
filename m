From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: linux-next: manual merge of the kvm tree with Linus' tree
Date: Thu, 1 Feb 2018 10:30:01 -0500
Message-ID: <094e0874-ed6b-2b36-19a8-afc5bd30268c@redhat.com>
References: <20180201125512.7bc96674@canb.auug.org.au>
 <20180201104707.GA21802@cbox> <20180202002227.36db3356@canb.auug.org.au>
 <f49453f2-223e-abe0-912a-7288183a1671@redhat.com>
 <20180201152244.GC31080@flask>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180201152244.GC31080@flask>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@redhat.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Christoffer Dall <christoffer.dall@linaro.org>, KVM <kvm@vger.kernel.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Marc Zyngier <marc.zyngier@arm.com>
List-Id: linux-next.vger.kernel.org

On 01/02/2018 10:22, Radim Krčmář wrote:
> 2018-02-01 09:21-0500, Paolo Bonzini:
>> On 01/02/2018 08:22, Stephen Rothwell wrote:
>>> Hi Christoffer,
>>>
>>> On Thu, 1 Feb 2018 11:47:07 +0100 Christoffer Dall <christoffer.dall@linaro.org> wrote:
>>>>
>>>> While the suggested fix is functional it does result in some code
>>>> duplication, and the better resolution is the following:
>>>
>>> OK, I will use that resolution form tomorrow on.
>>>
>>> Someone needs to remember to let Linus know when the pull request is
>>> sent.
>>
>> It should be fixed in the KVM tree before it reaches Linus (when we
>> merge a topic branch that is common between x86/pti & KVM).
> 
> I wasn't sure if the pti top branch is final, so I pulled hyper-v topic
> branch that also also contains v4.15.  This and the SEV feature
> conflicts should be gone now,

The pti topic branch is now updated with the v3 patches.  So if v3 is
good for you, it is final. :)

Paolo
