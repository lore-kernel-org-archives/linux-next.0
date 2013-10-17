From: Christoffer Dall <christoffer.dall@linaro.org>
Subject: Re: linux-next: manual merge of the kvm-arm tree
Date: Thu, 17 Oct 2013 09:53:11 -0700
Message-ID: <CAMJs5B9KnfuUrxpfhnYUm1UmZf2jmATsfn6MrsXGBzOX6vz54A@mail.gmail.com>
References: <1381949500-501-1-git-send-email-treding@nvidia.com>
	<1381949500-501-3-git-send-email-treding@nvidia.com>
	<525EE1BC.3050605@arm.com>
	<CAMJs5B85FwnXN3YE5-KagSjYDH0aSeVYgcwvSXy8=LGfw=STaw@mail.gmail.com>
	<20131017145522.GH30802@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wi0-f173.google.com ([209.85.212.173]:57695 "EHLO
	mail-wi0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755352Ab3JQQxN (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 17 Oct 2013 12:53:13 -0400
Received: by mail-wi0-f173.google.com with SMTP id ey11so3098374wid.6
        for <linux-next@vger.kernel.org>; Thu, 17 Oct 2013 09:53:12 -0700 (PDT)
In-Reply-To: <20131017145522.GH30802@redhat.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Gleb Natapov <gleb@redhat.com>
Cc: Marc Zyngier <marc.zyngier@arm.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Austin <Jonathan.Austin@arm.com>, Olof Johansson <olof@lixom.net>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Paolo Bonzini <pbonzini@redhat.com>

On 17 October 2013 07:55, Gleb Natapov <gleb@redhat.com> wrote:
> On Wed, Oct 16, 2013 at 12:02:08PM -0700, Christoffer Dall wrote:
>> On 16 October 2013 11:58, Marc Zyngier <marc.zyngier@arm.com> wrote:
>> > On 16/10/13 19:51, Thierry Reding wrote:
>> >> Today's linux-next merge of the kvm-arm tree got conflicts in
>> >>
>> >>       arch/arm/kvm/reset.c
>> >>
>> >> caused by commits e8c2d99 (KVM: ARM: Add support for Cortex-A7) and ac570e0
>> >> (ARM: kvm: rename cpu_reset to avoid name clash).
>> >>
>> >> I've fixed them up (see below). Please verify that the resolution looks
>> >> good.
>> >
>> > Looks good to me (I have the same resolution in my own tree).
>> >
>> Yes, fix is good.
>>
>> This will stay a conflict until kvm/next and kvm/fixes merge, which
>> doesn't happen before after the merge window, usually.  If that's
> So in this case it happened today because part of powerpc patches where
> based on commit after -rc4 and I had to merge to be able to pull them.
> Christoffer can you look at queue branch of kvm.git and see that the
> resolution is correct?
>
Yes, the resolution is correct. Thanks.
