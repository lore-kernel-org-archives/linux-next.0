Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EF9F37CD4F;
	Thu, 21 May 2026 10:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779358730; cv=none; b=b6KRXz0SiF9otafTeVRFRq8jgbjItpjMdv4sGalSh63+hDVOZhidtL77JFYHPybAX2BWlU8oTJwCpJmR6Hb7+4eMZtZQafLJh/VV01L6TkJbnlbp+S0+rdP394ODnD413vU1oVHRHnxYs5JoUZerehyUI6zNAFTG8oEiBDxoPfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779358730; c=relaxed/simple;
	bh=4xExTsuazUCHPn6sW1czc4kiW9fEI0wAhm12eRsJXC4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XFrekKlN1rGfFcYwjK7+ZD7N3ETLzpgSPoRobLpQCl600lEIRB6JrHfHP+D1U9sbockNw3ivfQab9+UhBvoPxkXSDm2QZg6DhyLqFHTw6w1ZN5M/s4XdJ4VK8dRiT054FWhvdMiDZS8i8HEy5l+MVf28EMzNa1Z7GY+oFtAuacQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X9e8GkNv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X9e8GkNv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E84891F000E9;
	Thu, 21 May 2026 10:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779358727;
	bh=Bwl6ptlUBMN/fp2NTNZ+XCzwl/Gouzn1nn7CbIYgbjw=;
	h=Date:From:To:Cc:Subject;
	b=X9e8GkNvTQBDXsK1J/w5ZiNO/9Lelk6Van4Ceece1fMlkbUnnqmSI+QqHq4Z7cdV8
	 GLHXPPSsHqa74pPgxOmt+hafqhrTPHantoJYzf72x3pS6zl39h60fnRiQiSOm6xHDa
	 MrKiJJDqvZVqku+IJgnRvHSutUi6yZvWJxUhhj9MXQedUKWxeLQ/kzY4+4u/sFpTbL
	 97OJW6fUa64h+p9O8unVycZ4XH5iL9RZLAQreZQUqkc0qyHswNEXGZjpZBclXWBwTg
	 D5k0SzI8or6dPJWpprwocCkJzt1/VCP45qVCTZkAPz7yZkFTFHHWBL8HlhdOFweQSN
	 pfh0Bs/fzgnLA==
Date: Thu, 21 May 2026 11:18:43 +0100
From: Mark Brown <broonie@kernel.org>
To: Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>,
	Namhyung Kim <namhyung@kernel.org>
Cc: Arnaldo Carvalho de Melo <acme@redhat.com>,
	Ian Rogers <irogers@google.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the perf tree with the origin tree
Message-ID: <ag7cA_5iO69Oq6Ok@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="WmCqk0KVobSimN1K"
Content-Disposition: inline


--WmCqk0KVobSimN1K
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the perf tree got a conflict in:

  tools/perf/builtin-trace.c

between commit:

  552636b9317c8 ("perf trace: Add beautifier script for fsmount flags")

=66rom the origin tree and commit:

  537609924c437 ("perf trace beauty: Make beauty generated C code standalon=
e .o files")

=66rom the perf tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

This is obviously not the right merge but it builds.

diff --combined tools/perf/builtin-trace.c
index 48615ddccd93a,0730c1d9f0b3a..0000000000000
--- a/tools/perf/builtin-trace.c
+++ b/tools/perf/builtin-trace.c
@@@ -60,12 -60,13 +60,13 @@@
  #include "callchain.h"
  #include "print_binary.h"
  #include "string2.h"
- #include "syscalltbl.h"
+ #include "trace/beauty/syscalltbl.h"
  #include "../perf.h"
  #include "trace_augment.h"
  #include "dwarf-regs.h"
 =20
  #include <errno.h>
+ #include <sys/stat.h>
  #include <inttypes.h>
  #include <poll.h>
  #include <signal.h>
@@@ -217,6 -218,7 +218,7 @@@ struct trace=20
  	bool			kernel_syscallchains;
  	s16			args_alignment;
  	bool			show_tstamp;
+ 	bool			show_cpu;
  	bool			show_duration;
  	bool			show_zeros;
  	bool			show_arg_names;
@@@ -234,6 -236,16 +236,16 @@@
  	const char		*uid_str;
  };
 =20
+ bool trace__show_zeros(const struct trace *trace)
+ {
+ 	return trace->show_zeros;
+ }
+=20
+ struct machine *trace__host(const struct trace *trace)
+ {
+ 	return trace->host;
+ }
+=20
  static void trace__load_vmlinux_btf(struct trace *trace __maybe_unused)
  {
  #ifdef HAVE_LIBBPF_SUPPORT
@@@ -535,12 -547,12 +547,12 @@@ out_delete
  	return NULL;
  }
 =20
- #define perf_evsel__sc_tp_uint(evsel, name, sample) \
- 	({ struct syscall_tp *fields =3D __evsel__syscall_tp(evsel); \
+ #define perf_evsel__sc_tp_uint(name, sample) \
+ 	({ struct syscall_tp *fields =3D __evsel__syscall_tp(sample->evsel); \
  	   fields->name.integer(&fields->name, sample); })
 =20
- #define perf_evsel__sc_tp_ptr(evsel, name, sample) \
- 	({ struct syscall_tp *fields =3D __evsel__syscall_tp(evsel); \
+ #define perf_evsel__sc_tp_ptr(name, sample) \
+ 	({ struct syscall_tp *fields =3D __evsel__syscall_tp(sample->evsel); \
  	   fields->name.pointer(&fields->name, sample); })
 =20
  size_t strarray__scnprintf_suffix(struct strarray *sa, char *bf, size_t s=
ize, const char *intfmt, bool show_suffix, int val)
@@@ -771,9 -783,10 +783,10 @@@ static const char *bpf_cmd[] =3D=20
  };
  static DEFINE_STRARRAY(bpf_cmd, "BPF_");
 =20
- #include "trace/beauty/generated/fsconfig_arrays.c"
-=20
- static DEFINE_STRARRAY(fsconfig_cmds, "FSCONFIG_");
+ static const char *fsmount_flags[] =3D {
+ 	[1] =3D "CLOEXEC",
+ };
+ static DEFINE_STRARRAY(fsmount_flags, "FSMOUNT_");
 =20
  static const char *epoll_ctl_ops[] =3D { "ADD", "DEL", "MOD", };
  static DEFINE_STRARRAY_OFFSET(epoll_ctl_ops, "EPOLL_CTL_", 1);
@@@ -1123,21 -1136,6 +1136,6 @@@ static bool syscall_arg__strtoul_btf_ty
  	    .parm	=3D &strarray__##array, \
  	    .show_zero	=3D true, }
 =20
- #include "trace/beauty/eventfd.c"
- #include "trace/beauty/futex_op.c"
- #include "trace/beauty/futex_val3.c"
- #include "trace/beauty/mmap.c"
- #include "trace/beauty/mode_t.c"
- #include "trace/beauty/msg_flags.c"
- #include "trace/beauty/open_flags.c"
- #include "trace/beauty/perf_event_open.c"
- #include "trace/beauty/pid.c"
- #include "trace/beauty/sched_policy.c"
- #include "trace/beauty/seccomp.c"
- #include "trace/beauty/signum.c"
- #include "trace/beauty/socket_type.c"
- #include "trace/beauty/waitid_options.c"
-=20
  static const struct syscall_fmt syscall_fmts[] =3D {
  	{ .name	    =3D "access",
  	  .arg =3D { [1] =3D { .scnprintf =3D SCA_ACCMODE,  /* mode */ }, }, },
@@@ -1197,9 -1195,7 +1195,9 @@@
  	{ .name     =3D "fsconfig",
  	  .arg =3D { [1] =3D STRARRAY(cmd, fsconfig_cmds), }, },
  	{ .name     =3D "fsmount",
 -	  .arg =3D { [1] =3D STRARRAY_FLAGS(flags, fsmount_flags),
 +	  .arg =3D { [1] =3D { .scnprintf =3D SCA_FSMOUNT_FLAGS, /* fsmount_flag=
s */
 +			   .strtoul   =3D STUL_STRARRAYS,
 +			   .show_zero =3D true, },
  		   [2] =3D { .scnprintf =3D SCA_FSMOUNT_ATTR_FLAGS, /* attr_flags */ },=
 }, },
  	{ .name     =3D "fspick",
  	  .arg =3D { [0] =3D { .scnprintf =3D SCA_FDAT,	  /* dfd */ },
@@@ -1528,6 -1524,7 +1526,7 @@@ static size_t fprintf_duration(unsigne
   */
  struct thread_trace {
  	u64		  entry_time;
+ 	u32		  entry_cpu;
  	bool		  entry_pending;
  	unsigned long	  nr_events;
  	unsigned long	  pfmaj, pfmin;
@@@ -1890,6 -1887,27 +1889,27 @@@ static size_t trace__fprintf_tstamp(str
  	return fprintf(fp, "         ? ");
  }
 =20
+ /**
+  * trace__fprintf_cpu - Print the CPU ID to a given file stream
+  * @cpu: The CPU ID to print
+  * @fp: The file stream to write to
+  *
+  * Formats and prints the specified CPU ID enclosed in brackets
+  * (e.g., "[003] ") to the provided file pointer. It is used to
+  * align and display the CPU ID consistently within the trace output.
+  *
+  * Return: The number of characters printed.
+  */
+ static size_t trace__fprintf_cpu(u32 cpu, FILE *fp)
+ {
+ 	size_t printed =3D 0;
+=20
+ 	if (cpu !=3D (u32)-1)
+ 		printed +=3D fprintf(fp, "[%03u] ", cpu);
+=20
+ 	return printed;
+ }
+=20
  static pid_t workload_pid =3D -1;
  static volatile sig_atomic_t done =3D false;
  static volatile sig_atomic_t interrupted =3D false;
@@@ -1920,12 -1938,15 +1940,15 @@@ static size_t trace__fprintf_comm_tid(s
  }
 =20
  static size_t trace__fprintf_entry_head(struct trace *trace, struct threa=
d *thread,
- 					u64 duration, bool duration_calculated, u64 tstamp, FILE *fp)
+ 					u64 duration, bool duration_calculated,
+ 					u64 tstamp, u32 cpu, FILE *fp)
  {
  	size_t printed =3D 0;
 =20
  	if (trace->show_tstamp)
  		printed =3D trace__fprintf_tstamp(trace, tstamp, fp);
+ 	if (trace->show_cpu && cpu !=3D (u32)-1)
+ 		printed +=3D trace__fprintf_cpu(cpu, fp);
  	if (trace->show_duration)
  		printed +=3D fprintf_duration(duration, duration_calculated, fp);
  	return printed + trace__fprintf_comm_tid(trace, thread, fp);
@@@ -2579,7 -2600,7 +2602,7 @@@ static struct syscall *trace__find_sysc
  	return sc;
  }
 =20
- typedef int (*tracepoint_handler)(struct trace *trace, struct evsel *evse=
l,
+ typedef int (*tracepoint_handler)(struct trace *trace,
  				  union perf_event *event,
  				  struct perf_sample *sample);
 =20
@@@ -2704,7 -2725,9 +2727,9 @@@ static int trace__printf_interrupted_en
  	if (!ttrace->entry_pending)
  		return 0;
 =20
- 	printed  =3D trace__fprintf_entry_head(trace, trace->current, 0, false, =
ttrace->entry_time, trace->output);
+ 	printed =3D trace__fprintf_entry_head(trace, trace->current, 0, false,
+ 					    ttrace->entry_time, ttrace->entry_cpu,
+ 					    trace->output);
  	printed +=3D len =3D fprintf(trace->output, "%s)", ttrace->entry_str);
 =20
  	if (len < trace->args_alignment - 4)
@@@ -2718,8 -2741,8 +2743,8 @@@
  	return printed;
  }
 =20
- static int trace__fprintf_sample(struct trace *trace, struct evsel *evsel,
- 				 struct perf_sample *sample, struct thread *thread)
+ static int trace__fprintf_sample(struct trace *trace, struct perf_sample =
*sample,
+ 				 struct thread *thread)
  {
  	int printed =3D 0;
 =20
@@@ -2727,7 -2750,7 +2752,7 @@@
  		double ts =3D (double)sample->time / NSEC_PER_MSEC;
 =20
  		printed +=3D fprintf(trace->output, "%22s %10.3f %s %d/%d [%d]\n",
- 				   evsel__name(evsel), ts,
+ 				   evsel__name(sample->evsel), ts,
  				   thread__comm_str(thread),
  				   sample->pid, sample->tid, sample->cpu);
  	}
@@@ -2774,15 -2797,16 +2799,16 @@@ static void *syscall__augmented_args(st
  	return NULL;
  }
 =20
- static int trace__sys_enter(struct trace *trace, struct evsel *evsel,
+ static int trace__sys_enter(struct trace *trace,
  			    union perf_event *event __maybe_unused,
  			    struct perf_sample *sample)
  {
+ 	struct evsel *evsel =3D sample->evsel;
  	char *msg;
  	void *args;
  	int printed =3D 0;
  	struct thread *thread;
- 	int id =3D perf_evsel__sc_tp_uint(evsel, id, sample), err =3D -1;
+ 	int id =3D perf_evsel__sc_tp_uint(id, sample), err =3D -1;
  	int augmented_args_size =3D 0, e_machine;
  	void *augmented_args =3D NULL;
  	struct syscall *sc;
@@@ -2797,9 -2821,9 +2823,9 @@@
  	if (ttrace =3D=3D NULL)
  		goto out_put;
 =20
- 	trace__fprintf_sample(trace, evsel, sample, thread);
+ 	trace__fprintf_sample(trace, sample, thread);
 =20
- 	args =3D perf_evsel__sc_tp_ptr(evsel, args, sample);
+ 	args =3D perf_evsel__sc_tp_ptr(args, sample);
 =20
  	if (ttrace->entry_str =3D=3D NULL) {
  		ttrace->entry_str =3D malloc(trace__entry_str_size);
@@@ -2822,6 -2846,7 +2848,7 @@@
  	if (evsel !=3D trace->syscalls.events.sys_enter)
  		augmented_args =3D syscall__augmented_args(sc, sample, &augmented_args_=
size, trace->raw_augmented_syscalls_args_size);
  	ttrace->entry_time =3D sample->time;
+ 	ttrace->entry_cpu =3D sample->cpu;
  	msg =3D ttrace->entry_str;
  	printed +=3D scnprintf(msg + printed, trace__entry_str_size - printed, "=
%s(", sc->name);
 =20
@@@ -2832,7 -2857,9 +2859,9 @@@
  		if (!(trace->duration_filter || trace->summary_only || trace->failure_o=
nly || trace->min_stack)) {
  			int alignment =3D 0;
 =20
- 			trace__fprintf_entry_head(trace, thread, 0, false, ttrace->entry_time,=
 trace->output);
+ 			trace__fprintf_entry_head(trace, thread, 0, false,
+ 						  ttrace->entry_time,
+ 						  sample->cpu, trace->output);
  			printed =3D fprintf(trace->output, "%s)", ttrace->entry_str);
  			if (trace->args_alignment > printed)
  				alignment =3D trace->args_alignment - printed;
@@@ -2854,12 -2881,11 +2883,11 @@@ out_put
  	return err;
  }
 =20
- static int trace__fprintf_sys_enter(struct trace *trace, struct evsel *ev=
sel,
- 				    struct perf_sample *sample)
+ static int trace__fprintf_sys_enter(struct trace *trace, struct perf_samp=
le *sample)
  {
  	struct thread_trace *ttrace;
  	struct thread *thread;
- 	int id =3D perf_evsel__sc_tp_uint(evsel, id, sample), err =3D -1;
+ 	int id =3D perf_evsel__sc_tp_uint(id, sample), err =3D -1;
  	struct syscall *sc;
  	char msg[1024];
  	void *args, *augmented_args =3D NULL;
@@@ -2869,7 -2895,7 +2897,7 @@@
 =20
  	thread =3D machine__findnew_thread(trace->host, sample->pid, sample->tid=
);
  	e_machine =3D thread__e_machine(thread, trace->host, /*e_flags=3D*/NULL);
- 	sc =3D trace__syscall_info(trace, evsel, e_machine, id);
+ 	sc =3D trace__syscall_info(trace, sample->evsel, e_machine, id);
  	if (sc =3D=3D NULL)
  		goto out_put;
  	ttrace =3D thread__trace(thread, trace);
@@@ -2880,7 -2906,7 +2908,7 @@@
  	if (ttrace =3D=3D NULL)
  		goto out_put;
 =20
- 	args =3D perf_evsel__sc_tp_ptr(evsel, args, sample);
+ 	args =3D perf_evsel__sc_tp_ptr(args, sample);
  	augmented_args =3D syscall__augmented_args(sc, sample, &augmented_args_s=
ize, trace->raw_augmented_syscalls_args_size);
  	printed +=3D syscall__scnprintf_args(sc, msg, sizeof(msg), args, augment=
ed_args, augmented_args_size, trace, thread);
  	fprintf(trace->output, "%.*s", (int)printed, msg);
@@@ -2890,10 -2916,11 +2918,11 @@@ out_put
  	return err;
  }
 =20
- static int trace__resolve_callchain(struct trace *trace, struct evsel *ev=
sel,
+ static int trace__resolve_callchain(struct trace *trace,
  				    struct perf_sample *sample,
  				    struct callchain_cursor *cursor)
  {
+ 	struct evsel *evsel =3D sample->evsel;
  	struct addr_location al;
  	int max_stack =3D evsel->core.attr.sample_max_stack ?
  			evsel->core.attr.sample_max_stack :
@@@ -2904,7 -2931,7 +2933,7 @@@
  	if (machine__resolve(trace->host, &al, sample) < 0)
  		goto out;
 =20
- 	err =3D thread__resolve_callchain(al.thread, cursor, evsel, sample, NULL=
, NULL, max_stack);
+ 	err =3D thread__resolve_callchain(al.thread, cursor, sample, NULL, NULL,=
 max_stack);
  out:
  	addr_location__exit(&al);
  	return err;
@@@ -2920,15 -2947,16 +2949,16 @@@ static int trace__fprintf_callchain(str
  	return sample__fprintf_callchain(sample, 38, print_opts, get_tls_callcha=
in_cursor(), symbol_conf.bt_stop_list, trace->output);
  }
 =20
- static int trace__sys_exit(struct trace *trace, struct evsel *evsel,
+ static int trace__sys_exit(struct trace *trace,
  			   union perf_event *event __maybe_unused,
  			   struct perf_sample *sample)
  {
+ 	struct evsel *evsel =3D sample->evsel;
  	long ret;
  	u64 duration =3D 0;
  	bool duration_calculated =3D false;
  	struct thread *thread;
- 	int id =3D perf_evsel__sc_tp_uint(evsel, id, sample), err =3D -1, callch=
ain_ret =3D 0, printed =3D 0;
+ 	int id =3D perf_evsel__sc_tp_uint(id, sample), err =3D -1, callchain_ret=
 =3D 0, printed =3D 0;
  	int alignment =3D trace->args_alignment, e_machine;
  	struct syscall *sc;
  	struct thread_trace *ttrace;
@@@ -2942,9 -2970,9 +2972,9 @@@
  	if (ttrace =3D=3D NULL)
  		goto out_put;
 =20
- 	trace__fprintf_sample(trace, evsel, sample, thread);
+ 	trace__fprintf_sample(trace, sample, thread);
 =20
- 	ret =3D perf_evsel__sc_tp_uint(evsel, ret, sample);
+ 	ret =3D perf_evsel__sc_tp_uint(ret, sample);
 =20
  	if (trace->summary)
  		thread__update_stats(thread, ttrace, id, sample, ret, trace);
@@@ -2966,7 -2994,7 +2996,7 @@@
  	if (sample->callchain) {
  		struct callchain_cursor *cursor =3D get_tls_callchain_cursor();
 =20
- 		callchain_ret =3D trace__resolve_callchain(trace, evsel, sample, cursor=
);
+ 		callchain_ret =3D trace__resolve_callchain(trace, sample, cursor);
  		if (callchain_ret =3D=3D 0) {
  			if (cursor->nr < trace->min_stack)
  				goto out;
@@@ -2977,7 -3005,9 +3007,9 @@@
  	if (trace->summary_only || (ret >=3D 0 && trace->failure_only))
  		goto out;
 =20
- 	trace__fprintf_entry_head(trace, thread, duration, duration_calculated, =
ttrace->entry_time, trace->output);
+ 	trace__fprintf_entry_head(trace, thread, duration,
+ 				  duration_calculated, ttrace->entry_time,
+ 				  sample->cpu, trace->output);
 =20
  	if (ttrace->entry_pending) {
  		printed =3D fprintf(trace->output, "%s", ttrace->entry_str);
@@@ -3058,7 -3088,7 +3090,7 @@@ out_put
  	return err;
  }
 =20
- static int trace__vfs_getname(struct trace *trace, struct evsel *evsel,
+ static int trace__vfs_getname(struct trace *trace,
  			      union perf_event *event __maybe_unused,
  			      struct perf_sample *sample)
  {
@@@ -3067,7 -3097,7 +3099,7 @@@
  	size_t filename_len, entry_str_len, to_move;
  	ssize_t remaining_space;
  	char *pos;
- 	const char *filename =3D evsel__rawptr(evsel, sample, "pathname");
+ 	const char *filename =3D perf_sample__strval(sample, "pathname");
 =20
  	if (!thread)
  		goto out;
@@@ -3119,11 -3149,11 +3151,11 @@@ out
  	return 0;
  }
 =20
- static int trace__sched_stat_runtime(struct trace *trace, struct evsel *e=
vsel,
+ static int trace__sched_stat_runtime(struct trace *trace,
  				     union perf_event *event __maybe_unused,
  				     struct perf_sample *sample)
  {
-         u64 runtime =3D evsel__intval(evsel, sample, "runtime");
+ 	u64 runtime =3D perf_sample__intval(sample, "runtime");
  	double runtime_ms =3D (double)runtime / NSEC_PER_MSEC;
  	struct thread *thread =3D machine__findnew_thread(trace->host,
  							sample->pid,
@@@ -3141,11 -3171,11 +3173,11 @@@ out_put
 =20
  out_dump:
  	fprintf(trace->output, "%s: comm=3D%s,pid=3D%u,runtime=3D%" PRIu64 ",vru=
ntime=3D%" PRIu64 ")\n",
- 	       evsel->name,
- 	       evsel__strval(evsel, sample, "comm"),
- 	       (pid_t)evsel__intval(evsel, sample, "pid"),
+ 	       sample->evsel->name,
+ 	       perf_sample__strval(sample, "comm"),
+ 	       (pid_t)perf_sample__intval(sample, "pid"),
  	       runtime,
- 	       evsel__intval(evsel, sample, "vruntime"));
+ 	       perf_sample__intval(sample, "vruntime"));
  	goto out_put;
  }
 =20
@@@ -3181,9 -3211,10 +3213,10 @@@ static void bpf_output__fprintf(struct=20
  	++trace->nr_events_printed;
  }
 =20
- static size_t trace__fprintf_tp_fields(struct trace *trace, struct evsel =
*evsel, struct perf_sample *sample,
+ static size_t trace__fprintf_tp_fields(struct trace *trace, struct perf_s=
ample *sample,
  				       struct thread *thread, void *augmented_args, int augmented_arg=
s_size)
  {
+ 	struct evsel *evsel =3D sample->evsel;
  	char bf[2048];
  	size_t size =3D sizeof(bf);
  	const struct tep_event *tp_format =3D evsel__tp_format(evsel);
@@@ -3251,10 -3282,11 +3284,11 @@@
  	return fprintf(trace->output, "%.*s", (int)printed, bf);
  }
 =20
- static int trace__event_handler(struct trace *trace, struct evsel *evsel,
+ static int trace__event_handler(struct trace *trace,
  				union perf_event *event __maybe_unused,
  				struct perf_sample *sample)
  {
+ 	struct evsel *evsel =3D sample->evsel;
  	struct thread *thread;
  	int callchain_ret =3D 0;
 =20
@@@ -3266,7 -3298,7 +3300,7 @@@
  	if (sample->callchain) {
  		struct callchain_cursor *cursor =3D get_tls_callchain_cursor();
 =20
- 		callchain_ret =3D trace__resolve_callchain(trace, evsel, sample, cursor=
);
+ 		callchain_ret =3D trace__resolve_callchain(trace, sample, cursor);
  		if (callchain_ret =3D=3D 0) {
  			if (cursor->nr < trace->min_stack)
  				goto out;
@@@ -3277,6 -3309,9 +3311,9 @@@
  	trace__printf_interrupted_entry(trace);
  	trace__fprintf_tstamp(trace, sample->time, trace->output);
 =20
+ 	if (trace->show_cpu)
+ 		trace__fprintf_cpu(sample->cpu, trace->output);
+=20
  	if (trace->trace_syscalls && trace->show_duration)
  		fprintf(trace->output, "(         ): ");
 =20
@@@ -3284,7 -3319,7 +3321,7 @@@
  		trace__fprintf_comm_tid(trace, thread, trace->output);
 =20
  	if (evsel =3D=3D trace->syscalls.events.bpf_output) {
- 		int id =3D perf_evsel__sc_tp_uint(evsel, id, sample);
+ 		int id =3D perf_evsel__sc_tp_uint(id, sample);
  		int e_machine =3D thread
  			? thread__e_machine(thread, trace->host, /*e_flags=3D*/NULL)
  			: EM_HOST;
@@@ -3292,7 -3327,7 +3329,7 @@@
 =20
  		if (sc) {
  			fprintf(trace->output, "%s(", sc->name);
- 			trace__fprintf_sys_enter(trace, evsel, sample);
+ 			trace__fprintf_sys_enter(trace, sample);
  			fputc(')', trace->output);
  			goto newline;
  		}
@@@ -3312,13 -3347,13 +3349,13 @@@
  		const struct tep_event *tp_format =3D evsel__tp_format(evsel);
 =20
  		if (tp_format && (strncmp(tp_format->name, "sys_enter_", 10) ||
- 				  trace__fprintf_sys_enter(trace, evsel, sample))) {
+ 				  trace__fprintf_sys_enter(trace, sample))) {
  			if (trace->libtraceevent_print) {
  				event_format__fprintf(tp_format, sample->cpu,
  						      sample->raw_data, sample->raw_size,
  						      trace->output);
  			} else {
- 				trace__fprintf_tp_fields(trace, evsel, sample, thread, NULL, 0);
+ 				trace__fprintf_tp_fields(trace, sample, thread, NULL, 0);
  			}
  		}
  	}
@@@ -3360,7 -3395,6 +3397,6 @@@ static void print_location(FILE *f, str
  }
 =20
  static int trace__pgfault(struct trace *trace,
- 			  struct evsel *evsel,
  			  union perf_event *event __maybe_unused,
  			  struct perf_sample *sample)
  {
@@@ -3377,7 -3411,7 +3413,7 @@@
  	if (sample->callchain) {
  		struct callchain_cursor *cursor =3D get_tls_callchain_cursor();
 =20
- 		callchain_ret =3D trace__resolve_callchain(trace, evsel, sample, cursor=
);
+ 		callchain_ret =3D trace__resolve_callchain(trace, sample, cursor);
  		if (callchain_ret =3D=3D 0) {
  			if (cursor->nr < trace->min_stack)
  				goto out_put;
@@@ -3389,7 -3423,7 +3425,7 @@@
  	if (ttrace =3D=3D NULL)
  		goto out_put;
 =20
- 	if (evsel->core.attr.config =3D=3D PERF_COUNT_SW_PAGE_FAULTS_MAJ) {
+ 	if (sample->evsel->core.attr.config =3D=3D PERF_COUNT_SW_PAGE_FAULTS_MAJ=
) {
  		ttrace->pfmaj++;
  		trace->pfmaj++;
  	} else {
@@@ -3402,10 -3436,11 +3438,11 @@@
 =20
  	thread__find_symbol(thread, sample->cpumode, sample->ip, &al);
 =20
- 	trace__fprintf_entry_head(trace, thread, 0, true, sample->time, trace->o=
utput);
+ 	trace__fprintf_entry_head(trace, thread, 0, true, sample->time,
+ 				  sample->cpu, trace->output);
 =20
  	fprintf(trace->output, "%sfault [",
- 		evsel->core.attr.config =3D=3D PERF_COUNT_SW_PAGE_FAULTS_MAJ ?
+ 		sample->evsel->core.attr.config =3D=3D PERF_COUNT_SW_PAGE_FAULTS_MAJ ?
  		"maj" : "min");
 =20
  	print_location(trace->output, sample, &al, false, true);
@@@ -3430,7 -3465,8 +3467,8 @@@
  	if (callchain_ret > 0)
  		trace__fprintf_callchain(trace, sample);
  	else if (callchain_ret < 0)
- 		pr_err("Problem processing %s callchain, skipping...\n", evsel__name(ev=
sel));
+ 		pr_err("Problem processing %s callchain, skipping...\n",
+ 		       evsel__name(sample->evsel));
 =20
  	++trace->nr_events_printed;
  out:
@@@ -3442,7 -3478,6 +3480,6 @@@ out_put
  }
 =20
  static void trace__set_base_time(struct trace *trace,
- 				 struct evsel *evsel,
  				 struct perf_sample *sample)
  {
  	/*
@@@ -3454,17 -3489,17 +3491,17 @@@
  	 * appears in our event stream (vfs_getname comes to mind).
  	 */
  	if (trace->base_time =3D=3D 0 && !trace->full_time &&
- 	    (evsel->core.attr.sample_type & PERF_SAMPLE_TIME))
+ 	    (sample->evsel->core.attr.sample_type & PERF_SAMPLE_TIME))
  		trace->base_time =3D sample->time;
  }
 =20
  static int trace__process_sample(const struct perf_tool *tool,
  				 union perf_event *event,
  				 struct perf_sample *sample,
- 				 struct evsel *evsel,
  				 struct machine *machine __maybe_unused)
  {
  	struct trace *trace =3D container_of(tool, struct trace, tool);
+ 	struct evsel *evsel =3D sample->evsel;
  	struct thread *thread;
  	int err =3D 0;
 =20
@@@ -3474,11 -3509,11 +3511,11 @@@
  	if (thread && thread__is_filtered(thread))
  		goto out;
 =20
- 	trace__set_base_time(trace, evsel, sample);
+ 	trace__set_base_time(trace, sample);
 =20
  	if (handler) {
  		++trace->nr_events;
- 		handler(trace, evsel, event, sample);
+ 		handler(trace, event, sample);
  	}
  out:
  	thread__put(thread);
@@@ -3620,32 -3655,34 +3657,34 @@@ static void evlist__free_syscall_tp_fie
  static void trace__handle_event(struct trace *trace, union perf_event *ev=
ent, struct perf_sample *sample)
  {
  	const u32 type =3D event->header.type;
- 	struct evsel *evsel;
 =20
  	if (type !=3D PERF_RECORD_SAMPLE) {
  		trace__process_event(trace, trace->host, event, sample);
  		return;
  	}
 =20
- 	evsel =3D evlist__id2evsel(trace->evlist, sample->id);
- 	if (evsel =3D=3D NULL) {
+ 	if (sample->evsel =3D=3D NULL)
+ 		sample->evsel =3D evlist__id2evsel(trace->evlist, sample->id);
+=20
+ 	if (sample->evsel =3D=3D NULL) {
  		fprintf(trace->output, "Unknown tp ID %" PRIu64 ", skipping...\n", samp=
le->id);
  		return;
  	}
 =20
- 	if (evswitch__discard(&trace->evswitch, evsel))
+ 	if (evswitch__discard(&trace->evswitch, sample->evsel))
  		return;
 =20
- 	trace__set_base_time(trace, evsel, sample);
+ 	trace__set_base_time(trace, sample);
 =20
- 	if (evsel->core.attr.type =3D=3D PERF_TYPE_TRACEPOINT &&
+ 	if (sample->evsel->core.attr.type =3D=3D PERF_TYPE_TRACEPOINT &&
  	    sample->raw_data =3D=3D NULL) {
  		fprintf(trace->output, "%s sample with no payload for tid: %d, cpu %d, =
raw_size=3D%d, skipping...\n",
- 		       evsel__name(evsel), sample->tid,
+ 		       evsel__name(sample->evsel), sample->tid,
  		       sample->cpu, sample->raw_size);
  	} else {
- 		tracepoint_handler handler =3D evsel->handler;
- 		handler(trace, evsel, event, sample);
+ 		tracepoint_handler handler =3D sample->evsel->handler;
+=20
+ 		handler(trace, event, sample);
  	}
 =20
  	if (trace->nr_events_printed >=3D trace->max_events && trace->max_events=
 !=3D ULONG_MAX)
@@@ -5429,6 -5466,7 +5468,7 @@@ int cmd_trace(int argc, const char **ar
  	OPT_CALLBACK('m', "mmap-pages", &trace.opts.mmap_pages, "pages",
  		     "number of mmap data pages", evlist__parse_mmap_pages),
  	OPT_STRING('u', "uid", &trace.uid_str, "user", "user to profile"),
+ 	OPT_BOOLEAN(0, "show-cpu", &trace.show_cpu, "show cpu id"),
  	OPT_CALLBACK(0, "duration", &trace, "float",
  		     "show only events with duration > N.M ms",
  		     trace__set_duration),
@@@ -5563,6 -5601,9 +5603,9 @@@
  			goto out;
  	}
 =20
+ 	if (trace.show_cpu)
+ 		trace.opts.sample_cpu =3D true;
+=20
  	if ((nr_cgroups || trace.cgroup) && !trace.opts.target.system_wide) {
  		usage_with_options_msg(trace_usage, trace_options,
  				       "cgroup monitoring only available in system-wide mode");
@@@ -60,12 -60,13 +60,13 @@@
  #include "callchain.h"
  #include "print_binary.h"
  #include "string2.h"
- #include "syscalltbl.h"
+ #include "trace/beauty/syscalltbl.h"
  #include "../perf.h"
  #include "trace_augment.h"
  #include "dwarf-regs.h"
 =20
  #include <errno.h>
+ #include <sys/stat.h>
  #include <inttypes.h>
  #include <poll.h>
  #include <signal.h>
@@@ -217,6 -218,7 +218,7 @@@ struct trace=20
  	bool			kernel_syscallchains;
  	s16			args_alignment;
  	bool			show_tstamp;
+ 	bool			show_cpu;
  	bool			show_duration;
  	bool			show_zeros;
  	bool			show_arg_names;
@@@ -234,6 -236,16 +236,16 @@@
  	const char		*uid_str;
  };
 =20
+ bool trace__show_zeros(const struct trace *trace)
+ {
+ 	return trace->show_zeros;
+ }
+=20
+ struct machine *trace__host(const struct trace *trace)
+ {
+ 	return trace->host;
+ }
+=20
  static void trace__load_vmlinux_btf(struct trace *trace __maybe_unused)
  {
  #ifdef HAVE_LIBBPF_SUPPORT
@@@ -535,12 -547,12 +547,12 @@@ out_delete
  	return NULL;
  }
 =20
- #define perf_evsel__sc_tp_uint(evsel, name, sample) \
- 	({ struct syscall_tp *fields =3D __evsel__syscall_tp(evsel); \
+ #define perf_evsel__sc_tp_uint(name, sample) \
+ 	({ struct syscall_tp *fields =3D __evsel__syscall_tp(sample->evsel); \
  	   fields->name.integer(&fields->name, sample); })
 =20
- #define perf_evsel__sc_tp_ptr(evsel, name, sample) \
- 	({ struct syscall_tp *fields =3D __evsel__syscall_tp(evsel); \
+ #define perf_evsel__sc_tp_ptr(name, sample) \
+ 	({ struct syscall_tp *fields =3D __evsel__syscall_tp(sample->evsel); \
  	   fields->name.pointer(&fields->name, sample); })
 =20
  size_t strarray__scnprintf_suffix(struct strarray *sa, char *bf, size_t s=
ize, const char *intfmt, bool show_suffix, int val)
@@@ -771,9 -783,10 +783,10 @@@ static const char *bpf_cmd[] =3D=20
  };
  static DEFINE_STRARRAY(bpf_cmd, "BPF_");
 =20
- #include "trace/beauty/generated/fsconfig_arrays.c"
-=20
- static DEFINE_STRARRAY(fsconfig_cmds, "FSCONFIG_");
+ static const char *fsmount_flags[] =3D {
+ 	[1] =3D "CLOEXEC",
+ };
+ static DEFINE_STRARRAY(fsmount_flags, "FSMOUNT_");
 =20
  static const char *epoll_ctl_ops[] =3D { "ADD", "DEL", "MOD", };
  static DEFINE_STRARRAY_OFFSET(epoll_ctl_ops, "EPOLL_CTL_", 1);
@@@ -1123,21 -1136,6 +1136,6 @@@ static bool syscall_arg__strtoul_btf_ty
  	    .parm	=3D &strarray__##array, \
  	    .show_zero	=3D true, }
 =20
- #include "trace/beauty/eventfd.c"
- #include "trace/beauty/futex_op.c"
- #include "trace/beauty/futex_val3.c"
- #include "trace/beauty/mmap.c"
- #include "trace/beauty/mode_t.c"
- #include "trace/beauty/msg_flags.c"
- #include "trace/beauty/open_flags.c"
- #include "trace/beauty/perf_event_open.c"
- #include "trace/beauty/pid.c"
- #include "trace/beauty/sched_policy.c"
- #include "trace/beauty/seccomp.c"
- #include "trace/beauty/signum.c"
- #include "trace/beauty/socket_type.c"
- #include "trace/beauty/waitid_options.c"
-=20
  static const struct syscall_fmt syscall_fmts[] =3D {
  	{ .name	    =3D "access",
  	  .arg =3D { [1] =3D { .scnprintf =3D SCA_ACCMODE,  /* mode */ }, }, },
@@@ -1197,9 -1195,7 +1195,9 @@@
  	{ .name     =3D "fsconfig",
  	  .arg =3D { [1] =3D STRARRAY(cmd, fsconfig_cmds), }, },
  	{ .name     =3D "fsmount",
 -	  .arg =3D { [1] =3D STRARRAY_FLAGS(flags, fsmount_flags),
 +	  .arg =3D { [1] =3D { .scnprintf =3D SCA_FSMOUNT_FLAGS, /* fsmount_flag=
s */
 +			   .strtoul   =3D STUL_STRARRAYS,
 +			   .show_zero =3D true, },
  		   [2] =3D { .scnprintf =3D SCA_FSMOUNT_ATTR_FLAGS, /* attr_flags */ },=
 }, },
  	{ .name     =3D "fspick",
  	  .arg =3D { [0] =3D { .scnprintf =3D SCA_FDAT,	  /* dfd */ },
@@@ -1528,6 -1524,7 +1526,7 @@@ static size_t fprintf_duration(unsigne
   */
  struct thread_trace {
  	u64		  entry_time;
+ 	u32		  entry_cpu;
  	bool		  entry_pending;
  	unsigned long	  nr_events;
  	unsigned long	  pfmaj, pfmin;
@@@ -1890,6 -1887,27 +1889,27 @@@ static size_t trace__fprintf_tstamp(str
  	return fprintf(fp, "         ? ");
  }
 =20
+ /**
+  * trace__fprintf_cpu - Print the CPU ID to a given file stream
+  * @cpu: The CPU ID to print
+  * @fp: The file stream to write to
+  *
+  * Formats and prints the specified CPU ID enclosed in brackets
+  * (e.g., "[003] ") to the provided file pointer. It is used to
+  * align and display the CPU ID consistently within the trace output.
+  *
+  * Return: The number of characters printed.
+  */
+ static size_t trace__fprintf_cpu(u32 cpu, FILE *fp)
+ {
+ 	size_t printed =3D 0;
+=20
+ 	if (cpu !=3D (u32)-1)
+ 		printed +=3D fprintf(fp, "[%03u] ", cpu);
+=20
+ 	return printed;
+ }
+=20
  static pid_t workload_pid =3D -1;
  static volatile sig_atomic_t done =3D false;
  static volatile sig_atomic_t interrupted =3D false;
@@@ -1920,12 -1938,15 +1940,15 @@@ static size_t trace__fprintf_comm_tid(s
  }
 =20
  static size_t trace__fprintf_entry_head(struct trace *trace, struct threa=
d *thread,
- 					u64 duration, bool duration_calculated, u64 tstamp, FILE *fp)
+ 					u64 duration, bool duration_calculated,
+ 					u64 tstamp, u32 cpu, FILE *fp)
  {
  	size_t printed =3D 0;
 =20
  	if (trace->show_tstamp)
  		printed =3D trace__fprintf_tstamp(trace, tstamp, fp);
+ 	if (trace->show_cpu && cpu !=3D (u32)-1)
+ 		printed +=3D trace__fprintf_cpu(cpu, fp);
  	if (trace->show_duration)
  		printed +=3D fprintf_duration(duration, duration_calculated, fp);
  	return printed + trace__fprintf_comm_tid(trace, thread, fp);
@@@ -2579,7 -2600,7 +2602,7 @@@ static struct syscall *trace__find_sysc
  	return sc;
  }
 =20
- typedef int (*tracepoint_handler)(struct trace *trace, struct evsel *evse=
l,
+ typedef int (*tracepoint_handler)(struct trace *trace,
  				  union perf_event *event,
  				  struct perf_sample *sample);
 =20
@@@ -2704,7 -2725,9 +2727,9 @@@ static int trace__printf_interrupted_en
  	if (!ttrace->entry_pending)
  		return 0;
 =20
- 	printed  =3D trace__fprintf_entry_head(trace, trace->current, 0, false, =
ttrace->entry_time, trace->output);
+ 	printed =3D trace__fprintf_entry_head(trace, trace->current, 0, false,
+ 					    ttrace->entry_time, ttrace->entry_cpu,
+ 					    trace->output);
  	printed +=3D len =3D fprintf(trace->output, "%s)", ttrace->entry_str);
 =20
  	if (len < trace->args_alignment - 4)
@@@ -2718,8 -2741,8 +2743,8 @@@
  	return printed;
  }
 =20
- static int trace__fprintf_sample(struct trace *trace, struct evsel *evsel,
- 				 struct perf_sample *sample, struct thread *thread)
+ static int trace__fprintf_sample(struct trace *trace, struct perf_sample =
*sample,
+ 				 struct thread *thread)
  {
  	int printed =3D 0;
 =20
@@@ -2727,7 -2750,7 +2752,7 @@@
  		double ts =3D (double)sample->time / NSEC_PER_MSEC;
 =20
  		printed +=3D fprintf(trace->output, "%22s %10.3f %s %d/%d [%d]\n",
- 				   evsel__name(evsel), ts,
+ 				   evsel__name(sample->evsel), ts,
  				   thread__comm_str(thread),
  				   sample->pid, sample->tid, sample->cpu);
  	}
@@@ -2774,15 -2797,16 +2799,16 @@@ static void *syscall__augmented_args(st
  	return NULL;
  }
 =20
- static int trace__sys_enter(struct trace *trace, struct evsel *evsel,
+ static int trace__sys_enter(struct trace *trace,
  			    union perf_event *event __maybe_unused,
  			    struct perf_sample *sample)
  {
+ 	struct evsel *evsel =3D sample->evsel;
  	char *msg;
  	void *args;
  	int printed =3D 0;
  	struct thread *thread;
- 	int id =3D perf_evsel__sc_tp_uint(evsel, id, sample), err =3D -1;
+ 	int id =3D perf_evsel__sc_tp_uint(id, sample), err =3D -1;
  	int augmented_args_size =3D 0, e_machine;
  	void *augmented_args =3D NULL;
  	struct syscall *sc;
@@@ -2797,9 -2821,9 +2823,9 @@@
  	if (ttrace =3D=3D NULL)
  		goto out_put;
 =20
- 	trace__fprintf_sample(trace, evsel, sample, thread);
+ 	trace__fprintf_sample(trace, sample, thread);
 =20
- 	args =3D perf_evsel__sc_tp_ptr(evsel, args, sample);
+ 	args =3D perf_evsel__sc_tp_ptr(args, sample);
 =20
  	if (ttrace->entry_str =3D=3D NULL) {
  		ttrace->entry_str =3D malloc(trace__entry_str_size);
@@@ -2822,6 -2846,7 +2848,7 @@@
  	if (evsel !=3D trace->syscalls.events.sys_enter)
  		augmented_args =3D syscall__augmented_args(sc, sample, &augmented_args_=
size, trace->raw_augmented_syscalls_args_size);
  	ttrace->entry_time =3D sample->time;
+ 	ttrace->entry_cpu =3D sample->cpu;
  	msg =3D ttrace->entry_str;
  	printed +=3D scnprintf(msg + printed, trace__entry_str_size - printed, "=
%s(", sc->name);
 =20
@@@ -2832,7 -2857,9 +2859,9 @@@
  		if (!(trace->duration_filter || trace->summary_only || trace->failure_o=
nly || trace->min_stack)) {
  			int alignment =3D 0;
 =20
- 			trace__fprintf_entry_head(trace, thread, 0, false, ttrace->entry_time,=
 trace->output);
+ 			trace__fprintf_entry_head(trace, thread, 0, false,
+ 						  ttrace->entry_time,
+ 						  sample->cpu, trace->output);
  			printed =3D fprintf(trace->output, "%s)", ttrace->entry_str);
  			if (trace->args_alignment > printed)
  				alignment =3D trace->args_alignment - printed;
@@@ -2854,12 -2881,11 +2883,11 @@@ out_put
  	return err;
  }
 =20
- static int trace__fprintf_sys_enter(struct trace *trace, struct evsel *ev=
sel,
- 				    struct perf_sample *sample)
+ static int trace__fprintf_sys_enter(struct trace *trace, struct perf_samp=
le *sample)
  {
  	struct thread_trace *ttrace;
  	struct thread *thread;
- 	int id =3D perf_evsel__sc_tp_uint(evsel, id, sample), err =3D -1;
+ 	int id =3D perf_evsel__sc_tp_uint(id, sample), err =3D -1;
  	struct syscall *sc;
  	char msg[1024];
  	void *args, *augmented_args =3D NULL;
@@@ -2869,7 -2895,7 +2897,7 @@@
 =20
  	thread =3D machine__findnew_thread(trace->host, sample->pid, sample->tid=
);
  	e_machine =3D thread__e_machine(thread, trace->host, /*e_flags=3D*/NULL);
- 	sc =3D trace__syscall_info(trace, evsel, e_machine, id);
+ 	sc =3D trace__syscall_info(trace, sample->evsel, e_machine, id);
  	if (sc =3D=3D NULL)
  		goto out_put;
  	ttrace =3D thread__trace(thread, trace);
@@@ -2880,7 -2906,7 +2908,7 @@@
  	if (ttrace =3D=3D NULL)
  		goto out_put;
 =20
- 	args =3D perf_evsel__sc_tp_ptr(evsel, args, sample);
+ 	args =3D perf_evsel__sc_tp_ptr(args, sample);
  	augmented_args =3D syscall__augmented_args(sc, sample, &augmented_args_s=
ize, trace->raw_augmented_syscalls_args_size);
  	printed +=3D syscall__scnprintf_args(sc, msg, sizeof(msg), args, augment=
ed_args, augmented_args_size, trace, thread);
  	fprintf(trace->output, "%.*s", (int)printed, msg);
@@@ -2890,10 -2916,11 +2918,11 @@@ out_put
  	return err;
  }
 =20
- static int trace__resolve_callchain(struct trace *trace, struct evsel *ev=
sel,
+ static int trace__resolve_callchain(struct trace *trace,
  				    struct perf_sample *sample,
  				    struct callchain_cursor *cursor)
  {
+ 	struct evsel *evsel =3D sample->evsel;
  	struct addr_location al;
  	int max_stack =3D evsel->core.attr.sample_max_stack ?
  			evsel->core.attr.sample_max_stack :
@@@ -2904,7 -2931,7 +2933,7 @@@
  	if (machine__resolve(trace->host, &al, sample) < 0)
  		goto out;
 =20
- 	err =3D thread__resolve_callchain(al.thread, cursor, evsel, sample, NULL=
, NULL, max_stack);
+ 	err =3D thread__resolve_callchain(al.thread, cursor, sample, NULL, NULL,=
 max_stack);
  out:
  	addr_location__exit(&al);
  	return err;
@@@ -2920,15 -2947,16 +2949,16 @@@ static int trace__fprintf_callchain(str
  	return sample__fprintf_callchain(sample, 38, print_opts, get_tls_callcha=
in_cursor(), symbol_conf.bt_stop_list, trace->output);
  }
 =20
- static int trace__sys_exit(struct trace *trace, struct evsel *evsel,
+ static int trace__sys_exit(struct trace *trace,
  			   union perf_event *event __maybe_unused,
  			   struct perf_sample *sample)
  {
+ 	struct evsel *evsel =3D sample->evsel;
  	long ret;
  	u64 duration =3D 0;
  	bool duration_calculated =3D false;
  	struct thread *thread;
- 	int id =3D perf_evsel__sc_tp_uint(evsel, id, sample), err =3D -1, callch=
ain_ret =3D 0, printed =3D 0;
+ 	int id =3D perf_evsel__sc_tp_uint(id, sample), err =3D -1, callchain_ret=
 =3D 0, printed =3D 0;
  	int alignment =3D trace->args_alignment, e_machine;
  	struct syscall *sc;
  	struct thread_trace *ttrace;
@@@ -2942,9 -2970,9 +2972,9 @@@
  	if (ttrace =3D=3D NULL)
  		goto out_put;
 =20
- 	trace__fprintf_sample(trace, evsel, sample, thread);
+ 	trace__fprintf_sample(trace, sample, thread);
 =20
- 	ret =3D perf_evsel__sc_tp_uint(evsel, ret, sample);
+ 	ret =3D perf_evsel__sc_tp_uint(ret, sample);
 =20
  	if (trace->summary)
  		thread__update_stats(thread, ttrace, id, sample, ret, trace);
@@@ -2966,7 -2994,7 +2996,7 @@@
  	if (sample->callchain) {
  		struct callchain_cursor *cursor =3D get_tls_callchain_cursor();
 =20
- 		callchain_ret =3D trace__resolve_callchain(trace, evsel, sample, cursor=
);
+ 		callchain_ret =3D trace__resolve_callchain(trace, sample, cursor);
  		if (callchain_ret =3D=3D 0) {
  			if (cursor->nr < trace->min_stack)
  				goto out;
@@@ -2977,7 -3005,9 +3007,9 @@@
  	if (trace->summary_only || (ret >=3D 0 && trace->failure_only))
  		goto out;
 =20
- 	trace__fprintf_entry_head(trace, thread, duration, duration_calculated, =
ttrace->entry_time, trace->output);
+ 	trace__fprintf_entry_head(trace, thread, duration,
+ 				  duration_calculated, ttrace->entry_time,
+ 				  sample->cpu, trace->output);
 =20
  	if (ttrace->entry_pending) {
  		printed =3D fprintf(trace->output, "%s", ttrace->entry_str);
@@@ -3058,7 -3088,7 +3090,7 @@@ out_put
  	return err;
  }
 =20
- static int trace__vfs_getname(struct trace *trace, struct evsel *evsel,
+ static int trace__vfs_getname(struct trace *trace,
  			      union perf_event *event __maybe_unused,
  			      struct perf_sample *sample)
  {
@@@ -3067,7 -3097,7 +3099,7 @@@
  	size_t filename_len, entry_str_len, to_move;
  	ssize_t remaining_space;
  	char *pos;
- 	const char *filename =3D evsel__rawptr(evsel, sample, "pathname");
+ 	const char *filename =3D perf_sample__strval(sample, "pathname");
 =20
  	if (!thread)
  		goto out;
@@@ -3119,11 -3149,11 +3151,11 @@@ out
  	return 0;
  }
 =20
- static int trace__sched_stat_runtime(struct trace *trace, struct evsel *e=
vsel,
+ static int trace__sched_stat_runtime(struct trace *trace,
  				     union perf_event *event __maybe_unused,
  				     struct perf_sample *sample)
  {
-         u64 runtime =3D evsel__intval(evsel, sample, "runtime");
+ 	u64 runtime =3D perf_sample__intval(sample, "runtime");
  	double runtime_ms =3D (double)runtime / NSEC_PER_MSEC;
  	struct thread *thread =3D machine__findnew_thread(trace->host,
  							sample->pid,
@@@ -3141,11 -3171,11 +3173,11 @@@ out_put
 =20
  out_dump:
  	fprintf(trace->output, "%s: comm=3D%s,pid=3D%u,runtime=3D%" PRIu64 ",vru=
ntime=3D%" PRIu64 ")\n",
- 	       evsel->name,
- 	       evsel__strval(evsel, sample, "comm"),
- 	       (pid_t)evsel__intval(evsel, sample, "pid"),
+ 	       sample->evsel->name,
+ 	       perf_sample__strval(sample, "comm"),
+ 	       (pid_t)perf_sample__intval(sample, "pid"),
  	       runtime,
- 	       evsel__intval(evsel, sample, "vruntime"));
+ 	       perf_sample__intval(sample, "vruntime"));
  	goto out_put;
  }
 =20
@@@ -3181,9 -3211,10 +3213,10 @@@ static void bpf_output__fprintf(struct=20
  	++trace->nr_events_printed;
  }
 =20
- static size_t trace__fprintf_tp_fields(struct trace *trace, struct evsel =
*evsel, struct perf_sample *sample,
+ static size_t trace__fprintf_tp_fields(struct trace *trace, struct perf_s=
ample *sample,
  				       struct thread *thread, void *augmented_args, int augmented_arg=
s_size)
  {
+ 	struct evsel *evsel =3D sample->evsel;
  	char bf[2048];
  	size_t size =3D sizeof(bf);
  	const struct tep_event *tp_format =3D evsel__tp_format(evsel);
@@@ -3251,10 -3282,11 +3284,11 @@@
  	return fprintf(trace->output, "%.*s", (int)printed, bf);
  }
 =20
- static int trace__event_handler(struct trace *trace, struct evsel *evsel,
+ static int trace__event_handler(struct trace *trace,
  				union perf_event *event __maybe_unused,
  				struct perf_sample *sample)
  {
+ 	struct evsel *evsel =3D sample->evsel;
  	struct thread *thread;
  	int callchain_ret =3D 0;
 =20
@@@ -3266,7 -3298,7 +3300,7 @@@
  	if (sample->callchain) {
  		struct callchain_cursor *cursor =3D get_tls_callchain_cursor();
 =20
- 		callchain_ret =3D trace__resolve_callchain(trace, evsel, sample, cursor=
);
+ 		callchain_ret =3D trace__resolve_callchain(trace, sample, cursor);
  		if (callchain_ret =3D=3D 0) {
  			if (cursor->nr < trace->min_stack)
  				goto out;
@@@ -3277,6 -3309,9 +3311,9 @@@
  	trace__printf_interrupted_entry(trace);
  	trace__fprintf_tstamp(trace, sample->time, trace->output);
 =20
+ 	if (trace->show_cpu)
+ 		trace__fprintf_cpu(sample->cpu, trace->output);
+=20
  	if (trace->trace_syscalls && trace->show_duration)
  		fprintf(trace->output, "(         ): ");
 =20
@@@ -3284,7 -3319,7 +3321,7 @@@
  		trace__fprintf_comm_tid(trace, thread, trace->output);
 =20
  	if (evsel =3D=3D trace->syscalls.events.bpf_output) {
- 		int id =3D perf_evsel__sc_tp_uint(evsel, id, sample);
+ 		int id =3D perf_evsel__sc_tp_uint(id, sample);
  		int e_machine =3D thread
  			? thread__e_machine(thread, trace->host, /*e_flags=3D*/NULL)
  			: EM_HOST;
@@@ -3292,7 -3327,7 +3329,7 @@@
 =20
  		if (sc) {
  			fprintf(trace->output, "%s(", sc->name);
- 			trace__fprintf_sys_enter(trace, evsel, sample);
+ 			trace__fprintf_sys_enter(trace, sample);
  			fputc(')', trace->output);
  			goto newline;
  		}
@@@ -3312,13 -3347,13 +3349,13 @@@
  		const struct tep_event *tp_format =3D evsel__tp_format(evsel);
 =20
  		if (tp_format && (strncmp(tp_format->name, "sys_enter_", 10) ||
- 				  trace__fprintf_sys_enter(trace, evsel, sample))) {
+ 				  trace__fprintf_sys_enter(trace, sample))) {
  			if (trace->libtraceevent_print) {
  				event_format__fprintf(tp_format, sample->cpu,
  						      sample->raw_data, sample->raw_size,
  						      trace->output);
  			} else {
- 				trace__fprintf_tp_fields(trace, evsel, sample, thread, NULL, 0);
+ 				trace__fprintf_tp_fields(trace, sample, thread, NULL, 0);
  			}
  		}
  	}
@@@ -3360,7 -3395,6 +3397,6 @@@ static void print_location(FILE *f, str
  }
 =20
  static int trace__pgfault(struct trace *trace,
- 			  struct evsel *evsel,
  			  union perf_event *event __maybe_unused,
  			  struct perf_sample *sample)
  {
@@@ -3377,7 -3411,7 +3413,7 @@@
  	if (sample->callchain) {
  		struct callchain_cursor *cursor =3D get_tls_callchain_cursor();
 =20
- 		callchain_ret =3D trace__resolve_callchain(trace, evsel, sample, cursor=
);
+ 		callchain_ret =3D trace__resolve_callchain(trace, sample, cursor);
  		if (callchain_ret =3D=3D 0) {
  			if (cursor->nr < trace->min_stack)
  				goto out_put;
@@@ -3389,7 -3423,7 +3425,7 @@@
  	if (ttrace =3D=3D NULL)
  		goto out_put;
 =20
- 	if (evsel->core.attr.config =3D=3D PERF_COUNT_SW_PAGE_FAULTS_MAJ) {
+ 	if (sample->evsel->core.attr.config =3D=3D PERF_COUNT_SW_PAGE_FAULTS_MAJ=
) {
  		ttrace->pfmaj++;
  		trace->pfmaj++;
  	} else {
@@@ -3402,10 -3436,11 +3438,11 @@@
 =20
  	thread__find_symbol(thread, sample->cpumode, sample->ip, &al);
 =20
- 	trace__fprintf_entry_head(trace, thread, 0, true, sample->time, trace->o=
utput);
+ 	trace__fprintf_entry_head(trace, thread, 0, true, sample->time,
+ 				  sample->cpu, trace->output);
 =20
  	fprintf(trace->output, "%sfault [",
- 		evsel->core.attr.config =3D=3D PERF_COUNT_SW_PAGE_FAULTS_MAJ ?
+ 		sample->evsel->core.attr.config =3D=3D PERF_COUNT_SW_PAGE_FAULTS_MAJ ?
  		"maj" : "min");
 =20
  	print_location(trace->output, sample, &al, false, true);
@@@ -3430,7 -3465,8 +3467,8 @@@
  	if (callchain_ret > 0)
  		trace__fprintf_callchain(trace, sample);
  	else if (callchain_ret < 0)
- 		pr_err("Problem processing %s callchain, skipping...\n", evsel__name(ev=
sel));
+ 		pr_err("Problem processing %s callchain, skipping...\n",
+ 		       evsel__name(sample->evsel));
 =20
  	++trace->nr_events_printed;
  out:
@@@ -3442,7 -3478,6 +3480,6 @@@ out_put
  }
 =20
  static void trace__set_base_time(struct trace *trace,
- 				 struct evsel *evsel,
  				 struct perf_sample *sample)
  {
  	/*
@@@ -3454,17 -3489,17 +3491,17 @@@
  	 * appears in our event stream (vfs_getname comes to mind).
  	 */
  	if (trace->base_time =3D=3D 0 && !trace->full_time &&
- 	    (evsel->core.attr.sample_type & PERF_SAMPLE_TIME))
+ 	    (sample->evsel->core.attr.sample_type & PERF_SAMPLE_TIME))
  		trace->base_time =3D sample->time;
  }
 =20
  static int trace__process_sample(const struct perf_tool *tool,
  				 union perf_event *event,
  				 struct perf_sample *sample,
- 				 struct evsel *evsel,
  				 struct machine *machine __maybe_unused)
  {
  	struct trace *trace =3D container_of(tool, struct trace, tool);
+ 	struct evsel *evsel =3D sample->evsel;
  	struct thread *thread;
  	int err =3D 0;
 =20
@@@ -3474,11 -3509,11 +3511,11 @@@
  	if (thread && thread__is_filtered(thread))
  		goto out;
 =20
- 	trace__set_base_time(trace, evsel, sample);
+ 	trace__set_base_time(trace, sample);
 =20
  	if (handler) {
  		++trace->nr_events;
- 		handler(trace, evsel, event, sample);
+ 		handler(trace, event, sample);
  	}
  out:
  	thread__put(thread);
@@@ -3620,32 -3655,34 +3657,34 @@@ static void evlist__free_syscall_tp_fie
  static void trace__handle_event(struct trace *trace, union perf_event *ev=
ent, struct perf_sample *sample)
  {
  	const u32 type =3D event->header.type;
- 	struct evsel *evsel;
 =20
  	if (type !=3D PERF_RECORD_SAMPLE) {
  		trace__process_event(trace, trace->host, event, sample);
  		return;
  	}
 =20
- 	evsel =3D evlist__id2evsel(trace->evlist, sample->id);
- 	if (evsel =3D=3D NULL) {
+ 	if (sample->evsel =3D=3D NULL)
+ 		sample->evsel =3D evlist__id2evsel(trace->evlist, sample->id);
+=20
+ 	if (sample->evsel =3D=3D NULL) {
  		fprintf(trace->output, "Unknown tp ID %" PRIu64 ", skipping...\n", samp=
le->id);
  		return;
  	}
 =20
- 	if (evswitch__discard(&trace->evswitch, evsel))
+ 	if (evswitch__discard(&trace->evswitch, sample->evsel))
  		return;
 =20
- 	trace__set_base_time(trace, evsel, sample);
+ 	trace__set_base_time(trace, sample);
 =20
- 	if (evsel->core.attr.type =3D=3D PERF_TYPE_TRACEPOINT &&
+ 	if (sample->evsel->core.attr.type =3D=3D PERF_TYPE_TRACEPOINT &&
  	    sample->raw_data =3D=3D NULL) {
  		fprintf(trace->output, "%s sample with no payload for tid: %d, cpu %d, =
raw_size=3D%d, skipping...\n",
- 		       evsel__name(evsel), sample->tid,
+ 		       evsel__name(sample->evsel), sample->tid,
  		       sample->cpu, sample->raw_size);
  	} else {
- 		tracepoint_handler handler =3D evsel->handler;
- 		handler(trace, evsel, event, sample);
+ 		tracepoint_handler handler =3D sample->evsel->handler;
+=20
+ 		handler(trace, event, sample);
  	}
 =20
  	if (trace->nr_events_printed >=3D trace->max_events && trace->max_events=
 !=3D ULONG_MAX)
@@@ -5429,6 -5466,7 +5468,7 @@@ int cmd_trace(int argc, const char **ar
  	OPT_CALLBACK('m', "mmap-pages", &trace.opts.mmap_pages, "pages",
  		     "number of mmap data pages", evlist__parse_mmap_pages),
  	OPT_STRING('u', "uid", &trace.uid_str, "user", "user to profile"),
+ 	OPT_BOOLEAN(0, "show-cpu", &trace.show_cpu, "show cpu id"),
  	OPT_CALLBACK(0, "duration", &trace, "float",
  		     "show only events with duration > N.M ms",
  		     trace__set_duration),
@@@ -5563,6 -5601,9 +5603,9 @@@
  			goto out;
  	}
 =20
+ 	if (trace.show_cpu)
+ 		trace.opts.sample_cpu =3D true;
+=20
  	if ((nr_cgroups || trace.cgroup) && !trace.opts.target.system_wide) {
  		usage_with_options_msg(trace_usage, trace_options,
  				       "cgroup monitoring only available in system-wide mode");

--WmCqk0KVobSimN1K
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoO3AIACgkQJNaLcl1U
h9AqvAf/QQyLe5/ZzHcDq0CBDICCSR5MAYP2YSOa/Zzkt7yHpycZtsPh+4vBF/nf
v1CxuBtymriEdWjClHsj0DomaKODQSsjFz0T5yvKxdz7r8hCSzTdmj8a5QEkLpI9
KVGU7g075yKA9O3JVpPrxvVLJLV622VnRz5Fy6UPyjunRQ1g2MQiviN39kxV+vKK
nyhqf3FwHSElqGHjRk2zU/1Y5cCC8cwKYwoZhp/kqVSOKBwzipj+myltr7zQF/Kj
6d8dLPxHojFofvwU60B0qinuViTg7+ikeYjIUeb4at+P0tKethf7OITxm5NBagbt
Eb031jh0pfmHYyzfE5/cN83S4ndh6A==
=4EeU
-----END PGP SIGNATURE-----

--WmCqk0KVobSimN1K--
