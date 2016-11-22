From: Paul Moore <paul@paul-moore.com>
Subject: Re: linux-next: manual merge of the audit tree with Linus' tree
Date: Tue, 22 Nov 2016 16:25:12 -0500
Message-ID: <CAHC9VhQCwE3FKv_1NUrpC3D-gbQQUkASvu0Wak8P8zLC+WFF+Q@mail.gmail.com>
References: <20161122162936.674b7531@canb.auug.org.au> <20161122103538.GS27818@madcap2.tricolour.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-vk0-f50.google.com ([209.85.213.50]:34622 "EHLO
        mail-vk0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933511AbcKVVZO (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 22 Nov 2016 16:25:14 -0500
Received: by mail-vk0-f50.google.com with SMTP id x186so23537244vkd.1
        for <linux-next@vger.kernel.org>; Tue, 22 Nov 2016 13:25:14 -0800 (PST)
In-Reply-To: <20161122103538.GS27818@madcap2.tricolour.ca>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Richard Guy Briggs <rgb@redhat.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Nov 22, 2016 at 5:35 AM, Richard Guy Briggs <rgb@redhat.com> wrote:
> On 2016-11-22 16:29, Stephen Rothwell wrote:
>> Hi Paul,
>
> Hi Stephen,
>
>> Today's linux-next merge of the audit tree got a conflict in:
>>
>>   include/uapi/linux/audit.h
>>
>> between commit:
>>
>>   7ff89ac608d9 ("audit: add exclude filter extension to feature bitmap")
>>
>> from Linus' tree and commit:
>>
>>   0489410368df ("audit: add support for session ID user filter")
>>
>> from the audit tree.
>
> Ok, I expected this conflict...
>
>> I fixed it up (see below) and can carry the fix as necessary. This
>> is now fixed as far as linux-next is concerned, but any non trivial
>> conflicts should be mentioned to your upstream maintainer when your tree
>> is submitted for merging.  You may also want to consider cooperating
>> with the maintainer of the conflicting tree to minimise any particularly
>> complex conflicts.
>
> The fix looks as expected.  Thanks!

Yes, +1 to what Richard already said; I've had to apply similar
patches for some of my test kernels.

-- 
paul moore
www.paul-moore.com
