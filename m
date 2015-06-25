From: Trond Myklebust <trond.myklebust@primarydata.com>
Subject: Re: [next] nfs update breaks build on sparc
Date: Thu, 25 Jun 2015 19:13:45 -0400
Message-ID: <CAHQdGtRrb+BPL9Ui9F8YzkrM6g=Xzj696Y6Mgw_5-uxLjZN0oA@mail.gmail.com>
References: <20150625145528.GA3069@windriver.com>
	<20150625152424.GC3069@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-vn0-f50.google.com ([209.85.216.50]:38918 "EHLO
	mail-vn0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751507AbbFYXNq (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 25 Jun 2015 19:13:46 -0400
Received: by vnav203 with SMTP id v203so13272383vna.6
        for <linux-next@vger.kernel.org>; Thu, 25 Jun 2015 16:13:45 -0700 (PDT)
In-Reply-To: <20150625152424.GC3069@windriver.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Gortmaker <paul.gortmaker@windriver.com>, Tao Peng <tao.peng@primarydata.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, sparclinux@vger.kernel.org

On Thu, Jun 25, 2015 at 11:24 AM, Paul Gortmaker
<paul.gortmaker@windriver.com> wrote:
>
> New breakage seen in linux-next today:
>
> ERROR: "__xchg_called_with_bad_pointer" [fs/nfs/flexfilelayout/nfs_layout_flexfiles.ko] undefined!
> ERROR: "__cmpxchg_called_with_bad_pointer" [fs/nfs/flexfilelayout/nfs_layout_flexfiles.ko] undefined!
> make[2]: *** [__modpost] Error 1
> make[1]: *** [modules] Error 2
>
> I tried to reproduce it locally so I could run a bisect,
> but it must be toolchain specific because I don't see it.
>

Sigh. It looks as if xchg() and cmpxchg() are not available for 64-bit
integers on sparc32.
Tao, can we rely on mirror->lock to provide atomicity here instead?

Cheers
  Trond
