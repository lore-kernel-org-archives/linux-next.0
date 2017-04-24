From: Dan Williams <dan.j.williams@intel.com>
Subject: Re: linux-next: build failure after merge of the nvdimm tree
Date: Mon, 24 Apr 2017 16:29:36 -0700
Message-ID: <CAPcyv4g9giDXEwsGjchyjxwyxxX0HghWmaJfbB5DPsCcZ5a5xA@mail.gmail.com>
References: <20170424161130.762d71a8@canb.auug.org.au> <20170424083908.GW29622@ZenIV.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-oi0-f54.google.com ([209.85.218.54]:34187 "EHLO
        mail-oi0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1174562AbdDXX3h (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 24 Apr 2017 19:29:37 -0400
Received: by mail-oi0-f54.google.com with SMTP id x184so154496901oia.1
        for <linux-next@vger.kernel.org>; Mon, 24 Apr 2017 16:29:37 -0700 (PDT)
In-Reply-To: <20170424083908.GW29622@ZenIV.linux.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Mon, Apr 24, 2017 at 1:39 AM, Al Viro <viro@zeniv.linux.org.uk> wrote:
> On Mon, Apr 24, 2017 at 04:11:30PM +1000, Stephen Rothwell wrote:
>> Hi Dan,
>>
>> After merging the nvdimm tree, today's linux-next build (x86_64
>> allmodconfig) failed like this:
>>
>> drivers/nvdimm/x86.c: In function 'pmem_from_user':
>> drivers/nvdimm/x86.c:115:11: error: implicit declaration of function '__copy_from_user_nocache' [-Werror=implicit-function-declaration]
>>   int rc = __copy_from_user_nocache(dst, src, size);
>>            ^
>>
>> Caused by commit
>>
>>   6e704ff67315 ("uio, libnvdimm, pmem: implement cache bypass for all copy_from_iter() operations")
>>
>> interacting with commit
>>
>>   3f763453e6f2 ("kill __copy_from_user_nocache()")
>>
>> from the vfs tree.
>>
>> I have no idea why Al removed that function,
>
> Because the entire nocache pile is messy and misguided and the fewer of
> those we have, the easier it will be to untangle the damn thing.  This
> particular turdlet had no users in mainline.  Unfortunately, it has
> grown one in nvdimm, so we'll probably have to drop that removal for now
> and hope that it won't be too painful to untangle come next cycle.
>
> Oh, well...  Guess we'll need to resurrect memcpy_nocache() threads from
> December and deal witht that mess for good.

Hi Al, this conflict is hitting my attempt to "deal with that mess for good".

Can you give me your take on the sanity of the patches I cc'd you on
in the thread called "[resend PATCH v2 00/33] dax: introduce
dax_operations"

Here are some links:
[resend PATCH v2 00/33] dax: introduce dax_operations:
https://lists.01.org/pipermail/linux-nvdimm/2017-April/009711.html
[resend PATCH v2 19/33] dax, pmem: introduce 'copy_from_iter' dax
operation: https://lists.01.org/pipermail/linux-nvdimm/2017-April/009730.html
[resend PATCH v2 28/33] x86, libnvdimm, dax: stop abusing
__copy_user_nocache:
https://lists.01.org/pipermail/linux-nvdimm/2017-April/009738.html
[resend PATCH v2 29/33] uio, libnvdimm, pmem: implement cache bypass
for all copy_from_iter() operations:
https://lists.01.org/pipermail/linux-nvdimm/2017-April/009739.html
