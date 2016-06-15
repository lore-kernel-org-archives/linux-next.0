From: Paul Bolle <pebolle@tiscali.nl>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
Date: Wed, 15 Jun 2016 11:33:32 +0200
Message-ID: <1465983212.9515.35.camel@tiscali.nl>
References: <20160506145810.04a319d3@canb.auug.org.au>
	 <20160505224429.3b8f3837bcb0281932cfe03f@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from lb2-smtp-cloud3.xs4all.net ([194.109.24.26]:34706 "EHLO
	lb2-smtp-cloud3.xs4all.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S932485AbcFOJdg (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Wed, 15 Jun 2016 05:33:36 -0400
In-Reply-To: <20160505224429.3b8f3837bcb0281932cfe03f@linux-foundation.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On do, 2016-05-05 at 22:44 -0700, Andrew Morton wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> Subject: byteswap: try to avoid __builtin_constant_p gcc bug
>=20
> This is another attempt to avoid a regression in wwn_to_u64() after t=
hat
> started using get_unaligned_be64(), which in turn ran into a bug on
> gcc-4.9 through 6.1.
>=20
> The regression got introduced due to the combination of two separate
> workarounds (e3bde9568d99 ("include/linux/unaligned: force inlining o=
f
> byteswap operations") and ef3fb2422ffe ("scsi: fc: use get/put_unalig=
ned64
> for wwn access")) that each try to sidestep distinct problems with gc=
c
> behavior (code growth and increased stack usage).  Unfortunately afte=
r
> both have been applied, a more serious gcc bug has been uncovered, le=
ading
> to incorrect object code that discards part of a function and causes
> undefined behavior.
>=20
> As part of this problem is how __builtin_constant_p gets evaluated on=
 an
> argument passed by reference into an inline function, this avoids the=
 use
> of __builtin_constant_p() for all architectures that set
> CONFIG_ARCH_USE_BUILTIN_BSWAP.  Most architectures do not set
> ARCH_SUPPORTS_OPTIMIZED_INLINING, which means they probably do not su=
ffer
> from the problem in the qla2xxx driver, but they might still run into=
 it
> elsewhere.
>=20
> Both of the original workarounds were only merged in the 4.6 kernel, =
and
> the bug that is fixed by this patch should only appear if both are th=
ere,
> so we probably don't need to backport the fix.  On the other hand, it
> works by simplifying the code path and should not have any negative
> effects.
>=20
> [arnd@arndb.de: fix older gcc warnings]
>   (http://lkml.kernel.org/r/12243652.bxSxEgjgfk@wuerfel)
> Link: https://lkml.org/lkml/headers/2016/4/12/1103
> Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D66122
> Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D70232
> Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D70646
> Fixes: e3bde9568d99 ("include/linux/unaligned: force inlining of byte=
swap operations")
> Fixes: ef3fb2422ffe ("scsi: fc: use get/put_unaligned64 for wwn acces=
s")
> Link: http://lkml.kernel.org/r/1780465.XdtPJpi8Tt@wuerfel
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> Reviewed-by: Josh Poimboeuf <jpoimboe@redhat.com>
> Tested-by: Josh Poimboeuf <jpoimboe@redhat.com> # on gcc-5.3
> Tested-by: Quinn Tran <quinn.tran@qlogic.com>
> Cc: Martin Jambor <mjambor@suse.cz>
> Cc: "Martin K. Petersen" <martin.petersen@oracle.com>
> Cc: James Bottomley <James.Bottomley@hansenpartnership.com>
> Cc: Denys Vlasenko <dvlasenk@redhat.com>
> Cc: Thomas Graf <tgraf@suug.ch>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: David Rientjes <rientjes@google.com>
> Cc: Ingo Molnar <mingo@kernel.org>
> Cc: Himanshu Madhani <himanshu.madhani@qlogic.com>
> Cc: Jan Hubicka <hubicka@ucw.cz>
> Signed-off-by: Andrew Morton <akpm@linux-foundation.org>

This became commit 7322dd755e7d ("byteswap: try to avoid
__builtin_constant_p gcc bug"). That commit was included in v4.6-rc7.
Ever since that rc I see this warning when building for x86_64:
    net/netfilter/ipvs/ip_vs_sync.c: In function =E2=80=98ip_vs_proc_sy=
nc_conn=E2=80=99:
    net/netfilter/ipvs/ip_vs_sync.c:1069:33: warning: =E2=80=98opt.init=
_seq=E2=80=99 may be used uninitialized in this function [-Wmaybe-unini=
tialized]
      struct ip_vs_sync_conn_options opt;
                                     ^
    net/netfilter/ipvs/ip_vs_sync.c:1069:33: warning: =E2=80=98opt.delt=
a=E2=80=99 may be used uninitialized in this function [-Wmaybe-uninitia=
lized]
    net/netfilter/ipvs/ip_vs_sync.c:1069:33: warning: =E2=80=98opt.prev=
ious_delta=E2=80=99 may be used uninitialized in this function [-Wmaybe=
-uninitialized]
    net/netfilter/ipvs/ip_vs_sync.c:1069:33: warning: =E2=80=98*((void =
*)&opt+12).init_seq=E2=80=99 may be used uninitialized in this function=
 [-Wmaybe-uninitialized]
    net/netfilter/ipvs/ip_vs_sync.c:1069:33: warning: =E2=80=98*((void =
*)&opt+12).delta=E2=80=99 may be used uninitialized in this function [-=
Wmaybe-uninitialized]
    net/netfilter/ipvs/ip_vs_sync.c:1069:33: warning: =E2=80=98*((void =
*)&opt+12).previous_delta=E2=80=99 may be used uninitialized in this fu=
nction [-Wmaybe-uninitialized]

(It doesn't show up when building for 32 bits x86. Perhaps there's an
int/long mismatch somewhere in the related code.)

Anyone else seeing this?=20

It looks like a false positive. I can make it disappear by making sure
ip_vs_proc_seqopt() isn't inlined. But that's not something I dare to
put into a patch for a false positive. Anyone sitting on a better fix?


Paul Bolle
