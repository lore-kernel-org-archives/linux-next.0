From: Vlastimil Babka <vbabka@suse.cz>
Subject: Re: compaction tracepoint broken with CONFIG_COMPACTION enabled
Date: Mon, 19 Jan 2015 15:38:34 +0100
Message-ID: <54BD16EA.9050007@suse.cz>
References: <54b9a3ce.lQ94nh84G4XJawsQ%akpm@linux-foundation.org> <20150119124210.GC21052@dhcp22.suse.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Return-path: <owner-linux-mm@kvack.org>
In-Reply-To: <20150119124210.GC21052@dhcp22.suse.cz>
Sender: owner-linux-mm@kvack.org
To: Michal Hocko <mhocko@suse.cz>, akpm@linux-foundation.org, Joonsoo Kim <iamjoonsoo.kim@lge.com>
Cc: mm-commits@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-fsdevel@vger.kernel.org, linux-next@vger.kernel.org, sfr@canb.auug.org.au
List-Id: linux-next.vger.kernel.org

On 01/19/2015 01:42 PM, Michal Hocko wrote:
> Hi,
> compaction trace points seem to be broken without CONFIG_COMPACTION
> enabled after
> mm-compaction-more-trace-to-understand-when-why-compaction-start-finish=
.patch.
>=20
> My config is
> # CONFIG_COMPACTION is not set
> CONFIG_CMA=3Dy

Joonsoo posted a V4 that should be fixed at least according to descriptio=
n -
unfortunately it wasn't just fixes on top of what's in mmotm, though.

> which might be a bit unusual but I am getting
>   CC      mm/compaction.o
> In file included from include/trace/define_trace.h:90:0,
>                  from include/trace/events/compaction.h:298,
>                  from mm/compaction.c:49:
> include/trace/events/compaction.h: In function =E2=80=98ftrace_raw_outp=
ut_mm_compaction_end=E2=80=99:
> include/trace/events/compaction.h:164:3: error: =E2=80=98compaction_sta=
tus_string=E2=80=99 undeclared (first use in this function)
>    compaction_status_string[__entry->status])
>    ^
> [...]
> include/trace/events/compaction.h: In function =E2=80=98ftrace_raw_outp=
ut_mm_compaction_suitable_template=E2=80=99:
> include/trace/events/compaction.h:220:3: error: =E2=80=98compaction_sta=
tus_string=E2=80=99 undeclared (first use in this function)
>    compaction_status_string[__entry->ret])
> [...]
> scripts/Makefile.build:257: recipe for target 'mm/compaction.o' failed
> make[1]: *** [mm/compaction.o] Error 1
> Makefile:1528: recipe for target 'mm/compaction.o' failed
> make: *** [mm/compaction.o] Error 2
>=20
> Moving compaction_status_string outside of CONFIG_COMPACTION doesn't
> help much because of other failures:
> include/trace/events/compaction.h:261:30: error: =E2=80=98struct zone=E2=
=80=99 has no member named =E2=80=98compact_defer_shift=E2=80=99
>    __entry->defer_shift =3D zone->compact_defer_shift;
>=20
> So I guess the tracepoint need a better fix.
>=20

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=3Dmailto:"dont@kvack.org"> email@kvack.org </a>
