From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: Re: [next] nfs update breaks build on sparc
Date: Thu, 25 Jun 2015 18:40:45 -0400
Message-ID: <CAP=VYLoZQrknQS5v5QEYJPqx6=g+aHAt2jJeimO8Z+UvFHKpEg@mail.gmail.com>
References: <20150625145528.GA3069@windriver.com> <20150625152424.GC3069@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <sparclinux-owner@vger.kernel.org>
In-Reply-To: <20150625152424.GC3069@windriver.com>
Sender: sparclinux-owner@vger.kernel.org
To: Trond Myklebust <trond.myklebust@primarydata.com>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, sparclinux@vger.kernel.org
List-Id: linux-next.vger.kernel.org

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

Presumably this is the same thing; showing up in i386 and elsewhere:

fs/nfs/flexfilelayout/flexfilelayout.c:444:15: error: call to
'__xchg_wrong_size' declared with attribute error: Bad argument size
for xchg
fs/nfs/flexfilelayout/flexfilelayout.c:433:3: error: call to
'__cmpxchg_wrong_size' declared with attribute error: Bad argument
size for cmpxchg
fs/nfs/flexfilelayout/flexfilelayout.c:463:2: error: call to
'__cmpxchg_wrong_size' declared with attribute error: Bad argument
size for cmpxchg
fs/nfs/flexfilelayout/flexfilelayout.c:464:2: error: call to
'__cmpxchg_wrong_size' declared with attribute error: Bad argument
size for cmpxchg
make[4]: *** [fs/nfs/flexfilelayout/flexfilelayout.o] Error 1
make[3]: *** [fs/nfs/flexfilelayout] Error 2
make[2]: *** [fs/nfs] Error 2

http://kisskb.ellerman.id.au/kisskb/buildresult/12449737/

Paul.
---
