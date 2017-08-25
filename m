From: Christoffer Dall <cdall@cs.columbia.edu>
Subject: Re: linux-next: manual merge of the kvm-arm tree with the arm64 tree
Date: Fri, 25 Aug 2017 10:44:17 +0200
Message-ID: <CAEDV+gJa4pY-c3G1S6fq3HmkS3eukR3qFd6i=k-2Ws6Z0N=mxA@mail.gmail.com>
References: <20170825145721.51c56af3@canb.auug.org.au> <87wp5s83ss.fsf@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <87wp5s83ss.fsf@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marc Zyngier <marc.zyngier@arm.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Catalin Marinas <catalin.marinas@arm.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, James Morse <james.morse@arm.com>, Julien Thierry <julien.thierry@arm.com>
List-Id: linux-next.vger.kernel.org

On Fri, Aug 25, 2017 at 10:11 AM, Marc Zyngier <marc.zyngier@arm.com> wrote:
> Hi Stephen,
>
> On Fri, Aug 25 2017 at  2:57:21 pm BST, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>> Hi all,
>>
>> Today's linux-next merge of the kvm-arm tree got a conflict in:
>>
>>   arch/arm64/include/asm/esr.h
>>
>> between commit:
>>
>>   1f9b8936f36f ("arm64: Decode information from ESR upon mem faults")
>>
>> from the arm64 tree and commit:
>>
>>   c5511c3c068c ("KVM: arm/arm64: Fix guest external abort matching")
>>
>> from the kvm-arm tree.
>>
>> I fixed it up (I used the former version) and can carry the fix as
>> necessary. This is now fixed as far as linux-next is concerned, but any
>> non trivial conflicts should be mentioned to your upstream maintainer
>> when your tree is submitted for merging.  You may also want to consider
>> cooperating with the maintainer of the conflicting tree to minimise any
>> particularly complex conflicts.
>
> Thanks for that, result looking good.
>
> Christoffer: I think we could simply drop the hunk touching esr.h from
> James' patch. After all, even if nothing is using it, this bit still
> exists in the ESR register, and there is little gain in dropping its
> definition. This would solve the conflict nicely...
>

Yes, I have updated the branch accordingly and added my signed-off-by as well.

Thanks,
-Christoffer
