From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: linux-next: manual merge of the pidfd tree with the y2038 tree
 (now block and tip trees)
Date: Wed, 13 Feb 2019 13:57:51 +0100
Message-ID: <CAK8P3a1hw03ik+tZSG8PnP7Rd=Pzwbo7n59HLJW04ncndyqzsg@mail.gmail.com>
References: <20190122141027.70cd9166@canb.auug.org.au> <20190213162212.500a7cd5@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190213162212.500a7cd5@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Christian Brauner <christian@brauner.io>, Jens Axboe <axboe@kernel.dk>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Wed, Feb 13, 2019 at 6:22 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> On Tue, 22 Jan 2019 14:10:27 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > Today's linux-next merge of the pidfd tree got conflicts in:
> >
> >   arch/x86/entry/syscalls/syscall_32.tbl
> >   arch/x86/entry/syscalls/syscall_64.tbl
> >   include/uapi/asm-generic/unistd.h
> >
> > between commits:
> >
> >   63a96220ad45 ("arch: add split IPC system calls where needed")
> >   0bd4bb9c5612 ("y2038: add 64-bit time_t syscalls to all 32-bit architectures")
> >
> > from the y2038 tree and commit:
> >
> >   3d2991bc7a67 ("signal: add pidfd_send_signal() syscall")
> >
> > from the pidfd tree.
>
> This is now a conflict between the block, tip and pidfd trees.  The
> resolution now looks like below.

Checked it again, still looks good. Thanks,

    Arnd
