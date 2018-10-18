From: Shuah Khan <shuah@kernel.org>
Subject: Re: linux-next: manual merge of the kselftest tree with the kvm tree
Date: Thu, 18 Oct 2018 08:16:46 -0600
Message-ID: <6b0dd0f6-ff79-97e8-9972-907cff0dcbcb@kernel.org>
References: <20181018155030.1d75c506@canb.auug.org.au>
 <2e7090d2-5c80-7fcf-6e50-7155280b998a@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <2e7090d2-5c80-7fcf-6e50-7155280b998a@redhat.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Paolo Bonzini <pbonzini@redhat.com>, Stephen Rothwell <sfr@canb.auug.org.au>, =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@redhat.com>, KVM <kvm@vger.kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Andrea Parri <andrea.parri@amarulasolutions.com>, Shuah Khan <shuah@kernel.org>
List-Id: linux-next.vger.kernel.org

On 10/18/2018 04:51 AM, Paolo Bonzini wrote:
> On 18/10/2018 06:50, Stephen Rothwell wrote:
>> Hi Shuah,
>>
>> Today's linux-next merge of the kselftest tree got a conflict in:
>>
>>   tools/testing/selftests/kvm/dirty_log_test.c
>>
>> between commit:
>>
>>   fff8dcd7b4a2 ("kvm: selftests: port dirty_log_test to aarch64")
>>
>> from the kvm tree and commit:
>>
>>   cda94d9ffa0e ("selftests: kvm: Fix -Wformat warnings")
>>
>> from the kselftest tree.
>>
>> I fixed it up (see below) and can carry the fix as necessary. This
>> is now fixed as far as linux-next is concerned, but any non trivial
>> conflicts should be mentioned to your upstream maintainer when your tree
>> is submitted for merging.  You may also want to consider cooperating
>> with the maintainer of the conflicting tree to minimise any particularly
>> complex conflicts.
>>
> 
> 
> Shuah, I think it's best if in the future the
> tools/testing/selftests/kvm/ changes go through my tree, unless they
> affect many selftests subdirectories.
> 

Yes. That makes sense. Looked like an harmless patch that might not have
any dependencies. Should have checked with you.

Thanks for taking care of the problem.

thanks,
-- Shuah
