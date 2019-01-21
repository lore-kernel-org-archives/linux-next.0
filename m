From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: linux-next: manual merge of the pidfd tree with the y2038 tree
Date: Mon, 21 Jan 2019 18:16:22 +0100
Message-ID: <CAK8P3a0Yth+f8AANE6g8c_zE0Zt1CvCdzMDFK=pr8eNqmrBV0Q@mail.gmail.com>
References: <20190121143951.68956db3@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190121143951.68956db3@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Christian Brauner <christian@brauner.io>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Mon, Jan 21, 2019 at 4:40 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> Today's linux-next merge of the pidfd tree got conflicts in:
>
>   arch/x86/entry/syscalls/syscall_32.tbl
>   include/uapi/asm-generic/unistd.h
>
> between commit:
>
>   10a9a4dd92e6 ("arch: add split IPC system calls where needed")
>   b1788424aa2e ("y2038: add 64-bit time_t syscalls to all 32-bit architectures")
>
> from the y2038 tree and commit:
>
>   3d2991bc7a67 ("signal: add pidfd_send_signal() syscall")
>
> from the pidfd tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Hi Stephen,

>  +385   i386    io_pgetevents           sys_io_pgetevents_time32        __ia32_compat_sys_io_pgetevents
>   386   i386    rseq                    sys_rseq                        __ia32_sys_rseq
> + 387   i386    pidfd_send_signal       sys_pidfd_send_signal           __ia32_sys_pidfd_send_signal
>  +# room for arch specific syscalls
>  +393   i386    semget                  sys_semget                      __ia32_sys_semget
>  +394   i386    semctl                  sys_semctl                      __ia32_compat_sys_semctl

>   #define __NR_kexec_file_load 294
>   __SYSCALL(__NR_kexec_file_load,     sys_kexec_file_load)
> - /* 295 through 402 are unassigned to sync up with generic numbers */
> + #define __NR_pidfd_send_signal 295
> + __SYSCALL(__NR_pidfd_send_signal, sys_pidfd_send_signal)
> ++/* 296 through 402 are unassigned to sync up with generic numbers */
>  +#if __BITS_PER_LONG == 32
>  +#define __NR_clock_gettime64 403
>  +__SYSCALL(__NR_clock_gettime64, sys_clock_gettime)

If we merge my patches, then any other system calls should get numbers
above 423 on all architectures. Part of what I did in my branch was to
add all missing calls on architectures, and then move up to a common
number for the newly added ones. Your merge works correctly, but
it works against that idea by adding new numbers that conflict with
existing ones on other architectures, e.g. 387 is already assigned
on arm, microblaze, powerpc, and sh, and 294 is assigned almost
everywhere other than the asm-generic version.

      Arnd
