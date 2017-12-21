From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH linux-next] KVM: x86: don't forget vcpu_put() in
 kvm_arch_vcpu_ioctl_set_sregs()
Date: Thu, 21 Dec 2017 10:07:34 +0100
Message-ID: <c5aa7a41-e103-04ae-89e8-059fc5380a73@redhat.com>
References: <001a1148cc3acf967c0560c7b760@google.com>
 <20171221002427.82325-1-ebiggers3@gmail.com>
 <5e98adf7-809f-3b98-e8fc-6ba89e2777cf@redhat.com>
 <1bed30da-d01f-ecfd-8024-d7c402c30f15@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <kvm-owner@vger.kernel.org>
In-Reply-To: <1bed30da-d01f-ecfd-8024-d7c402c30f15@intel.com>
Content-Language: en-US
Sender: kvm-owner@vger.kernel.org
To: Lan Tianyu <tianyu.lan@intel.com>, Eric Biggers <ebiggers3@gmail.com>, kvm@vger.kernel.org
Cc: rkrcmar@redhat.com, christoffer.dall@linaro.org, x86@kernel.org, linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com, Eric Biggers <ebiggers@google.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next Mailing List <linux-next@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On 21/12/2017 03:45, Lan Tianyu wrote:
> Hi Paolo:
> 	Should we check input sregs before loading vcpu? If input sregs is
> invalid, the operation is redundant.

That would be another way to fix the conflict.  Note that the conflict
is between two different trees (kvm/master and kvm/next), so in any case
it will remain until the next merge window.

Paolo
