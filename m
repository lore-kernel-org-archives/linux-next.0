From: Michal Hocko <mhocko@suse.cz>
Subject: compaction tracepoint broken with CONFIG_COMPACTION enabled (was:
 mmotm 2015-01-16-15-50 uploaded)
Date: Mon, 19 Jan 2015 13:42:10 +0100
Message-ID: <20150119124210.GC21052@dhcp22.suse.cz>
References: <54b9a3ce.lQ94nh84G4XJawsQ%akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:53706 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751090AbbASMmM (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 19 Jan 2015 07:42:12 -0500
Content-Disposition: inline
In-Reply-To: <54b9a3ce.lQ94nh84G4XJawsQ%akpm@linux-foundation.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: akpm@linux-foundation.org, Joonsoo Kim <iamjoonsoo.kim@lge.com>
Cc: mm-commits@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-fsdevel@vger.kernel.org, linux-next@vger.kernel.org, sfr@canb.auug.org.au

Hi,
compaction trace points seem to be broken without CONFIG_COMPACTION
enabled after
mm-compaction-more-trace-to-understand-when-why-compaction-start-finish=
=2Epatch.

My config is
# CONFIG_COMPACTION is not set
CONFIG_CMA=3Dy

which might be a bit unusual but I am getting
  CC      mm/compaction.o
In file included from include/trace/define_trace.h:90:0,
                 from include/trace/events/compaction.h:298,
                 from mm/compaction.c:49:
include/trace/events/compaction.h: In function =E2=80=98ftrace_raw_outp=
ut_mm_compaction_end=E2=80=99:
include/trace/events/compaction.h:164:3: error: =E2=80=98compaction_sta=
tus_string=E2=80=99 undeclared (first use in this function)
   compaction_status_string[__entry->status])
   ^
[...]
include/trace/events/compaction.h: In function =E2=80=98ftrace_raw_outp=
ut_mm_compaction_suitable_template=E2=80=99:
include/trace/events/compaction.h:220:3: error: =E2=80=98compaction_sta=
tus_string=E2=80=99 undeclared (first use in this function)
   compaction_status_string[__entry->ret])
[...]
scripts/Makefile.build:257: recipe for target 'mm/compaction.o' failed
make[1]: *** [mm/compaction.o] Error 1
Makefile:1528: recipe for target 'mm/compaction.o' failed
make: *** [mm/compaction.o] Error 2

Moving compaction_status_string outside of CONFIG_COMPACTION doesn't
help much because of other failures:
include/trace/events/compaction.h:261:30: error: =E2=80=98struct zone=E2=
=80=99 has no member named =E2=80=98compact_defer_shift=E2=80=99
   __entry->defer_shift =3D zone->compact_defer_shift;

So I guess the tracepoint need a better fix.
--=20
Michal Hocko
SUSE Labs
