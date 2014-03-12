From: Markos Chandras <Markos.Chandras@imgtec.com>
Subject: Re: [PATCH v2] samples/seccomp/Makefile: Do not build tests if cross-compiling
 for MIPS
Date: Wed, 12 Mar 2014 11:22:26 +0000
Message-ID: <53204372.1000400@imgtec.com>
References: <52FD0131.9040304@imgtec.com> <1392804917-29789-1-git-send-email-markos.chandras@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1392804917-29789-1-git-send-email-markos.chandras@imgtec.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-mips@linux-mips.org
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, akpm@linux-foundation.org
List-Id: linux-next.vger.kernel.org

On 02/19/2014 10:15 AM, Markos Chandras wrote:
> The Makefile is designed to use the host toolchain so it may be
> unsafe to build the tests if the kernel has been configured and built
> for another architecture. This fixes a build problem when the kernel =
has
> been configured and built for the MIPS architecture but the host is
> not MIPS (cross-compiled). The MIPS syscalls are only defined
> if one of the following is true:
>
> 1) _MIPS_SIM =3D=3D _MIPS_SIM_ABI64
> 2) _MIPS_SIM =3D=3D _MIPS_SIM_ABI32
> 3) _MIPS_SIM =3D=3D _MIPS_SIM_NABI32
>
> Of course, none of these make sense on a non-MIPS toolchain and the
> following build problem occurs when building on a non-MIPS host.
>
> linux/usr/include/linux/kexec.h:50:
> userspace cannot reference function or variable defined in the kernel
> samples/seccomp/bpf-direct.c: In function =E2=80=98emulator=E2=80=99:
> samples/seccomp/bpf-direct.c:76:17: error:
> =E2=80=98__NR_write=E2=80=99 undeclared (first use in this function)
>
> Cc: linux-next@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Reported-by: Paul Gortmaker <paul.gortmaker@windriver.com>
> Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
> ---
> This build problem is only reproducible on the linux-next tree at the=
 moment
>
> Changes since v1:
> - Rework code so native builds are allowed on MIPS
> ---
>   samples/seccomp/Makefile | 14 ++++++++++----
>   1 file changed, 10 insertions(+), 4 deletions(-)
>
> diff --git a/samples/seccomp/Makefile b/samples/seccomp/Makefile
> index 7203e66..855051b 100644
> --- a/samples/seccomp/Makefile
> +++ b/samples/seccomp/Makefile
> @@ -18,8 +18,8 @@ HOSTCFLAGS_bpf-direct.o +=3D -idirafter $(objtree)/=
include
>   bpf-direct-objs :=3D bpf-direct.o
>
>   # Try to match the kernel target.
> -ifndef CONFIG_64BIT
>   ifndef CROSS_COMPILE
> +ifndef CONFIG_64BIT
>
>   # s390 has -m31 flag to build 31 bit binaries
>   ifndef CONFIG_S390
> @@ -36,7 +36,13 @@ HOSTLOADLIBES_bpf-direct +=3D $(MFLAG)
>   HOSTLOADLIBES_bpf-fancy +=3D $(MFLAG)
>   HOSTLOADLIBES_dropper +=3D $(MFLAG)
>   endif
> -endif
> -
> -# Tell kbuild to always build the programs
>   always :=3D $(hostprogs-y)
> +else
> +# MIPS system calls are defined based on the -mabi that is passed
> +# to the toolchain which may or may not be a valid option
> +# for the host toolchain. So disable tests if target architecture
> +# is MIPS but the host isn't.
> +ifndef CONFIG_MIPS
> +always :=3D $(hostprogs-y)
> +endif
> +endif
>

CC'ing Andrew Morton as well

Ping? Is anyone willing to take this patch in his tree so we can restor=
e=20
the build for allyes/allmod configs for MIPS on linux-next?

--=20
markos
