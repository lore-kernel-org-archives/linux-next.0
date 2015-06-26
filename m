From: Peng Tao <tao.peng@primarydata.com>
Subject: Re: [next] nfs update breaks build on sparc
Date: Fri, 26 Jun 2015 09:13:35 +0800
Message-ID: <CAKVebiXH2r_GMaGUHsAuYdPwNq58sZWuWH_K+9hZyq+C7mkdqQ@mail.gmail.com>
References: <20150625145528.GA3069@windriver.com> <20150625152424.GC3069@windriver.com>
 <CAHQdGtRrb+BPL9Ui9F8YzkrM6g=Xzj696Y6Mgw_5-uxLjZN0oA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ie0-f174.google.com ([209.85.223.174]:36781 "EHLO
	mail-ie0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751558AbbFZBN4 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 25 Jun 2015 21:13:56 -0400
Received: by iecvh10 with SMTP id vh10so66227270iec.3
        for <linux-next@vger.kernel.org>; Thu, 25 Jun 2015 18:13:55 -0700 (PDT)
In-Reply-To: <CAHQdGtRrb+BPL9Ui9F8YzkrM6g=Xzj696Y6Mgw_5-uxLjZN0oA@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Trond Myklebust <trond.myklebust@primarydata.com>
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, Linux Next Mailing List <linux-next@vger.kernel.org>, sparclinux@vger.kernel.org

On Fri, Jun 26, 2015 at 7:13 AM, Trond Myklebust
<trond.myklebust@primarydata.com> wrote:
> On Thu, Jun 25, 2015 at 11:24 AM, Paul Gortmaker
> <paul.gortmaker@windriver.com> wrote:
>>
>> New breakage seen in linux-next today:
>>
>> ERROR: "__xchg_called_with_bad_pointer" [fs/nfs/flexfilelayout/nfs_layout_flexfiles.ko] undefined!
>> ERROR: "__cmpxchg_called_with_bad_pointer" [fs/nfs/flexfilelayout/nfs_layout_flexfiles.ko] undefined!
>> make[2]: *** [__modpost] Error 1
>> make[1]: *** [modules] Error 2
>>
>> I tried to reproduce it locally so I could run a bisect,
>> but it must be toolchain specific because I don't see it.
>>
>
> Sigh. It looks as if xchg() and cmpxchg() are not available for 64-bit
> integers on sparc32.
> Tao, can we rely on mirror->lock to provide atomicity here instead?
>
yes, we can. It is already under mirror->lock. So we just need to open
code xchg/cmpxchg(). I'll send a patch to fix it.

Cheers,
Tao
