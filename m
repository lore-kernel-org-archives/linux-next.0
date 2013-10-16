From: Christoffer Dall <christoffer.dall@linaro.org>
Subject: Re: linux-next: manual merge of the kvm-arm tree
Date: Wed, 16 Oct 2013 12:02:08 -0700
Message-ID: <CAMJs5B85FwnXN3YE5-KagSjYDH0aSeVYgcwvSXy8=LGfw=STaw@mail.gmail.com>
References: <1381949500-501-1-git-send-email-treding@nvidia.com>
	<1381949500-501-3-git-send-email-treding@nvidia.com>
	<525EE1BC.3050605@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wi0-f178.google.com ([209.85.212.178]:41494 "EHLO
	mail-wi0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757134Ab3JPTCK (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 16 Oct 2013 15:02:10 -0400
Received: by mail-wi0-f178.google.com with SMTP id hn9so1309533wib.11
        for <linux-next@vger.kernel.org>; Wed, 16 Oct 2013 12:02:08 -0700 (PDT)
In-Reply-To: <525EE1BC.3050605@arm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Marc Zyngier <marc.zyngier@arm.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jonathan Austin <Jonathan.Austin@arm.com>, Olof Johansson <olof@lixom.net>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, Gleb Natapov <gleb@redhat.com>

On 16 October 2013 11:58, Marc Zyngier <marc.zyngier@arm.com> wrote:
> On 16/10/13 19:51, Thierry Reding wrote:
>> Today's linux-next merge of the kvm-arm tree got conflicts in
>>
>>       arch/arm/kvm/reset.c
>>
>> caused by commits e8c2d99 (KVM: ARM: Add support for Cortex-A7) and ac570e0
>> (ARM: kvm: rename cpu_reset to avoid name clash).
>>
>> I've fixed them up (see below). Please verify that the resolution looks
>> good.
>
> Looks good to me (I have the same resolution in my own tree).
>
Yes, fix is good.

This will stay a conflict until kvm/next and kvm/fixes merge, which
doesn't happen before after the merge window, usually.  If that's
going to cause too many headaches, maybe we need to talk to the KVM
guys (cc'ed) about a solution until then.

Thanks,
-Christoffer
