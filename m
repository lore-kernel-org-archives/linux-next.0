From: Miklos Szeredi <miklos@szeredi.hu>
Subject: Re: linux-next: manual merge of the vfs tree with the overlayfs tree
Date: Mon, 2 May 2016 10:30:13 +0200
Message-ID: <CAJfpegt0oPiE=UEDNgH5CQRSZb1J43Ya_xndHruUvFgeL0DMLw@mail.gmail.com>
References: <20160502105943.72202e80@canb.auug.org.au>
	<20160502010838.GJ25498@ZenIV.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-oi0-f68.google.com ([209.85.218.68]:34416 "EHLO
	mail-oi0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751500AbcEBIaO (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 2 May 2016 04:30:14 -0400
Received: by mail-oi0-f68.google.com with SMTP id d139so5567557oig.1
        for <linux-next@vger.kernel.org>; Mon, 02 May 2016 01:30:13 -0700 (PDT)
In-Reply-To: <20160502010838.GJ25498@ZenIV.linux.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Kernel Mailing List <linux-kernel@vger.kernel.org>

On Mon, May 2, 2016 at 3:08 AM, Al Viro <viro@zeniv.linux.org.uk> wrote:
> On Mon, May 02, 2016 at 10:59:43AM +1000, Stephen Rothwell wrote:
>> Hi Al,
>>
>> Today's linux-next merge of the vfs tree got a conflict in:
>>
>>   fs/overlayfs/super.c
>>
>> between commit:
>>
>>   d478d6a8b8b7 ("ovl: ignore permissions on underlying lookup")
>>
>> from the overlayfs tree and commit:
>>
>>   5cf3e7fecb43 ("ovl_lookup_real(): use lookup_one_len_unlocked()")
>>
>> from the vfs tree.
>>
>> I fixed it up (I used the overlayfs version, since I don't know the
>> locking consequences of teh change from lookup_one_len() to lookup_hash())
>> and can carry the fix as necessary. This is now fixed as far as linux-next
>> is concerned, but any non trivial conflicts should be mentioned to your
>> upstream maintainer when your tree is submitted for merging.  You may
>> also want to consider cooperating with the maintainer of the conflicting
>> tree to minimise any particularly complex conflicts.
>
> Should use lookup_one_len_unlocked(), actually.  lookup_hash() is
> a microoptimization, losing a lot more on excessive i_mutex contention.
> Either variant works, though.

No, here it's not an optimization:

    "More specifically using lookup_one_len() causes a problem when the lower
    directory lacks search permission for a specific user while the upper
    directory does have search permission.  Since lookups are cached, this
    causes inconsistency in behavior: success depends on who did the first
    lookup."

Thanks,
Miklos
