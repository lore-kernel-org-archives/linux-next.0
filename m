From: Vinson Lee <vlee@twopensource.com>
Subject: =?UTF-8?Q?next=2D20151007_perf_build_error_=22tools=2Finclude=2Flinux=2F?=
	=?UTF-8?Q?compiler=2Eh=3A66=3A_error=3A_dereferencing_pointer_=E2=80=98res=2E41=E2=80=99_doe?=
	=?UTF-8?Q?s_break_strict=2Daliasing_rules=22?=
Date: Wed, 7 Oct 2015 11:28:26 -0700
Message-ID: <CAHTgTXXzH7id6qrpG1qvR8BsKPjny4+kjcvnA1zS6OaMx-+TtA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-lb0-f174.google.com ([209.85.217.174]:34681 "EHLO
	mail-lb0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751348AbbJGS22 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 7 Oct 2015 14:28:28 -0400
Received: by lbbwt4 with SMTP id wt4so21441866lbb.1
        for <linux-next@vger.kernel.org>; Wed, 07 Oct 2015 11:28:27 -0700 (PDT)
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org, Peter Zijlstra <a.p.zijlstra@chello.nl>, Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Andi Kleen <ak@linux.intel.com>, Adrian Hunter <adrian.hunter@intel.com>, Jiri Olsa <jolsa@kernel.org>, Rabin Vincent <rabin@rab.in>, =?UTF-8?Q?Martin_Li=C5=A1ka?= <mliska@suse.cz>

Hi.

I hit this perf build error with next-20151007 with GCC 4.4.

  CC       util/annotate.o
cc1: warnings being treated as errors
util/annotate.c: In function =E2=80=98disasm__purge=E2=80=99:
linux-next/tools/include/linux/compiler.h:66: error: dereferencing
pointer =E2=80=98res.41=E2=80=99 does break strict-aliasing rules
linux-next/tools/include/linux/compiler.h:66: note: initialized from he=
re
util/annotate.c: In function =E2=80=98symbol__annotate=E2=80=99:
linux-next/tools/include/linux/compiler.h:66: error: dereferencing
pointer =E2=80=98res.41=E2=80=99 does break strict-aliasing rules
linux-next/tools/include/linux/compiler.h:66: note: initialized from he=
re
linux-next/tools/include/linux/compiler.h:52: error: dereferencing
pointer =E2=80=98res.32=E2=80=99 does break strict-aliasing rules
linux-next/tools/include/linux/compiler.h:52: note: initialized from he=
re

Cheers,
Vinson
