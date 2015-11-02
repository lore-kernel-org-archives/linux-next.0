From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: Tree for Nov 2
Date: Mon, 2 Nov 2015 17:30:23 +1100
Message-ID: <20151102173023.52237c7f@canb.auug.org.au>
References: <20151102154017.6817486c@canb.auug.org.au>
	<20151102055816.GA434@swordfish>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:48194 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751483AbbKBGa3 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 2 Nov 2015 01:30:29 -0500
In-Reply-To: <20151102055816.GA434@swordfish>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Cc: Steven Rostedt <rostedt@goodmis.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>

Hi Sergey,

[Excess quoted for new cc's]

On Mon, 2 Nov 2015 14:58:16 +0900 Sergey Senozhatsky <sergey.senozhatsk=
y.work@gmail.com> wrote:
>
> unregister_trace_sched_switch/register_trace_prio_sched_switch/etc.
> (see the log below. 80-cols unfriendly. sorry.)
> expect proto to contain 'bool preempt'
>=20
> TRACE_EVENT(sched_switch,
>=20
>         TP_PROTO(bool preempt,
>                  struct task_struct *prev,
>                  struct task_struct *next),
>=20
>=20
> event_filter_pid_sched_switch_probe_post() and
> event_filter_pid_sched_switch_probe_pre() are missing it.
> which results in:
>=20
> kernel/trace/trace_events.c: In function =E2=80=98__ftrace_clear_even=
t_pids=E2=80=99:
> kernel/trace/trace_events.c:579:32: warning: passing argument 1 of =E2=
=80=98unregister_trace_sched_switch=E2=80=99 from incompatible pointer =
type [-Wincompatible-pointer-types]
>   unregister_trace_sched_switch(event_filter_pid_sched_switch_probe_p=
re, tr);
>                                 ^
> In file included from include/trace/events/sched.h:8:0,
>                  from kernel/trace/trace_events.c:25:
> include/linux/tracepoint.h:223:2: note: expected =E2=80=98void (*)(vo=
id *, bool,  struct task_struct *, struct task_struct *) {aka void (*)(=
void *, _Bool,  struct task_struct *, struct task_struct *)}=E2=80=99 b=
ut argument is of type =E2=80=98void (*)(void *, struct task_struct *, =
struct task_struct *)=E2=80=99
>   unregister_trace_##name(void (*probe)(data_proto), void *data) \
>   ^
> include/linux/tracepoint.h:357:3: note: in expansion of macro =E2=80=98=
__DECLARE_TRACE=E2=80=99
>    __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args), 1, \
>    ^
> include/linux/tracepoint.h:491:2: note: in expansion of macro =E2=80=98=
DECLARE_TRACE=E2=80=99
>   DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
>   ^
> include/trace/events/sched.h:124:1: note: in expansion of macro =E2=80=
=98TRACE_EVENT=E2=80=99
>  TRACE_EVENT(sched_switch,
>  ^
> kernel/trace/trace_events.c:580:32: warning: passing argument 1 of =E2=
=80=98unregister_trace_sched_switch=E2=80=99 from incompatible pointer =
type [-Wincompatible-pointer-types]
>   unregister_trace_sched_switch(event_filter_pid_sched_switch_probe_p=
ost, tr);
>                                 ^
> In file included from include/trace/events/sched.h:8:0,
>                  from kernel/trace/trace_events.c:25:
> include/linux/tracepoint.h:223:2: note: expected =E2=80=98void (*)(vo=
id *, bool,  struct task_struct *, struct task_struct *) {aka void (*)(=
void *, _Bool,  struct task_struct *, struct task_struct *)}=E2=80=99 b=
ut argument is of type =E2=80=98void (*)(void *, struct task_struct *, =
struct task_struct *)=E2=80=99
>   unregister_trace_##name(void (*probe)(data_proto), void *data) \
>   ^
> include/linux/tracepoint.h:357:3: note: in expansion of macro =E2=80=98=
__DECLARE_TRACE=E2=80=99
>    __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args), 1, \
>    ^
> include/linux/tracepoint.h:491:2: note: in expansion of macro =E2=80=98=
DECLARE_TRACE=E2=80=99
>   DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
>   ^
> include/trace/events/sched.h:124:1: note: in expansion of macro =E2=80=
=98TRACE_EVENT=E2=80=99
>  TRACE_EVENT(sched_switch,
>  ^
> kernel/trace/trace_events.c: In function =E2=80=98ftrace_event_pid_wr=
ite=E2=80=99:
> kernel/trace/trace_events.c:1723:36: warning: passing argument 1 of =E2=
=80=98register_trace_prio_sched_switch=E2=80=99 from incompatible point=
er type [-Wincompatible-pointer-types]
>    register_trace_prio_sched_switch(event_filter_pid_sched_switch_pro=
be_pre,
>                                     ^
> In file included from include/trace/events/sched.h:8:0,
>                  from kernel/trace/trace_events.c:25:
> include/linux/tracepoint.h:216:2: note: expected =E2=80=98void (*)(vo=
id *, bool,  struct task_struct *, struct task_struct *) {aka void (*)(=
void *, _Bool,  struct task_struct *, struct task_struct *)}=E2=80=99 b=
ut argument is of type =E2=80=98void (*)(void *, struct task_struct *, =
struct task_struct *)=E2=80=99
>   register_trace_prio_##name(void (*probe)(data_proto), void *data,\
>   ^
> include/linux/tracepoint.h:357:3: note: in expansion of macro =E2=80=98=
__DECLARE_TRACE=E2=80=99
>    __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args), 1, \
>    ^
> include/linux/tracepoint.h:491:2: note: in expansion of macro =E2=80=98=
DECLARE_TRACE=E2=80=99
>   DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
>   ^
> include/trace/events/sched.h:124:1: note: in expansion of macro =E2=80=
=98TRACE_EVENT=E2=80=99
>  TRACE_EVENT(sched_switch,
>  ^
> kernel/trace/trace_events.c:1725:36: warning: passing argument 1 of =E2=
=80=98register_trace_prio_sched_switch=E2=80=99 from incompatible point=
er type [-Wincompatible-pointer-types]
>    register_trace_prio_sched_switch(event_filter_pid_sched_switch_pro=
be_post,
>                                     ^
> In file included from include/trace/events/sched.h:8:0,
>                  from kernel/trace/trace_events.c:25:
> include/linux/tracepoint.h:216:2: note: expected =E2=80=98void (*)(vo=
id *, bool,  struct task_struct *, struct task_struct *) {aka void (*)(=
void *, _Bool,  struct task_struct *, struct task_struct *)}=E2=80=99 b=
ut argument is of type =E2=80=98void (*)(void *, struct task_struct *, =
struct task_struct *)=E2=80=99
>   register_trace_prio_##name(void (*probe)(data_proto), void *data,\
>   ^
> include/linux/tracepoint.h:357:3: note: in expansion of macro =E2=80=98=
__DECLARE_TRACE=E2=80=99
>    __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args), 1, \
>    ^
> include/linux/tracepoint.h:491:2: note: in expansion of macro =E2=80=98=
DECLARE_TRACE=E2=80=99
>   DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
>   ^
> include/trace/events/sched.h:124:1: note: in expansion of macro =E2=80=
=98TRACE_EVENT=E2=80=99
>  TRACE_EVENT(sched_switch,

Presumably caused by the interaction of commit

  3fdaf80f4a83 ("tracing: Implement event pid filtering")

from the trace tree and commit

  c73464b1c843 ("sched/core: Fix trace_sched_switch()")

from the tip tree.

> something like this, I guess.
>=20
> =3D=3D=3D8<=3D=3D=3D8<=3D=3D=3D8<=3D=3D=3D8<=3D=3D=3D
>=20
> Add missing 'bool preempt' argument as required by
> sched_switch's trace event proto:
>=20
> : TRACE_EVENT(sched_switch,
> :
> :         TP_PROTO(bool preempt,
> :                  struct task_struct *prev,
> :                  struct task_struct *next),
> ...
>=20
> to event_filter_pid_sched_switch_probe_post() and
> event_filter_pid_sched_switch_probe_pre() functions.
>=20
> kernel/trace/trace_events.c: In function =E2=80=98__ftrace_clear_even=
t_pids=E2=80=99:
> kernel/trace/trace_events.c:579:32: warning: passing argument 1 of
>   =E2=80=98unregister_trace_sched_switch=E2=80=99 from incompatible p=
ointer type
>   [-Wincompatible-pointer-types]
>   unregister_trace_sched_switch(event_filter_pid_sched_switch_probe_p=
re, tr);
>                                 ^
> In file included from include/trace/events/sched.h:8:0,
>                  from kernel/trace/trace_events.c:25:
> include/linux/tracepoint.h:223:2: note: expected
>   =E2=80=98void (*)(void *, bool,  struct task_struct *, struct task_=
struct *)
> {aka void (*)(void *, _Bool,  struct task_struct *, struct task_struc=
t *)}=E2=80=99
> but argument is of type
>   =E2=80=98void (*)(void *, struct task_struct *, struct task_struct =
*)=E2=80=99
>   unregister_trace_##name(void (*probe)(data_proto), void *data) \
>   ^
> include/linux/tracepoint.h:357:3: note: in expansion of macro =E2=80=98=
__DECLARE_TRACE=E2=80=99
>    __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args), 1, \
>    ^
> include/linux/tracepoint.h:491:2: note: in expansion of macro =E2=80=98=
DECLARE_TRACE=E2=80=99
>   DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
>   ^
> include/trace/events/sched.h:124:1: note: in expansion of macro =E2=80=
=98TRACE_EVENT=E2=80=99
>  TRACE_EVENT(sched_switch,
>  ^
>=20
> Signed-off-by: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
> ---
>  kernel/trace/trace_events.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/kernel/trace/trace_events.c b/kernel/trace/trace_events.=
c
> index fb0261e..0d86f0c 100644
> --- a/kernel/trace/trace_events.c
> +++ b/kernel/trace/trace_events.c
> @@ -506,7 +506,7 @@ check_ignore_pid(struct trace_pid_list *filtered_=
pids, struct task_struct *task)
>  }
> =20
>  static void
> -event_filter_pid_sched_switch_probe_pre(void *data,
> +event_filter_pid_sched_switch_probe_pre(void *data, bool preempt,
>  		    struct task_struct *prev, struct task_struct *next)
>  {
>  	struct trace_array *tr =3D data;
> @@ -520,7 +520,7 @@ event_filter_pid_sched_switch_probe_pre(void *dat=
a,
>  }
> =20
>  static void
> -event_filter_pid_sched_switch_probe_post(void *data,
> +event_filter_pid_sched_switch_probe_post(void *data, bool preempt,
>  		    struct task_struct *prev, struct task_struct *next)
>  {
>  	struct trace_array *tr =3D data;
> --=20
> 2.6.2.402.g2635c2b

So I guess I need that (or something similar) in linux-next until these
trees are merged.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
