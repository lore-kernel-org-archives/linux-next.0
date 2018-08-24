From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warnings from the build of Linus' tree
Date: Fri, 24 Aug 2018 13:32:06 +1000
Message-ID: <20180824133206.4218c2e5@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/7Ue9y/.D5eOIfpLFvTcLwGl"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Masami Hiramatsu <mhiramat@kernel.org>, "Steven Rostedt (VMware)" <rostedt@goodmis.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/7Ue9y/.D5eOIfpLFvTcLwGl
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the origin tree, today's linux-next build (powerpc
allyesconfig) produced these warnings:

ld: warning: orphan section `.data..LPBX1' from `kernel/trace/trace_selftes=
t_dynamic.o' being placed in section `.data..LPBX1'
ld: warning: orphan section `.data..LPBX1' from `kernel/trace/trace_kprobe_=
selftest.o' being placed in section `.data..LPBX1'
ld: warning: orphan section `.data..LPBX1' from `kernel/trace/trace_clock.o=
' being placed in section `.data..LPBX1'
ld: warning: orphan section `.data..LPBX1' from `kernel/trace/ftrace.o' bei=
ng placed in section `.data..LPBX1'
ld: warning: orphan section `.data..LPBX1' from `kernel/trace/ring_buffer.o=
' being placed in section `.data..LPBX1'
ld: warning: orphan section `.data..LPBX1' from `kernel/trace/ring_buffer_b=
enchmark.o' being placed in section `.data..LPBX1'
ld: warning: orphan section `.data..LPBX1' from `kernel/trace/trace.o' bein=
g placed in section `.data..LPBX1'
ld: warning: orphan section `.data..LPBX1' from `kernel/trace/trace_output.=
o' being placed in section `.data..LPBX1'
ld: warning: orphan section `.data..LPBX1' from `kernel/trace/trace_seq.o' =
being placed in section `.data..LPBX1'
ld: warning: orphan section `.data..LPBX1' from `kernel/trace/trace_stat.o'=
 being placed in section `.data..LPBX1'
ld: warning: orphan section `.data..LPBX1' from `kernel/trace/trace_printk.=
o' being placed in section `.data..LPBX1'
ld: warning: orphan section `.data..LPBX1' from `kernel/trace/tracing_map.o=
' being placed in section `.data..LPBX1'
ld: warning: orphan section `.data..LPBX1' from `kernel/trace/trace_sched_s=
witch.o' being placed in section `.data..LPBX1'
ld: warning: orphan section `.data..LPBX1' from `kernel/trace/trace_functio=
ns.o' being placed in section `.data..LPBX1'
ld: warning: orphan section `.data..LPBX1' from `kernel/trace/trace_preempt=
irq.o' being placed in section `.data..LPBX1'
ld: warning: orphan section `.data..LPBX1' from `kernel/trace/trace_irqsoff=
.o' being placed in section `.data..LPBX1'
ld: warning: orphan section `.data..LPBX1' from `kernel/trace/trace_sched_w=
akeup.o' being placed in section `.data..LPBX1'
ld: warning: orphan section `.data..LPBX1' from `kernel/trace/trace_hwlat.o=
' being placed in section `.data..LPBX1'
ld: warning: orphan section `.data..LPBX1' from `kernel/trace/trace_nop.o' =
being placed in section `.data..LPBX1'
ld: warning: orphan section `.data..LPBX1' from `kernel/trace/trace_stack.o=
' being placed in section `.data..LPBX1'
ld: warning: orphan section `.data..LPBX1' from `kernel/trace/trace_functio=
ns_graph.o' being placed in section `.data..LPBX1'
ld: warning: orphan section `.data..LPBX1' from `kernel/trace/blktrace.o' b=
eing placed in section `.data..LPBX1'
ld: warning: orphan section `.data..LPBX1' from `kernel/trace/trace_events.=
o' being placed in section `.data..LPBX1'
ld: warning: orphan section `.data..LPBX1' from `kernel/trace/trace_export.=
o' being placed in section `.data..LPBX1'
ld: warning: orphan section `.data..LPBX1' from `kernel/trace/trace_syscall=
s.o' being placed in section `.data..LPBX1'
ld: warning: orphan section `.data..LPBX1' from `kernel/trace/trace_event_p=
erf.o' being placed in section `.data..LPBX1'
ld: warning: orphan section `.data..LPBX1' from `kernel/trace/trace_events_=
filter.o' being placed in section `.data..LPBX1'
ld: warning: orphan section `.data..LPBX1' from `kernel/trace/trace_events_=
trigger.o' being placed in section `.data..LPBX1'
ld: warning: orphan section `.data..LPBX1' from `kernel/trace/trace_events_=
hist.o' being placed in section `.data..LPBX1'
ld: warning: orphan section `.data..LPBX1' from `kernel/trace/bpf_trace.o' =
being placed in section `.data..LPBX1'
ld: warning: orphan section `.data..LPBX1' from `kernel/trace/trace_kprobe.=
o' being placed in section `.data..LPBX1'
ld: warning: orphan section `.data..LPBX1' from `kernel/trace/power-traces.=
o' being placed in section `.data..LPBX1'
ld: warning: orphan section `.data..LPBX1' from `kernel/trace/rpm-traces.o'=
 being placed in section `.data..LPBX1'
ld: warning: orphan section `.data..LPBX1' from `kernel/trace/trace_kdb.o' =
being placed in section `.data..LPBX1'
ld: warning: orphan section `.data..LPBX1' from `kernel/trace/trace_probe.o=
' being placed in section `.data..LPBX1'
ld: warning: orphan section `.data..LPBX1' from `kernel/trace/trace_uprobe.=
o' being placed in section `.data..LPBX1'
ld: warning: orphan section `.data..LPBX1' from `kernel/trace/trace_benchma=
rk.o' being placed in section `.data..LPBX1'

Maybe introduced by commit

  6b7dca401cb1 ("tracing: Allow gcov profiling on only ftrace subsystem")

I am guessing, but that is the only new thing that affects all of
kernel/trace ...

--=20
Cheers,
Stephen Rothwell

--Sig_/7Ue9y/.D5eOIfpLFvTcLwGl
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlt/fDYACgkQAVBC80lX
0GwN+wf+JQfeOPEEnz3/HVDDIEqBUwD3sEcnxHShGOIn5duTYJOYN6ed2ZvzE92g
SD3OUvfL1S0rVRKv71JCFpvoU/QBXTLrDtVcU/W/bTq/Rdsllo0zJJ4gzqs8CRKV
rWKWAWrqm4IDXDt6jUQjl2YyIWgJhpXc59rTsCEIq03quXUYvcAOhLxqb5336F66
1lN7/QjWXmfFyHC65MdBt/zVse0fJmrXM00tj1UYdF6hAljzWqZTO52dRIQlmObu
VpL/6sSIJJUdhmdh43hxDQuSOCJtKp1m/MGM5nlgxUcFZiorY0AjNKXF0rO8EPM8
8lo6Jv9gH9Z/9vNMht9R5oQ29127MA==
=oHvC
-----END PGP SIGNATURE-----

--Sig_/7Ue9y/.D5eOIfpLFvTcLwGl--
