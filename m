From: Josh Poimboeuf <jpoimboe@redhat.com>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
Date: Wed, 15 Jun 2016 09:03:11 -0500
Message-ID: <20160615140311.l2s7pkxuvybskcbc@treble>
References: <20160506145810.04a319d3@canb.auug.org.au>
 <20160505224429.3b8f3837bcb0281932cfe03f@linux-foundation.org>
 <1465983212.9515.35.camel@tiscali.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:46337 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932698AbcFOODO (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 15 Jun 2016 10:03:14 -0400
Content-Disposition: inline
In-Reply-To: <1465983212.9515.35.camel@tiscali.nl>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Bolle <pebolle@tiscali.nl>
Cc: Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Jun 15, 2016 at 11:33:32AM +0200, Paul Bolle wrote:
> On do, 2016-05-05 at 22:44 -0700, Andrew Morton wrote:
> > From: Arnd Bergmann <arnd@arndb.de>
> > Subject: byteswap: try to avoid __builtin_constant_p gcc bug
> >=20
> > This is another attempt to avoid a regression in wwn_to_u64() after=
 that
> > started using get_unaligned_be64(), which in turn ran into a bug on
> > gcc-4.9 through 6.1.
> >=20
> > The regression got introduced due to the combination of two separat=
e
> > workarounds (e3bde9568d99 ("include/linux/unaligned: force inlining=
 of
> > byteswap operations") and ef3fb2422ffe ("scsi: fc: use get/put_unal=
igned64
> > for wwn access")) that each try to sidestep distinct problems with =
gcc
> > behavior (code growth and increased stack usage).  Unfortunately af=
ter
> > both have been applied, a more serious gcc bug has been uncovered, =
leading
> > to incorrect object code that discards part of a function and cause=
s
> > undefined behavior.
> >=20
> > As part of this problem is how __builtin_constant_p gets evaluated =
on an
> > argument passed by reference into an inline function, this avoids t=
he use
> > of __builtin_constant_p() for all architectures that set
> > CONFIG_ARCH_USE_BUILTIN_BSWAP.  Most architectures do not set
> > ARCH_SUPPORTS_OPTIMIZED_INLINING, which means they probably do not =
suffer
> > from the problem in the qla2xxx driver, but they might still run in=
to it
> > elsewhere.
> >=20
> > Both of the original workarounds were only merged in the 4.6 kernel=
, and
> > the bug that is fixed by this patch should only appear if both are =
there,
> > so we probably don't need to backport the fix.  On the other hand, =
it
> > works by simplifying the code path and should not have any negative
> > effects.
> >=20
> > [arnd@arndb.de: fix older gcc warnings]
> >   (http://lkml.kernel.org/r/12243652.bxSxEgjgfk@wuerfel)
> > Link: https://lkml.org/lkml/headers/2016/4/12/1103
> > Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D66122
> > Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D70232
> > Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D70646
> > Fixes: e3bde9568d99 ("include/linux/unaligned: force inlining of by=
teswap operations")
> > Fixes: ef3fb2422ffe ("scsi: fc: use get/put_unaligned64 for wwn acc=
ess")
> > Link: http://lkml.kernel.org/r/1780465.XdtPJpi8Tt@wuerfel
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> > Reviewed-by: Josh Poimboeuf <jpoimboe@redhat.com>
> > Tested-by: Josh Poimboeuf <jpoimboe@redhat.com> # on gcc-5.3
> > Tested-by: Quinn Tran <quinn.tran@qlogic.com>
> > Cc: Martin Jambor <mjambor@suse.cz>
> > Cc: "Martin K. Petersen" <martin.petersen@oracle.com>
> > Cc: James Bottomley <James.Bottomley@hansenpartnership.com>
> > Cc: Denys Vlasenko <dvlasenk@redhat.com>
> > Cc: Thomas Graf <tgraf@suug.ch>
> > Cc: Peter Zijlstra <peterz@infradead.org>
> > Cc: David Rientjes <rientjes@google.com>
> > Cc: Ingo Molnar <mingo@kernel.org>
> > Cc: Himanshu Madhani <himanshu.madhani@qlogic.com>
> > Cc: Jan Hubicka <hubicka@ucw.cz>
> > Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
>=20
> This became commit 7322dd755e7d ("byteswap: try to avoid
> __builtin_constant_p gcc bug"). That commit was included in v4.6-rc7.
> Ever since that rc I see this warning when building for x86_64:
>     net/netfilter/ipvs/ip_vs_sync.c: In function =E2=80=98ip_vs_proc_=
sync_conn=E2=80=99:
>     net/netfilter/ipvs/ip_vs_sync.c:1069:33: warning: =E2=80=98opt.in=
it_seq=E2=80=99 may be used uninitialized in this function [-Wmaybe-uni=
nitialized]
>       struct ip_vs_sync_conn_options opt;
>                                      ^
>     net/netfilter/ipvs/ip_vs_sync.c:1069:33: warning: =E2=80=98opt.de=
lta=E2=80=99 may be used uninitialized in this function [-Wmaybe-uninit=
ialized]
>     net/netfilter/ipvs/ip_vs_sync.c:1069:33: warning: =E2=80=98opt.pr=
evious_delta=E2=80=99 may be used uninitialized in this function [-Wmay=
be-uninitialized]
>     net/netfilter/ipvs/ip_vs_sync.c:1069:33: warning: =E2=80=98*((voi=
d *)&opt+12).init_seq=E2=80=99 may be used uninitialized in this functi=
on [-Wmaybe-uninitialized]
>     net/netfilter/ipvs/ip_vs_sync.c:1069:33: warning: =E2=80=98*((voi=
d *)&opt+12).delta=E2=80=99 may be used uninitialized in this function =
[-Wmaybe-uninitialized]
>     net/netfilter/ipvs/ip_vs_sync.c:1069:33: warning: =E2=80=98*((voi=
d *)&opt+12).previous_delta=E2=80=99 may be used uninitialized in this =
function [-Wmaybe-uninitialized]
>=20
> (It doesn't show up when building for 32 bits x86. Perhaps there's an
> int/long mismatch somewhere in the related code.)
>=20
> Anyone else seeing this?=20
>=20
> It looks like a false positive. I can make it disappear by making sur=
e
> ip_vs_proc_seqopt() isn't inlined. But that's not something I dare to
> put into a patch for a false positive. Anyone sitting on a better fix=
?

Hi Paul,

I agree it looks like a false positive, though the code is a bit
convoluted, so I'm not surprised that gcc might get confused.  How abou=
t
initializing opt to 0?

diff --git a/net/netfilter/ipvs/ip_vs_sync.c b/net/netfilter/ipvs/ip_vs=
_sync.c
index 803001a..f45496c 100644
--- a/net/netfilter/ipvs/ip_vs_sync.c
+++ b/net/netfilter/ipvs/ip_vs_sync.c
@@ -1066,7 +1066,7 @@ static int ip_vs_proc_str(__u8 *p, unsigned int p=
len, unsigned int *data_len,
  */
 static inline int ip_vs_proc_sync_conn(struct netns_ipvs *ipvs, __u8 *=
p, __u8 *msg_end)
 {
-	struct ip_vs_sync_conn_options opt;
+	struct ip_vs_sync_conn_options opt =3D {0};
 	union  ip_vs_sync_conn *s;
 	struct ip_vs_protocol *pp;
 	struct ip_vs_conn_param param;

--=20
Josh
