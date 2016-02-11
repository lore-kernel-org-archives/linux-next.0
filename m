From: Arnaldo Carvalho de Melo <acme@kernel.org>
Subject: Re: next-20160208 perf build =?utf-8?Q?err?=
 =?utf-8?Q?or_=22tests=2Fbp=5Fsignal=2Ec=3A106=3A47=3A_error=3A_declaratio?=
 =?utf-8?Q?n_of_=E2=80=98signal?= =?utf-8?B?4oCZ?= shadows a global
 declaration [-Werror=shadow]"
Date: Thu, 11 Feb 2016 19:21:21 -0300
Message-ID: <20160211222121.GK32168@kernel.org>
References: <CACKvgLFaZagkvRk1R2Xy0=UbWcfELgLxPbfjhRNZj-Rg4jSz4w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:58106 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751311AbcBKW6p (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 11 Feb 2016 17:58:45 -0500
Content-Disposition: inline
In-Reply-To: <CACKvgLFaZagkvRk1R2Xy0=UbWcfELgLxPbfjhRNZj-Rg4jSz4w@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Vinson Lee <vlee@freedesktop.org>
Cc: linux-next@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Wang Nan <wangnan0@huawei.com>, Jiri Olsa <jolsa@kernel.org>

Em Mon, Feb 08, 2016 at 10:28:53AM -0800, Vinson Lee escreveu:
> Hi.
>=20
> I hit this perf build error with next-20160208 with GCC 4.6.

I try to test on a rhel6 vm from time to time, need to do it using
docker or something, thanks for the report, but can you please send a
proper patch, with a:

=46ixes: 6a7d550e8b2e ("perf test: Check environment before start real =
BPF test")

Line, signed-off, etc?

Thanks,

- Arnaldo

=20
>   CC       tests/bp_signal.o
> tests/bp_signal.c: In function =E2=80=98__event=E2=80=99:
> tests/bp_signal.c:106:47: error: declaration of =E2=80=98signal=E2=80=
=99 shadows a
> global declaration [-Werror=3Dshadow]
> tests/bp_signal.c: In function =E2=80=98bp_event=E2=80=99:
> tests/bp_signal.c:144:37: error: declaration of =E2=80=98signal=E2=80=
=99 shadows a
> global declaration [-Werror=3Dshadow]
> tests/bp_signal.c: In function =E2=80=98wp_event=E2=80=99:
> tests/bp_signal.c:149:37: error: declaration of =E2=80=98signal=E2=80=
=99 shadows a
> global declaration [-Werror=3Dshadow]
>=20
> The build error is introduced with "perf test: Check environment
> before start real BPF test".
>=20
> commit 6a7d550e8b2eeb380ab85d9bc53571123b98345b
> Author: Wang Nan <wangnan0@huawei.com>
> Date:   Mon Jan 25 09:55:53 2016 +0000
>=20
>     perf test: Check environment before start real BPF test
>=20
>     Copying perf to old kernel system results:
>=20
>       # perf test bpf
>       37: Test BPF filter                                          :
>       37.1: Test basic BPF filtering                               : =
=46AILED!
>       37.2: Test BPF prologue generation                           : =
Skip
>=20
>     However, in case when kernel doesn't support a test case it shoul=
d
>     return 'Skip', 'FAILED!' should be reserved for kernel tests for =
when
>     the kernel supports a feature that then fails to work as advertis=
ed.
>=20
>     This patch checks environment before real testcase.
>=20
>     Signed-off-by: Wang Nan <wangnan0@huawei.com>
>     Suggested-by: Arnaldo Carvalho de Melo <acme@redhat.com>
>     Cc: Alexei Starovoitov <ast@kernel.org>
>     Cc: Brendan Gregg <brendan.d.gregg@gmail.com>
>     Cc: Daniel Borkmann <daniel@iogearbox.net>
>     Cc: He Kuang <hekuang@huawei.com>
>     Cc: Jiri Olsa <jolsa@kernel.org>
>     Cc: Li Zefan <lizefan@huawei.com>
>     Cc: Masami Hiramatsu <masami.hiramatsu.pt@hitachi.com>
>     Cc: Namhyung Kim <namhyung@kernel.org>
>     Cc: Peter Zijlstra <peterz@infradead.org>
>     Cc: Will Deacon <will.deacon@arm.com>
>     Cc: pi3orama@163.com
>     Link: http://lkml.kernel.org/r/1453715801-7732-7-git-send-email-w=
angnan0@huawei.com
>     Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>
>=20
> Cheers,
> Vinson
