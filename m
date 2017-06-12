From: Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH v1 2/2] selftests: kselftest_harness: Fix compile warning
Date: Sun, 11 Jun 2017 19:22:33 -0700
Message-ID: <CAGXu5jJEQ_sg_5Y1gzhnQd3qW+LdKwqNRAAznZwYwNd8JVj5-A@mail.gmail.com>
References: <20170611123258.19624-1-mic@digikod.net> <20170611123258.19624-3-mic@digikod.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-io0-f171.google.com ([209.85.223.171]:33945 "EHLO
        mail-io0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751967AbdFLCWf (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 11 Jun 2017 22:22:35 -0400
Received: by mail-io0-f171.google.com with SMTP id i7so49892692ioe.1
        for <linux-next@vger.kernel.org>; Sun, 11 Jun 2017 19:22:34 -0700 (PDT)
In-Reply-To: <20170611123258.19624-3-mic@digikod.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>
Cc: LKML <linux-kernel@vger.kernel.org>, Andy Lutomirski <luto@amacapital.net>, Shuah Khan <shuah@kernel.org>, Will Drewry <wad@chromium.org>, linux-kselftest@vger.kernel.org, Linux-Next <linux-next@vger.kernel.org>, Shuah Khan <shuahkh@osg.samsung.com>

On Sun, Jun 11, 2017 at 5:32 AM, Micka=C3=ABl Sala=C3=BCn <mic@digikod.net>=
 wrote:
> Do not confuse the compiler with a semicolon preceding a block. Replace
> the semicolon with an empty block to avoid a warning:
>
>   gcc -Wl,-no-as-needed -Wall -lpthread seccomp_bpf.c -o /.../linux/tools=
/testing/selftests/seccomp/seccomp_bpf
>   In file included from seccomp_bpf.c:40:0:
>   seccomp_bpf.c: In function =E2=80=98change_syscall=E2=80=99:
>   ../kselftest_harness.h:558:2: warning: this =E2=80=98for=E2=80=99 claus=
e does not guard... [-Wmisleading-indentation]
>     for (; _metadata->trigger;  _metadata->trigger =3D __bail(_assert))
>     ^
>   ../kselftest_harness.h:574:14: note: in expansion of macro =E2=80=98OPT=
IONAL_HANDLER=E2=80=99
>    } while (0); OPTIONAL_HANDLER(_assert)
>                 ^~~~~~~~~~~~~~~~
>   ../kselftest_harness.h:440:2: note: in expansion of macro =E2=80=98__EX=
PECT=E2=80=99
>     __EXPECT(expected, seen, =3D=3D, 0)
>     ^~~~~~~~
>   seccomp_bpf.c:1313:2: note: in expansion of macro =E2=80=98EXPECT_EQ=E2=
=80=99
>     EXPECT_EQ(0, ret);
>     ^~~~~~~~~
>   seccomp_bpf.c:1317:2: note: ...this statement, but the latter is mislea=
dingly indented as if it is guarded by the =E2=80=98for=E2=80=99
>     {
>     ^
>
> Signed-off-by: Micka=C3=ABl Sala=C3=BCn <mic@digikod.net>
> Cc: Andy Lutomirski <luto@amacapital.net>
> Cc: Kees Cook <keescook@chromium.org>
> Cc: Shuah Khan <shuahkh@osg.samsung.com>
> Cc: Will Drewry <wad@chromium.org>

Eek, thanks for catching that. :)

Acked-by: Kees Cook <keescook@chromium.org>

-Kees

> ---
>  tools/testing/selftests/seccomp/seccomp_bpf.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tools/testing/selftests/seccomp/seccomp_bpf.c b/tools/testin=
g/selftests/seccomp/seccomp_bpf.c
> index 7ba94efb24fd..18dad07ae16b 100644
> --- a/tools/testing/selftests/seccomp/seccomp_bpf.c
> +++ b/tools/testing/selftests/seccomp/seccomp_bpf.c
> @@ -1310,7 +1310,7 @@ void change_syscall(struct __test_metadata *_metada=
ta,
>         iov.iov_len =3D sizeof(regs);
>         ret =3D ptrace(PTRACE_GETREGSET, tracee, NT_PRSTATUS, &iov);
>  #endif
> -       EXPECT_EQ(0, ret);
> +       EXPECT_EQ(0, ret) {}
>
>  #if defined(__x86_64__) || defined(__i386__) || defined(__powerpc__) || =
\
>      defined(__s390__) || defined(__hppa__)
> --
> 2.11.0
>



--=20
Kees Cook
Pixel Security
