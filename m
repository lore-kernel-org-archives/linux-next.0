From: Jim Davis <jim.epost@gmail.com>
Subject: Re: Problem building i386_defconfig with next-20130920
Date: Sun, 22 Sep 2013 19:20:29 -0700
Message-ID: <CA+r1ZhhEM82DFi5fniBtNFN7TK9j7NCU+BNQnE+wdFsisiFe0A@mail.gmail.com>
References: <CA+r1ZhjS+97EhQYXYSg-U9-SCrymoDmMu9JceBVyj7Wt0N3vgQ@mail.gmail.com>
	<20130923102050.bb0859b9b44d834a44facae1@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-qc0-f175.google.com ([209.85.216.175]:50859 "EHLO
	mail-qc0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753156Ab3IWCUa (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 22 Sep 2013 22:20:30 -0400
Received: by mail-qc0-f175.google.com with SMTP id v2so1680668qcr.6
        for <linux-next@vger.kernel.org>; Sun, 22 Sep 2013 19:20:29 -0700 (PDT)
In-Reply-To: <20130923102050.bb0859b9b44d834a44facae1@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org

I think it's a gcc version issue on my system.  I'm running Ubuntu
13.04, and after that upgrade the compiler version was 4.8.1. I tried
downgrading to gcc 4.4 and that got past the error.

 My gcc-fu is way too weak to figure out why the newer version was
causing problems, but there has for some time also been a problem
compiling the seccomp filter example program, that also seemed to
point to an issue with the Ubuntu build setup -- or at least the
Ubuntu build setup on my system.

On Sun, Sep 22, 2013 at 5:20 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Jim,
>
> On Fri, 20 Sep 2013 10:07:42 -0700 Jim Davis <jim.epost@gmail.com> wrote:
>>
>> Trying to build a x86 kernel is failing with
>>
>> kernel/bounds.c:1:0: error: CPU you selected does not support x86-64
>> instruction set
>>  /*
>>  ^
>> kernel/bounds.c:1:0: warning: -mregparm is ignored in 64-bit mode
>> [enabled by default]
>> make[1]: *** [kernel/bounds.s] Error 1
>> make: *** [prepare0] Error 2
>>
>> Here's the steps I've gone through in detail, just in case it's pilot error :/
>>
>> jim@krebstar:~/linux$ make distclean
>>   CLEAN   arch/x86/tools
>>   CLEAN   .tmp_versions
>>   CLEAN   scripts/basic
>>   CLEAN   scripts/kconfig
>>   CLEAN   include/config include/generated arch/x86/include/generated
>>   CLEAN   .config include/generated/uapi/linux/version.h
>> jim@krebstar:~/linux$ git clean -fdx
>> jim@krebstar:~/linux$ git remote -v
>> linux-next    git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>> (fetch)
>> linux-next    git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>> (push)
>> origin    git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
>> (fetch)
>> origin    git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
>> (push)
>> jim@krebstar:~/linux$ git remote update
>> Fetching origin
>> Fetching linux-next
>> jim@krebstar:~/linux$ git describe
>> v3.12-rc1
>> jim@krebstar:~/linux$ git tag | grep '^next-' | tail -1
>> next-20130920
>> jim@krebstar:~/linux$ make i386_defconfig
>
> So, you are building v3.12-rc1, not linux-next ... i386_defconfig is one
> of the builds I do before releasing linux-next (but not on just Linus'
> tree) and it did not fail for me on Friday (gcc 4.6.3 if it matters), so
> maybe this is fixed by something after -rc1 or in linux-next.
>
> --
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
