From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Subject: Re: linux-next: Tree for Nov 2
Date: Mon, 2 Nov 2015 14:58:16 +0900
Message-ID: <20151102055816.GA434@swordfish>
References: <20151102154017.6817486c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pa0-f53.google.com ([209.85.220.53]:33671 "EHLO
	mail-pa0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751489AbbKBF5V (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 2 Nov 2015 00:57:21 -0500
Content-Disposition: inline
In-Reply-To: <20151102154017.6817486c@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Steven Rostedt <rostedt@goodmis.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On (11/02/15 15:40), Stephen Rothwell wrote:
> Hi all,
>=20
> Changes since 20151101:
>=20


Hi,

unregister_trace_sched_switch/register_trace_prio_sched_switch/etc.
(see the log below. 80-cols unfriendly. sorry.)
expect proto to contain 'bool preempt'

TRACE_EVENT(sched_switch,

        TP_PROTO(bool preempt,
                 struct task_struct *prev,
                 struct task_struct *next),


event_filter_pid_sched_switch_probe_post() and
event_filter_pid_sched_switch_probe_pre() are missing it.
which results in:

kernel/trace/trace_events.c: In function =E2=80=98__ftrace_clear_event_=
pids=E2=80=99:
kernel/trace/trace_events.c:579:32: warning: passing argument 1 of =E2=80=
=98unregister_trace_sched_switch=E2=80=99 from incompatible pointer typ=
e [-Wincompatible-pointer-types]
  unregister_trace_sched_switch(event_filter_pid_sched_switch_probe_pre=
, tr);
                                ^
In file included from include/trace/events/sched.h:8:0,
                 from kernel/trace/trace_events.c:25:
include/linux/tracepoint.h:223:2: note: expected =E2=80=98void (*)(void=
 *, bool,  struct task_struct *, struct task_struct *) {aka void (*)(vo=
id *, _Bool,  struct task_struct *, struct task_struct *)}=E2=80=99 but=
 argument is of type =E2=80=98void (*)(void *, struct task_struct *, st=
ruct task_struct *)=E2=80=99
  unregister_trace_##name(void (*probe)(data_proto), void *data) \
  ^
include/linux/tracepoint.h:357:3: note: in expansion of macro =E2=80=98=
__DECLARE_TRACE=E2=80=99
   __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args), 1, \
   ^
include/linux/tracepoint.h:491:2: note: in expansion of macro =E2=80=98=
DECLARE_TRACE=E2=80=99
  DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
  ^
include/trace/events/sched.h:124:1: note: in expansion of macro =E2=80=98=
TRACE_EVENT=E2=80=99
 TRACE_EVENT(sched_switch,
 ^
kernel/trace/trace_events.c:580:32: warning: passing argument 1 of =E2=80=
=98unregister_trace_sched_switch=E2=80=99 from incompatible pointer typ=
e [-Wincompatible-pointer-types]
  unregister_trace_sched_switch(event_filter_pid_sched_switch_probe_pos=
t, tr);
                                ^
In file included from include/trace/events/sched.h:8:0,
                 from kernel/trace/trace_events.c:25:
include/linux/tracepoint.h:223:2: note: expected =E2=80=98void (*)(void=
 *, bool,  struct task_struct *, struct task_struct *) {aka void (*)(vo=
id *, _Bool,  struct task_struct *, struct task_struct *)}=E2=80=99 but=
 argument is of type =E2=80=98void (*)(void *, struct task_struct *, st=
ruct task_struct *)=E2=80=99
  unregister_trace_##name(void (*probe)(data_proto), void *data) \
  ^
include/linux/tracepoint.h:357:3: note: in expansion of macro =E2=80=98=
__DECLARE_TRACE=E2=80=99
   __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args), 1, \
   ^
include/linux/tracepoint.h:491:2: note: in expansion of macro =E2=80=98=
DECLARE_TRACE=E2=80=99
  DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
  ^
include/trace/events/sched.h:124:1: note: in expansion of macro =E2=80=98=
TRACE_EVENT=E2=80=99
 TRACE_EVENT(sched_switch,
 ^
kernel/trace/trace_events.c: In function =E2=80=98ftrace_event_pid_writ=
e=E2=80=99:
kernel/trace/trace_events.c:1723:36: warning: passing argument 1 of =E2=
=80=98register_trace_prio_sched_switch=E2=80=99 from incompatible point=
er type [-Wincompatible-pointer-types]
   register_trace_prio_sched_switch(event_filter_pid_sched_switch_probe=
_pre,
                                    ^
In file included from include/trace/events/sched.h:8:0,
                 from kernel/trace/trace_events.c:25:
include/linux/tracepoint.h:216:2: note: expected =E2=80=98void (*)(void=
 *, bool,  struct task_struct *, struct task_struct *) {aka void (*)(vo=
id *, _Bool,  struct task_struct *, struct task_struct *)}=E2=80=99 but=
 argument is of type =E2=80=98void (*)(void *, struct task_struct *, st=
ruct task_struct *)=E2=80=99
  register_trace_prio_##name(void (*probe)(data_proto), void *data,\
  ^
include/linux/tracepoint.h:357:3: note: in expansion of macro =E2=80=98=
__DECLARE_TRACE=E2=80=99
   __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args), 1, \
   ^
include/linux/tracepoint.h:491:2: note: in expansion of macro =E2=80=98=
DECLARE_TRACE=E2=80=99
  DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
  ^
include/trace/events/sched.h:124:1: note: in expansion of macro =E2=80=98=
TRACE_EVENT=E2=80=99
 TRACE_EVENT(sched_switch,
 ^
kernel/trace/trace_events.c:1725:36: warning: passing argument 1 of =E2=
=80=98register_trace_prio_sched_switch=E2=80=99 from incompatible point=
er type [-Wincompatible-pointer-types]
   register_trace_prio_sched_switch(event_filter_pid_sched_switch_probe=
_post,
                                    ^
In file included from include/trace/events/sched.h:8:0,
                 from kernel/trace/trace_events.c:25:
include/linux/tracepoint.h:216:2: note: expected =E2=80=98void (*)(void=
 *, bool,  struct task_struct *, struct task_struct *) {aka void (*)(vo=
id *, _Bool,  struct task_struct *, struct task_struct *)}=E2=80=99 but=
 argument is of type =E2=80=98void (*)(void *, struct task_struct *, st=
ruct task_struct *)=E2=80=99
  register_trace_prio_##name(void (*probe)(data_proto), void *data,\
  ^
include/linux/tracepoint.h:357:3: note: in expansion of macro =E2=80=98=
__DECLARE_TRACE=E2=80=99
   __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args), 1, \
   ^
include/linux/tracepoint.h:491:2: note: in expansion of macro =E2=80=98=
DECLARE_TRACE=E2=80=99
  DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
  ^
include/trace/events/sched.h:124:1: note: in expansion of macro =E2=80=98=
TRACE_EVENT=E2=80=99
 TRACE_EVENT(sched_switch,




something like this, I guess.

=3D=3D=3D8<=3D=3D=3D8<=3D=3D=3D8<=3D=3D=3D8<=3D=3D=3D

Add missing 'bool preempt' argument as required by
sched_switch's trace event proto:

: TRACE_EVENT(sched_switch,
:
:         TP_PROTO(bool preempt,
:                  struct task_struct *prev,
:                  struct task_struct *next),
=2E..

to event_filter_pid_sched_switch_probe_post() and
event_filter_pid_sched_switch_probe_pre() functions.

kernel/trace/trace_events.c: In function =E2=80=98__ftrace_clear_event_=
pids=E2=80=99:
kernel/trace/trace_events.c:579:32: warning: passing argument 1 of
  =E2=80=98unregister_trace_sched_switch=E2=80=99 from incompatible poi=
nter type
  [-Wincompatible-pointer-types]
  unregister_trace_sched_switch(event_filter_pid_sched_switch_probe_pre=
, tr);
                                ^
In file included from include/trace/events/sched.h:8:0,
                 from kernel/trace/trace_events.c:25:
include/linux/tracepoint.h:223:2: note: expected
  =E2=80=98void (*)(void *, bool,  struct task_struct *, struct task_st=
ruct *)
{aka void (*)(void *, _Bool,  struct task_struct *, struct task_struct =
*)}=E2=80=99
but argument is of type
  =E2=80=98void (*)(void *, struct task_struct *, struct task_struct *)=
=E2=80=99
  unregister_trace_##name(void (*probe)(data_proto), void *data) \
  ^
include/linux/tracepoint.h:357:3: note: in expansion of macro =E2=80=98=
__DECLARE_TRACE=E2=80=99
   __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args), 1, \
   ^
include/linux/tracepoint.h:491:2: note: in expansion of macro =E2=80=98=
DECLARE_TRACE=E2=80=99
  DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
  ^
include/trace/events/sched.h:124:1: note: in expansion of macro =E2=80=98=
TRACE_EVENT=E2=80=99
 TRACE_EVENT(sched_switch,
 ^

Signed-off-by: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
---
 kernel/trace/trace_events.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/trace/trace_events.c b/kernel/trace/trace_events.c
index fb0261e..0d86f0c 100644
--- a/kernel/trace/trace_events.c
+++ b/kernel/trace/trace_events.c
@@ -506,7 +506,7 @@ check_ignore_pid(struct trace_pid_list *filtered_pi=
ds, struct task_struct *task)
 }
=20
 static void
-event_filter_pid_sched_switch_probe_pre(void *data,
+event_filter_pid_sched_switch_probe_pre(void *data, bool preempt,
 		    struct task_struct *prev, struct task_struct *next)
 {
 	struct trace_array *tr =3D data;
@@ -520,7 +520,7 @@ event_filter_pid_sched_switch_probe_pre(void *data,
 }
=20
 static void
-event_filter_pid_sched_switch_probe_post(void *data,
+event_filter_pid_sched_switch_probe_post(void *data, bool preempt,
 		    struct task_struct *prev, struct task_struct *next)
 {
 	struct trace_array *tr =3D data;
--=20
2.6.2.402.g2635c2b
