From: Vinson Lee <vlee@freedesktop.org>
Subject: =?UTF-8?Q?next=2D20160208_perf_build_error_=22tests=2Fbp=5Fsignal=2Ec=3A10?=
	=?UTF-8?Q?6=3A47=3A_error=3A_declaration_of_=E2=80=98signal=E2=80=99_shadows_a_global_de?=
	=?UTF-8?Q?claration_=5B=2DWerror=3Dshadow=5D=22?=
Date: Mon, 8 Feb 2016 10:28:53 -0800
Message-ID: <CACKvgLFaZagkvRk1R2Xy0=UbWcfELgLxPbfjhRNZj-Rg4jSz4w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-io0-f179.google.com ([209.85.223.179]:35317 "EHLO
	mail-io0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752400AbcBHS3d convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 8 Feb 2016 13:29:33 -0500
Received: by mail-io0-f179.google.com with SMTP id d63so204472561ioj.2
        for <linux-next@vger.kernel.org>; Mon, 08 Feb 2016 10:29:33 -0800 (PST)
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Wang Nan <wangnan0@huawei.com>, Jiri Olsa <jolsa@kernel.org>

Hi.

I hit this perf build error with next-20160208 with GCC 4.6.

  CC       tests/bp_signal.o
tests/bp_signal.c: In function =E2=80=98__event=E2=80=99:
tests/bp_signal.c:106:47: error: declaration of =E2=80=98signal=E2=80=99=
 shadows a
global declaration [-Werror=3Dshadow]
tests/bp_signal.c: In function =E2=80=98bp_event=E2=80=99:
tests/bp_signal.c:144:37: error: declaration of =E2=80=98signal=E2=80=99=
 shadows a
global declaration [-Werror=3Dshadow]
tests/bp_signal.c: In function =E2=80=98wp_event=E2=80=99:
tests/bp_signal.c:149:37: error: declaration of =E2=80=98signal=E2=80=99=
 shadows a
global declaration [-Werror=3Dshadow]

The build error is introduced with "perf test: Check environment
before start real BPF test".

commit 6a7d550e8b2eeb380ab85d9bc53571123b98345b
Author: Wang Nan <wangnan0@huawei.com>
Date:   Mon Jan 25 09:55:53 2016 +0000

    perf test: Check environment before start real BPF test

    Copying perf to old kernel system results:

      # perf test bpf
      37: Test BPF filter                                          :
      37.1: Test basic BPF filtering                               : FA=
ILED!
      37.2: Test BPF prologue generation                           : Sk=
ip

    However, in case when kernel doesn't support a test case it should
    return 'Skip', 'FAILED!' should be reserved for kernel tests for wh=
en
    the kernel supports a feature that then fails to work as advertised=
=2E

    This patch checks environment before real testcase.

    Signed-off-by: Wang Nan <wangnan0@huawei.com>
    Suggested-by: Arnaldo Carvalho de Melo <acme@redhat.com>
    Cc: Alexei Starovoitov <ast@kernel.org>
    Cc: Brendan Gregg <brendan.d.gregg@gmail.com>
    Cc: Daniel Borkmann <daniel@iogearbox.net>
    Cc: He Kuang <hekuang@huawei.com>
    Cc: Jiri Olsa <jolsa@kernel.org>
    Cc: Li Zefan <lizefan@huawei.com>
    Cc: Masami Hiramatsu <masami.hiramatsu.pt@hitachi.com>
    Cc: Namhyung Kim <namhyung@kernel.org>
    Cc: Peter Zijlstra <peterz@infradead.org>
    Cc: Will Deacon <will.deacon@arm.com>
    Cc: pi3orama@163.com
    Link: http://lkml.kernel.org/r/1453715801-7732-7-git-send-email-wan=
gnan0@huawei.com
    Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>

Cheers,
Vinson
