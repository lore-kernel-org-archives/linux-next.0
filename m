From: Arnaldo Carvalho de Melo <acme@kernel.org>
Subject: Re: next-20151007 perf build =?utf-8?Q?err?=
 =?utf-8?Q?or_=22tools=2Finclude=2Flinux=2Fcompiler=2Eh=3A66=3A_error=3A_d?=
 =?utf-8?Q?ereferencing_pointer_=E2=80=98res=2E41?= =?utf-8?B?4oCZ?= does
 break strict-aliasing rules"
Date: Wed, 7 Oct 2015 15:47:32 -0300
Message-ID: <20151007184732.GF14409@kernel.org>
References: <CAHTgTXXzH7id6qrpG1qvR8BsKPjny4+kjcvnA1zS6OaMx-+TtA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:48965 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750987AbbJGSrg (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 7 Oct 2015 14:47:36 -0400
Content-Disposition: inline
In-Reply-To: <CAHTgTXXzH7id6qrpG1qvR8BsKPjny4+kjcvnA1zS6OaMx-+TtA@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Vinson Lee <vlee@twopensource.com>
Cc: linux-next@vger.kernel.org, Peter Zijlstra <a.p.zijlstra@chello.nl>, Ingo Molnar <mingo@redhat.com>, Andi Kleen <ak@linux.intel.com>, Adrian Hunter <adrian.hunter@intel.com>, Jiri Olsa <jolsa@kernel.org>, Rabin Vincent <rabin@rab.in>, Martin =?utf-8?B?TGnFoWth?= <mliska@suse.cz>

Em Wed, Oct 07, 2015 at 11:28:26AM -0700, Vinson Lee escreveu:
> Hi.
>=20
> I hit this perf build error with next-20151007 with GCC 4.4.

Will check.
=20
>   CC       util/annotate.o
> cc1: warnings being treated as errors
> util/annotate.c: In function =E2=80=98disasm__purge=E2=80=99:
> linux-next/tools/include/linux/compiler.h:66: error: dereferencing
> pointer =E2=80=98res.41=E2=80=99 does break strict-aliasing rules
> linux-next/tools/include/linux/compiler.h:66: note: initialized from =
here
> util/annotate.c: In function =E2=80=98symbol__annotate=E2=80=99:
> linux-next/tools/include/linux/compiler.h:66: error: dereferencing
> pointer =E2=80=98res.41=E2=80=99 does break strict-aliasing rules
> linux-next/tools/include/linux/compiler.h:66: note: initialized from =
here
> linux-next/tools/include/linux/compiler.h:52: error: dereferencing
> pointer =E2=80=98res.32=E2=80=99 does break strict-aliasing rules
> linux-next/tools/include/linux/compiler.h:52: note: initialized from =
here
>=20
> Cheers,
> Vinson
