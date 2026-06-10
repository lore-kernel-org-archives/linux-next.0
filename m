Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6478A2F8EB5;
	Wed, 10 Jun 2026 15:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781105609; cv=none; b=GgyLaxnZNnBYuloj1thNPd5QwNcJ5iMHdBdenK56F1a4ebHVnHbjcLSedNtE6GB7f0+P1ayecg97U9Znn6BI/QbkLtFQZKJ9fcOkDXt718jVpApKZTzoT5wNmOKMIt2r4NWwUqo2Egmrp7flubrtJZQXty3u/SglVKMNd9WwYfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781105609; c=relaxed/simple;
	bh=SeyB07m3rG1Jm4hudcx+pL8cMd53wlUl4u8f+/FhqO0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=u8cM90MY1i8OVQWjGgOouSH8uVhgI8602AeYEwd4E3AWJDwqS0u4t1qTFeC1CQpgiMs7DXyR418moRMzyGXDzbz7X7RfIO1K1z5InEh5X0Mm7DJlyB1CZ9EfU8S6knA0oIQLHRbfsjEq4LYe6WcQQHadOPSSa670ajfNqiVdpoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kZ9DW+7m; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kZ9DW+7m"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 660891F00893;
	Wed, 10 Jun 2026 15:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781105606;
	bh=sud4oIkzxhAzqNf2o7TN//tJW/86RNPFFexGGgJXX08=;
	h=Date:From:To:Cc:Subject;
	b=kZ9DW+7mslU4gYMS+o5cnxpS214a1m3dmM7OamSswDeNPCNgi71mrwgWiQBvfItPL
	 wFqyD8xR4HCq93xuRlGHD/Oty/mHMZLb8iTKL9najrKp9WcczO5m9HqpxaObShhaK9
	 YvFEQZxLRAJGnFfUnBEQr7XlODic/BQ+M+STHj306vKyxHea0GvS5mV0yy3fKI2AS9
	 yZ4Z3wufJ8rkbeWCdxgTtQ3HINIRKl4Gs8OBE479hRju+Ee7rWkQRrAMd60ezeBRzO
	 ybabyH16JRbdUC1ocEfsVm+NGZ6PvvBnLE4KcOxGPjFQpIuH+YHuIfq1Nxn923E3JY
	 mtW/EP/C8bMCA==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 7C5951AC56C5; Wed, 10 Jun 2026 16:33:22 +0100 (BST)
Date: Wed, 10 Jun 2026 16:33:22 +0100
From: Mark Brown <broonie@kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>
Cc: Costa Shulyupin <costa.shul@redhat.com>,
	Crystal Wood <crwood@redhat.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Tomas Glozar <tglozar@redhat.com>
Subject: linux-next: manual merge of the ftrace tree with the tip-fixes tree
Message-ID: <aimDwlNq_RRLjg6X@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7uHLi7/+eEo7Ny29"
Content-Disposition: inline


--7uHLi7/+eEo7Ny29
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the ftrace tree got conflicts in:

  tools/tracing/rtla/src/common.c
  tools/tracing/rtla/src/common.h
  tools/tracing/rtla/src/osnoise_hist.c
  tools/tracing/rtla/src/osnoise_top.c
  tools/tracing/rtla/src/timerlat_hist.c
  tools/tracing/rtla/src/timerlat_top.c

between commit:

  e9e41d3035032e ("rtla: Fix parsing of multi-character short options")

=66rom the tip-fixes tree and commits:

  704fe8f3d97bba ("tools/rtla: Fix --dump-tasks usage in timerlat")
  f03a59f949176c ("rtla: Stop the record trace on interrupt")
  5d9af63e80b5a2 ("rtla: Parse cmdline using libsubcmd")
  03d745b9843560 ("rtla/timerlat: Add -A/--aligned CLI option")

=66rom the ftrace tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --combined tools/tracing/rtla/src/common.c
index bc9d01ddd10295,d0a8a6edbf0cba..00000000000000
--- a/tools/tracing/rtla/src/common.c
+++ b/tools/tracing/rtla/src/common.c
@@@ -5,12 -5,11 +5,11 @@@
  #include <signal.h>
  #include <stdlib.h>
  #include <string.h>
- #include <getopt.h>
  #include <sys/sysinfo.h>
 =20
  #include "common.h"
 =20
- struct trace_instance *trace_inst;
+ struct osnoise_tool *trace_tool;
  volatile int stop_tracing;
  int nr_cpus;
 =20
@@@ -21,12 -20,16 +20,16 @@@ static void stop_trace(int sig
  		 * Stop requested twice in a row; abort event processing and
  		 * exit immediately
  		 */
- 		tracefs_iterate_stop(trace_inst->inst);
+ 		if (trace_tool)
+ 			tracefs_iterate_stop(trace_tool->trace.inst);
  		return;
  	}
  	stop_tracing =3D 1;
- 	if (trace_inst)
- 		trace_instance_stop(trace_inst);
+ 	if (trace_tool) {
+ 		trace_instance_stop(&trace_tool->trace);
+ 		if (trace_tool->record)
+ 			trace_instance_stop(&trace_tool->record->trace);
+ 	}
  }
 =20
  /*
@@@ -53,96 -56,6 +56,6 @@@ static void unset_signals(struct common
  	}
  }
 =20
- /*
-  * getopt_auto - auto-generates optstring from long_options
-  */
- int getopt_auto(int argc, char **argv, const struct option *long_opts)
- {
- 	char opts[256];
- 	int n =3D 0;
-=20
- 	for (int i =3D 0; long_opts[i].name; i++) {
- 		if (long_opts[i].val < 32 || long_opts[i].val > 127)
- 			continue;
-=20
- 		if (n + 4 >=3D sizeof(opts))
- 			fatal("optstring buffer overflow");
-=20
- 		opts[n++] =3D long_opts[i].val;
-=20
- 		if (long_opts[i].has_arg =3D=3D required_argument)
- 			opts[n++] =3D ':';
- 		else if (long_opts[i].has_arg =3D=3D optional_argument) {
- 			opts[n++] =3D ':';
- 			opts[n++] =3D ':';
- 		}
- 	}
-=20
- 	opts[n] =3D '\0';
-=20
- 	return getopt_long(argc, argv, opts, long_opts, NULL);
- }
-=20
- /*
-  * set_common_option - set common options
-  *
-  * @c: option character
-  * @argc: argument count
-  * @argv: argument vector
-  * @common: common parameters structure
-  *
-  * Parse command line options that are common to all rtla tools.
-  *
-  * Returns: 1 if the option was set, 0 otherwise.
-  */
- int set_common_option(int c, int argc, char **argv, struct common_params =
*common)
- {
- 	struct trace_events *tevent;
-=20
- 	switch (c) {
- 	case 'c':
- 		if (parse_cpu_set(optarg, &common->monitored_cpus))
- 			fatal("Invalid -c cpu list");
- 		common->cpus =3D optarg;
- 		break;
- 	case 'C':
- 		common->cgroup =3D 1;
- 		common->cgroup_name =3D parse_optional_arg(argc, argv);
- 		break;
- 	case 'D':
- 		config_debug =3D 1;
- 		break;
- 	case 'd':
- 		common->duration =3D parse_seconds_duration(optarg);
- 		if (!common->duration)
- 			fatal("Invalid -d duration");
- 		break;
- 	case 'e':
- 		tevent =3D trace_event_alloc(optarg);
- 		if (!tevent)
- 			fatal("Error alloc trace event");
-=20
- 		if (common->events)
- 			tevent->next =3D common->events;
- 		common->events =3D tevent;
- 		break;
- 	case 'H':
- 		common->hk_cpus =3D 1;
- 		if (parse_cpu_set(optarg, &common->hk_cpu_set))
- 			fatal("Error parsing house keeping CPUs");
- 		break;
- 	case 'P':
- 		if (parse_prio(optarg, &common->sched_param) =3D=3D -1)
- 			fatal("Invalid -P priority");
- 		common->set_sched =3D 1;
- 		break;
- 	default:
- 		return 0;
- 	}
-=20
- 	return 1;
- }
-=20
  /*
   * common_apply_config - apply common configs to the initialized tool
   */
@@@ -255,11 -168,10 +168,10 @@@ int run_tool(struct tool_ops *ops, int=20
  	tool->params =3D params;
 =20
  	/*
- 	 * Save trace instance into global variable so that SIGINT can stop
- 	 * the timerlat tracer.
+ 	 * Expose the tool to signal handlers so they can stop the trace.
  	 * Otherwise, rtla could loop indefinitely when overloaded.
  	 */
- 	trace_inst =3D &tool->trace;
+ 	trace_tool =3D tool;
 =20
  	retval =3D ops->apply_config(tool);
  	if (retval) {
@@@ -267,7 -179,7 +179,7 @@@
  		goto out_free;
  	}
 =20
- 	retval =3D enable_tracer_by_name(trace_inst->inst, ops->tracer);
+ 	retval =3D enable_tracer_by_name(tool->trace.inst, ops->tracer);
  	if (retval) {
  		err_msg("Failed to enable %s tracer\n", ops->tracer);
  		goto out_free;
diff --combined tools/tracing/rtla/src/common.h
index 8921807bda988c,04b287a03f6d4c..00000000000000
--- a/tools/tracing/rtla/src/common.h
+++ b/tools/tracing/rtla/src/common.h
@@@ -1,7 -1,6 +1,6 @@@
  /* SPDX-License-Identifier: GPL-2.0 */
  #pragma once
 =20
- #include <getopt.h>
  #include "actions.h"
  #include "timerlat_u.h"
  #include "trace.h"
@@@ -52,18 -51,25 +51,25 @@@ struct osnoise_context=20
  	/* -1 as init value because 0 is off */
  	int			orig_opt_workload;
  	int			opt_workload;
+=20
+ 	/* -1 as init value because 0 is off */
+ 	int			orig_opt_timerlat_align;
+ 	int			opt_timerlat_align;
+=20
+ 	/* 0 as init value */
+ 	unsigned long long	orig_timerlat_align_us;
+ 	unsigned long long	timerlat_align_us;
  };
 =20
- extern struct trace_instance *trace_inst;
  extern volatile int stop_tracing;
 =20
  struct hist_params {
- 	char			no_irq;
- 	char			no_thread;
- 	char			no_header;
- 	char			no_summary;
- 	char			no_index;
- 	char			with_zeros;
+ 	bool			no_irq;
+ 	bool			no_thread;
+ 	bool			no_header;
+ 	bool			no_summary;
+ 	bool			no_index;
+ 	bool			with_zeros;
  	int			bucket_size;
  	int			entries;
  };
@@@ -96,12 -102,12 +102,12 @@@ struct common_params=20
  	/* Other parameters */
  	struct hist_params	hist;
  	int			output_divisor;
- 	int			pretty_output;
- 	int			quiet;
- 	int			user_workload;
- 	int			kernel_workload;
- 	int			user_data;
- 	int			aa_only;
+ 	bool			pretty_output;
+ 	bool			quiet;
+ 	bool			user_workload;
+ 	bool			kernel_workload;
+ 	bool			user_data;
+ 	bool			aa_only;
 =20
  	struct actions		threshold_actions;
  	struct actions		end_actions;
@@@ -177,18 -183,6 +183,6 @@@ int osnoise_set_stop_us(struct osnoise_
  int osnoise_set_stop_total_us(struct osnoise_context *context,
  			      long long stop_total_us);
 =20
- int getopt_auto(int argc, char **argv, const struct option *long_opts);
-=20
- #define COMMON_OPTIONS \
- 	{"cpus",                required_argument,      0, 'c'},\
- 	{"cgroup",              optional_argument,      0, 'C'},\
- 	{"debug",               no_argument,            0, 'D'},\
- 	{"duration",            required_argument,      0, 'd'},\
- 	{"event",               required_argument,      0, 'e'},\
- 	{"house-keeping",       required_argument,      0, 'H'},\
- 	{"priority",            required_argument,      0, 'P'}
- int set_common_option(int c, int argc, char **argv, struct common_params =
*common);
-=20
  int common_apply_config(struct osnoise_tool *tool, struct common_params *=
params);
  int top_main_loop(struct osnoise_tool *tool);
  int hist_main_loop(struct osnoise_tool *tool);
diff --combined tools/tracing/rtla/src/osnoise_hist.c
index cb4ce58c598799,dfa91d0681f8fc..00000000000000
--- a/tools/tracing/rtla/src/osnoise_hist.c
+++ b/tools/tracing/rtla/src/osnoise_hist.c
@@@ -4,7 -4,6 +4,6 @@@
   */
 =20
  #define _GNU_SOURCE
- #include <getopt.h>
  #include <stdlib.h>
  #include <string.h>
  #include <signal.h>
@@@ -13,6 -12,7 +12,7 @@@
  #include <time.h>
 =20
  #include "osnoise.h"
+ #include "cli.h"
 =20
  struct osnoise_hist_cpu {
  	int			*samples;
@@@ -400,226 -400,6 +400,6 @@@ osnoise_print_stats(struct osnoise_too
  	osnoise_report_missed_events(tool);
  }
 =20
- /*
-  * osnoise_hist_usage - prints osnoise hist usage message
-  */
- static void osnoise_hist_usage(void)
- {
- 	static const char * const msg_start[] =3D {
- 		"[-D] [-d s] [-a us] [-p us] [-r us] [-s us] [-S us] \\",
- 		"	  [-T us] [-t [file]] [-e sys[:event]] [--filter <filter>] [--trigger=
 <trigger>] \\",
- 		"	  [-c cpu-list] [-H cpu-list] [-P priority] [-b N] [-E N] [--no-heade=
r] [--no-summary] \\",
- 		"	  [--no-index] [--with-zeros] [-C [cgroup_name]] [--warm-up]",
- 		NULL,
- 	};
-=20
- 	static const char * const msg_opts[] =3D {
- 		"	  -a/--auto: set automatic trace mode, stopping the session if argume=
nt in us sample is hit",
- 		"	  -p/--period us: osnoise period in us",
- 		"	  -r/--runtime us: osnoise runtime in us",
- 		"	  -s/--stop us: stop trace if a single sample is higher than the argu=
ment in us",
- 		"	  -S/--stop-total us: stop trace if the total sample is higher than t=
he argument in us",
- 		"	  -T/--threshold us: the minimum delta to be considered a noise",
- 		"	  -c/--cpus cpu-list: list of cpus to run osnoise threads",
- 		"	  -H/--house-keeping cpus: run rtla control threads only on the given=
 cpus",
- 		"	  -C/--cgroup [cgroup_name]: set cgroup, if no cgroup_name is passed,=
 the rtla's cgroup will be inherited",
- 		"	  -d/--duration time[s|m|h|d]: duration of the session",
- 		"	  -D/--debug: print debug info",
- 		"	  -t/--trace [file]: save the stopped trace to [file|osnoise_trace.tx=
t]",
- 		"	  -e/--event <sys:event>: enable the <sys:event> in the trace instanc=
e, multiple -e are allowed",
- 		"	     --filter <filter>: enable a trace event filter to the previous -=
e event",
- 		"	     --trigger <trigger>: enable a trace event trigger to the previou=
s -e event",
- 		"	  -b/--bucket-size N: set the histogram bucket size (default 1)",
- 		"	  -E/--entries N: set the number of entries of the histogram (default=
 256)",
- 		"	     --no-header: do not print header",
- 		"	     --no-summary: do not print summary",
- 		"	     --no-index: do not print index",
- 		"	     --with-zeros: print zero only entries",
- 		"	  -P/--priority o:prio|r:prio|f:prio|d:runtime:period: set scheduling=
 parameters",
- 		"		o:prio - use SCHED_OTHER with prio",
- 		"		r:prio - use SCHED_RR with prio",
- 		"		f:prio - use SCHED_FIFO with prio",
- 		"		d:runtime[us|ms|s]:period[us|ms|s] - use SCHED_DEADLINE with runtime=
 and period",
- 		"						       in nanoseconds",
- 		"	     --warm-up: let the workload run for s seconds before collecting =
data",
- 		"	     --trace-buffer-size kB: set the per-cpu trace buffer size in kB",
- 		"	     --on-threshold <action>: define action to be executed at stop-to=
tal threshold, multiple are allowed",
- 		"	     --on-end <action>: define action to be executed at measurement e=
nd, multiple are allowed",
- 		NULL,
- 	};
-=20
- 	common_usage("osnoise", "hist", "a per-cpu histogram of the OS noise",
- 		     msg_start, msg_opts);
- }
-=20
- /*
-  * osnoise_hist_parse_args - allocs, parse and fill the cmd line paramete=
rs
-  */
- static struct common_params
- *osnoise_hist_parse_args(int argc, char *argv[])
- {
- 	struct osnoise_params *params;
- 	int retval;
- 	int c;
- 	char *trace_output =3D NULL;
-=20
- 	params =3D calloc_fatal(1, sizeof(*params));
-=20
- 	actions_init(&params->common.threshold_actions);
- 	actions_init(&params->common.end_actions);
-=20
- 	/* display data in microseconds */
- 	params->common.output_divisor =3D 1000;
- 	params->common.hist.bucket_size =3D 1;
- 	params->common.hist.entries =3D 256;
-=20
- 	while (1) {
- 		static struct option long_options[] =3D {
- 			COMMON_OPTIONS,
- 			{"auto",		required_argument,	0, 'a'},
- 			{"bucket-size",		required_argument,	0, 'b'},
- 			{"entries",		required_argument,	0, 'E'},
- 			{"help",		no_argument,		0, 'h'},
- 			{"period",		required_argument,	0, 'p'},
- 			{"runtime",		required_argument,	0, 'r'},
- 			{"stop",		required_argument,	0, 's'},
- 			{"stop-total",		required_argument,	0, 'S'},
- 			{"trace",		optional_argument,	0, 't'},
- 			{"threshold",		required_argument,	0, 'T'},
- 			{"no-header",		no_argument,		0, '0'},
- 			{"no-summary",		no_argument,		0, '1'},
- 			{"no-index",		no_argument,		0, '2'},
- 			{"with-zeros",		no_argument,		0, '3'},
- 			{"trigger",		required_argument,	0, '4'},
- 			{"filter",		required_argument,	0, '5'},
- 			{"warm-up",		required_argument,	0, '6'},
- 			{"trace-buffer-size",	required_argument,	0, '7'},
- 			{"on-threshold",	required_argument,	0, '8'},
- 			{"on-end",		required_argument,	0, '9'},
- 			{0, 0, 0, 0}
- 		};
-=20
- 		c =3D getopt_auto(argc, argv, long_options);
-=20
- 		/* detect the end of the options. */
- 		if (c =3D=3D -1)
- 			break;
-=20
- 		if (set_common_option(c, argc, argv, &params->common))
- 			continue;
-=20
- 		switch (c) {
- 		case 'a':
- 			/* set sample stop to auto_thresh */
- 			params->common.stop_us =3D get_llong_from_str(optarg);
-=20
- 			/* set sample threshold to 1 */
- 			params->threshold =3D 1;
-=20
- 			/* set trace */
- 			if (!trace_output)
- 				trace_output =3D "osnoise_trace.txt";
-=20
- 			break;
- 		case 'b':
- 			params->common.hist.bucket_size =3D get_llong_from_str(optarg);
- 			if (params->common.hist.bucket_size =3D=3D 0 ||
- 			    params->common.hist.bucket_size >=3D 1000000)
- 				fatal("Bucket size needs to be > 0 and <=3D 1000000");
- 			break;
- 		case 'E':
- 			params->common.hist.entries =3D get_llong_from_str(optarg);
- 			if (params->common.hist.entries < 10 ||
- 			    params->common.hist.entries > 9999999)
- 				fatal("Entries must be > 10 and < 9999999");
- 			break;
- 		case 'h':
- 		case '?':
- 			osnoise_hist_usage();
- 			break;
- 		case 'p':
- 			params->period =3D get_llong_from_str(optarg);
- 			if (params->period > 10000000)
- 				fatal("Period longer than 10 s");
- 			break;
- 		case 'r':
- 			params->runtime =3D get_llong_from_str(optarg);
- 			if (params->runtime < 100)
- 				fatal("Runtime shorter than 100 us");
- 			break;
- 		case 's':
- 			params->common.stop_us =3D get_llong_from_str(optarg);
- 			break;
- 		case 'S':
- 			params->common.stop_total_us =3D get_llong_from_str(optarg);
- 			break;
- 		case 'T':
- 			params->threshold =3D get_llong_from_str(optarg);
- 			break;
- 		case 't':
- 			trace_output =3D parse_optional_arg(argc, argv);
- 			if (!trace_output)
- 				trace_output =3D "osnoise_trace.txt";
- 			break;
- 		case '0': /* no header */
- 			params->common.hist.no_header =3D 1;
- 			break;
- 		case '1': /* no summary */
- 			params->common.hist.no_summary =3D 1;
- 			break;
- 		case '2': /* no index */
- 			params->common.hist.no_index =3D 1;
- 			break;
- 		case '3': /* with zeros */
- 			params->common.hist.with_zeros =3D 1;
- 			break;
- 		case '4': /* trigger */
- 			if (params->common.events)
- 				trace_event_add_trigger(params->common.events, optarg);
- 			else
- 				fatal("--trigger requires a previous -e");
- 			break;
- 		case '5': /* filter */
- 			if (params->common.events)
- 				trace_event_add_filter(params->common.events, optarg);
- 			else
- 				fatal("--filter requires a previous -e");
- 			break;
- 		case '6':
- 			params->common.warmup =3D get_llong_from_str(optarg);
- 			break;
- 		case '7':
- 			params->common.buffer_size =3D get_llong_from_str(optarg);
- 			break;
- 		case '8':
- 			retval =3D actions_parse(&params->common.threshold_actions, optarg,
- 					       "osnoise_trace.txt");
- 			if (retval)
- 				fatal("Invalid action %s", optarg);
- 			break;
- 		case '9':
- 			retval =3D actions_parse(&params->common.end_actions, optarg,
- 					       "osnoise_trace.txt");
- 			if (retval)
- 				fatal("Invalid action %s", optarg);
- 			break;
- 		default:
- 			fatal("Invalid option");
- 		}
- 	}
-=20
- 	if (trace_output)
- 		actions_add_trace_output(&params->common.threshold_actions, trace_outpu=
t);
-=20
- 	if (geteuid())
- 		fatal("rtla needs root permission");
-=20
- 	if (params->common.hist.no_index && !params->common.hist.with_zeros)
- 		fatal("no-index set and with-zeros not set - it does not make sense");
-=20
- 	return &params->common;
- }
-=20
  /*
   * osnoise_hist_apply_config - apply the hist configs to the initialized =
tool
   */
diff --combined tools/tracing/rtla/src/osnoise_top.c
index e65312ec26c434,512a6299cb0181..00000000000000
--- a/tools/tracing/rtla/src/osnoise_top.c
+++ b/tools/tracing/rtla/src/osnoise_top.c
@@@ -4,7 -4,6 +4,6 @@@
   */
 =20
  #define _GNU_SOURCE
- #include <getopt.h>
  #include <stdlib.h>
  #include <string.h>
  #include <signal.h>
@@@ -13,6 -12,7 +12,7 @@@
  #include <time.h>
 =20
  #include "osnoise.h"
+ #include "cli.h"
 =20
  struct osnoise_top_cpu {
  	unsigned long long	sum_runtime;
@@@ -245,205 -245,6 +245,6 @@@ osnoise_print_stats(struct osnoise_too
  	osnoise_report_missed_events(top);
  }
 =20
- /*
-  * osnoise_top_usage - prints osnoise top usage message
-  */
- static void osnoise_top_usage(struct osnoise_params *params)
- {
- 	const char *tool, *mode, *desc;
-=20
- 	static const char * const msg_start[] =3D {
- 		"[-q] [-D] [-d s] [-a us] [-p us] [-r us] [-s us] [-S us] \\",
- 		"	  [-T us] [-t [file]] [-e sys[:event]] [--filter <filter>] [--trigger=
 <trigger>] \\",
- 		"	  [-c cpu-list] [-H cpu-list] [-P priority] [-C [cgroup_name]] [--war=
m-up s]",
- 		NULL,
- 	};
-=20
- 	static const char * const msg_opts[] =3D {
- 		"	  -a/--auto: set automatic trace mode, stopping the session if argume=
nt in us sample is hit",
- 		"	  -p/--period us: osnoise period in us",
- 		"	  -r/--runtime us: osnoise runtime in us",
- 		"	  -s/--stop us: stop trace if a single sample is higher than the argu=
ment in us",
- 		"	  -S/--stop-total us: stop trace if the total sample is higher than t=
he argument in us",
- 		"	  -T/--threshold us: the minimum delta to be considered a noise",
- 		"	  -c/--cpus cpu-list: list of cpus to run osnoise threads",
- 		"	  -H/--house-keeping cpus: run rtla control threads only on the given=
 cpus",
- 		"	  -C/--cgroup [cgroup_name]: set cgroup, if no cgroup_name is passed,=
 the rtla's cgroup will be inherited",
- 		"	  -d/--duration time[s|m|h|d]: duration of the session",
- 		"	  -D/--debug: print debug info",
- 		"	  -t/--trace [file]: save the stopped trace to [file|osnoise_trace.tx=
t]",
- 		"	  -e/--event <sys:event>: enable the <sys:event> in the trace instanc=
e, multiple -e are allowed",
- 		"	     --filter <filter>: enable a trace event filter to the previous -=
e event",
- 		"	     --trigger <trigger>: enable a trace event trigger to the previou=
s -e event",
- 		"	  -q/--quiet print only a summary at the end",
- 		"	  -P/--priority o:prio|r:prio|f:prio|d:runtime:period : set schedulin=
g parameters",
- 		"		o:prio - use SCHED_OTHER with prio",
- 		"		r:prio - use SCHED_RR with prio",
- 		"		f:prio - use SCHED_FIFO with prio",
- 		"		d:runtime[us|ms|s]:period[us|ms|s] - use SCHED_DEADLINE with runtime=
 and period",
- 		"						       in nanoseconds",
- 		"	     --warm-up s: let the workload run for s seconds before collectin=
g data",
- 		"	     --trace-buffer-size kB: set the per-cpu trace buffer size in kB",
- 		"	     --on-threshold <action>: define action to be executed at stop-to=
tal threshold, multiple are allowed",
- 		"	     --on-end: define action to be executed at measurement end, multi=
ple are allowed",
- 		NULL,
- 	};
-=20
- 	if (params->mode =3D=3D MODE_OSNOISE) {
- 		tool =3D "osnoise";
- 		mode =3D "top";
- 		desc =3D "a per-cpu summary of the OS noise";
- 	} else {
- 		tool =3D "hwnoise";
- 		mode =3D "";
- 		desc =3D "a summary of hardware-related noise";
- 	}
-=20
- 	common_usage(tool, mode, desc, msg_start, msg_opts);
- }
-=20
- /*
-  * osnoise_top_parse_args - allocs, parse and fill the cmd line parameters
-  */
- struct common_params *osnoise_top_parse_args(int argc, char **argv)
- {
- 	struct osnoise_params *params;
- 	int retval;
- 	int c;
- 	char *trace_output =3D NULL;
-=20
- 	params =3D calloc_fatal(1, sizeof(*params));
-=20
- 	actions_init(&params->common.threshold_actions);
- 	actions_init(&params->common.end_actions);
-=20
- 	if (strcmp(argv[0], "hwnoise") =3D=3D 0) {
- 		params->mode =3D MODE_HWNOISE;
- 		/*
- 		 * Reduce CPU usage for 75% to avoid killing the system.
- 		 */
- 		params->runtime =3D 750000;
- 		params->period =3D 1000000;
- 	}
-=20
- 	while (1) {
- 		static struct option long_options[] =3D {
- 			COMMON_OPTIONS,
- 			{"auto",		required_argument,	0, 'a'},
- 			{"help",		no_argument,		0, 'h'},
- 			{"period",		required_argument,	0, 'p'},
- 			{"quiet",		no_argument,		0, 'q'},
- 			{"runtime",		required_argument,	0, 'r'},
- 			{"stop",		required_argument,	0, 's'},
- 			{"stop-total",		required_argument,	0, 'S'},
- 			{"threshold",		required_argument,	0, 'T'},
- 			{"trace",		optional_argument,	0, 't'},
- 			{"trigger",		required_argument,	0, '0'},
- 			{"filter",		required_argument,	0, '1'},
- 			{"warm-up",		required_argument,	0, '2'},
- 			{"trace-buffer-size",	required_argument,	0, '3'},
- 			{"on-threshold",	required_argument,	0, '4'},
- 			{"on-end",		required_argument,	0, '5'},
- 			{0, 0, 0, 0}
- 		};
-=20
- 		c =3D getopt_auto(argc, argv, long_options);
-=20
- 		/* Detect the end of the options. */
- 		if (c =3D=3D -1)
- 			break;
-=20
- 		if (set_common_option(c, argc, argv, &params->common))
- 			continue;
-=20
- 		switch (c) {
- 		case 'a':
- 			/* set sample stop to auto_thresh */
- 			params->common.stop_us =3D get_llong_from_str(optarg);
-=20
- 			/* set sample threshold to 1 */
- 			params->threshold =3D 1;
-=20
- 			/* set trace */
- 			if (!trace_output)
- 				trace_output =3D "osnoise_trace.txt";
-=20
- 			break;
- 		case 'h':
- 		case '?':
- 			osnoise_top_usage(params);
- 			break;
- 		case 'p':
- 			params->period =3D get_llong_from_str(optarg);
- 			if (params->period > 10000000)
- 				fatal("Period longer than 10 s");
- 			break;
- 		case 'q':
- 			params->common.quiet =3D 1;
- 			break;
- 		case 'r':
- 			params->runtime =3D get_llong_from_str(optarg);
- 			if (params->runtime < 100)
- 				fatal("Runtime shorter than 100 us");
- 			break;
- 		case 's':
- 			params->common.stop_us =3D get_llong_from_str(optarg);
- 			break;
- 		case 'S':
- 			params->common.stop_total_us =3D get_llong_from_str(optarg);
- 			break;
- 		case 't':
- 			trace_output =3D parse_optional_arg(argc, argv);
- 			if (!trace_output)
- 				trace_output =3D "osnoise_trace.txt";
- 			break;
- 		case 'T':
- 			params->threshold =3D get_llong_from_str(optarg);
- 			break;
- 		case '0': /* trigger */
- 			if (params->common.events)
- 				trace_event_add_trigger(params->common.events, optarg);
- 			else
- 				fatal("--trigger requires a previous -e");
- 			break;
- 		case '1': /* filter */
- 			if (params->common.events)
- 				trace_event_add_filter(params->common.events, optarg);
- 			else
- 				fatal("--filter requires a previous -e");
- 			break;
- 		case '2':
- 			params->common.warmup =3D get_llong_from_str(optarg);
- 			break;
- 		case '3':
- 			params->common.buffer_size =3D get_llong_from_str(optarg);
- 			break;
- 		case '4':
- 			retval =3D actions_parse(&params->common.threshold_actions, optarg,
- 					       "osnoise_trace.txt");
- 			if (retval)
- 				fatal("Invalid action %s", optarg);
- 			break;
- 		case '5':
- 			retval =3D actions_parse(&params->common.end_actions, optarg,
- 					       "osnoise_trace.txt");
- 			if (retval)
- 				fatal("Invalid action %s", optarg);
- 			break;
- 		default:
- 			fatal("Invalid option");
- 		}
- 	}
-=20
- 	if (trace_output)
- 		actions_add_trace_output(&params->common.threshold_actions, trace_outpu=
t);
-=20
- 	if (geteuid())
- 		fatal("osnoise needs root permission");
-=20
- 	return &params->common;
- }
-=20
  /*
   * osnoise_top_apply_config - apply the top configs to the initialized to=
ol
   */
diff --combined tools/tracing/rtla/src/timerlat_hist.c
index 4b6708e333b8f4,df7b1398a966d8..00000000000000
--- a/tools/tracing/rtla/src/timerlat_hist.c
+++ b/tools/tracing/rtla/src/timerlat_hist.c
@@@ -4,7 -4,6 +4,6 @@@
   */
 =20
  #define _GNU_SOURCE
- #include <getopt.h>
  #include <stdlib.h>
  #include <string.h>
  #include <signal.h>
@@@ -17,6 -16,7 +16,7 @@@
  #include "timerlat.h"
  #include "timerlat_aa.h"
  #include "timerlat_bpf.h"
+ #include "cli.h"
  #include "common.h"
 =20
  struct timerlat_hist_cpu {
@@@ -685,322 -685,6 +685,6 @@@ timerlat_print_stats(struct osnoise_too
  	osnoise_report_missed_events(tool);
  }
 =20
- /*
-  * timerlat_hist_usage - prints timerlat top usage message
-  */
- static void timerlat_hist_usage(void)
- {
- 	static const char * const msg_start[] =3D {
- 		"[-d s] [-D] [-n] [-a us] [-p us] [-i us] [-T us] [-s us] \\",
- 		"         [-t [file]] [-e sys[:event]] [--filter <filter>] [--trigger <=
trigger>] [-c cpu-list] [-H cpu-list]\\",
- 		"	  [-P priority] [-E N] [-b N] [--no-irq] [--no-thread] [--no-header] =
[--no-summary] \\",
- 		"	  [--no-index] [--with-zeros] [--dma-latency us] [-C [cgroup_name]] [=
--no-aa] [--dump-task] [-u|-k]",
- 		"	  [--warm-up s] [--deepest-idle-state n]",
- 		NULL,
- 	};
-=20
- 	static const char * const msg_opts[] =3D {
- 		"	  -a/--auto: set automatic trace mode, stopping the session if argume=
nt in us latency is hit",
- 		"	  -p/--period us: timerlat period in us",
- 		"	  -i/--irq us: stop trace if the irq latency is higher than the argum=
ent in us",
- 		"	  -T/--thread us: stop trace if the thread latency is higher than the=
 argument in us",
- 		"	  -s/--stack us: save the stack trace at the IRQ if a thread latency =
is higher than the argument in us",
- 		"	  -c/--cpus cpus: run the tracer only on the given cpus",
- 		"	  -H/--house-keeping cpus: run rtla control threads only on the given=
 cpus",
- 		"	  -C/--cgroup [cgroup_name]: set cgroup, if no cgroup_name is passed,=
 the rtla's cgroup will be inherited",
- 		"	  -d/--duration time[m|h|d]: duration of the session in seconds",
- 		"	     --dump-tasks: prints the task running on all CPUs if stop condit=
ions are met (depends on !--no-aa)",
- 		"	  -D/--debug: print debug info",
- 		"	  -t/--trace [file]: save the stopped trace to [file|timerlat_trace.t=
xt]",
- 		"	  -e/--event <sys:event>: enable the <sys:event> in the trace instanc=
e, multiple -e are allowed",
- 		"	     --filter <filter>: enable a trace event filter to the previous -=
e event",
- 		"	     --trigger <trigger>: enable a trace event trigger to the previou=
s -e event",
- 		"	  -n/--nano: display data in nanoseconds",
- 		"	     --no-aa: disable auto-analysis, reducing rtla timerlat cpu usage=
",
- 		"	  -b/--bucket-size N: set the histogram bucket size (default 1)",
- 		"	  -E/--entries N: set the number of entries of the histogram (default=
 256)",
- 		"	     --no-irq: ignore IRQ latencies",
- 		"	     --no-thread: ignore thread latencies",
- 		"	     --no-header: do not print header",
- 		"	     --no-summary: do not print summary",
- 		"	     --no-index: do not print index",
- 		"	     --with-zeros: print zero only entries",
- 		"	     --dma-latency us: set /dev/cpu_dma_latency latency <us> to reduc=
e exit from idle latency",
- 		"	  -P/--priority o:prio|r:prio|f:prio|d:runtime:period : set schedulin=
g parameters",
- 		"		o:prio - use SCHED_OTHER with prio",
- 		"		r:prio - use SCHED_RR with prio",
- 		"		f:prio - use SCHED_FIFO with prio",
- 		"		d:runtime[us|ms|s]:period[us|ms|s] - use SCHED_DEADLINE with runtime=
 and period",
- 		"						       in nanoseconds",
- 		"	  -u/--user-threads: use rtla user-space threads instead of kernel-sp=
ace timerlat threads",
- 		"	  -k/--kernel-threads: use timerlat kernel-space threads instead of r=
tla user-space threads",
- 		"	  -U/--user-load: enable timerlat for user-defined user-space workloa=
d",
- 		"	     --warm-up s: let the workload run for s seconds before collectin=
g data",
- 		"	     --trace-buffer-size kB: set the per-cpu trace buffer size in kB",
- 		"	     --deepest-idle-state n: only go down to idle state n on cpus use=
d by timerlat to reduce exit from idle latency",
- 		"	     --on-threshold <action>: define action to be executed at latency=
 threshold, multiple are allowed",
- 		"	     --on-end <action>: define action to be executed at measurement e=
nd, multiple are allowed",
- 		"	     --bpf-action <program>: load and execute BPF program when latenc=
y threshold is exceeded",
- 		"	     --stack-format <format>: set the stack format (truncate, skip, f=
ull)",
- 		NULL,
- 	};
-=20
- 	common_usage("timerlat", "hist", "a per-cpu histogram of the timer laten=
cy",
- 		     msg_start, msg_opts);
- }
-=20
- /*
-  * timerlat_hist_parse_args - allocs, parse and fill the cmd line paramet=
ers
-  */
- static struct common_params
- *timerlat_hist_parse_args(int argc, char *argv[])
- {
- 	struct timerlat_params *params;
- 	int auto_thresh;
- 	int retval;
- 	int c;
- 	char *trace_output =3D NULL;
-=20
- 	params =3D calloc_fatal(1, sizeof(*params));
-=20
- 	actions_init(&params->common.threshold_actions);
- 	actions_init(&params->common.end_actions);
-=20
- 	/* disabled by default */
- 	params->dma_latency =3D -1;
-=20
- 	/* disabled by default */
- 	params->deepest_idle_state =3D -2;
-=20
- 	/* display data in microseconds */
- 	params->common.output_divisor =3D 1000;
- 	params->common.hist.bucket_size =3D 1;
- 	params->common.hist.entries =3D 256;
-=20
- 	/* default to BPF mode */
- 	params->mode =3D TRACING_MODE_BPF;
-=20
- 	/* default to truncate stack format */
- 	params->stack_format =3D STACK_FORMAT_TRUNCATE;
-=20
- 	while (1) {
- 		static struct option long_options[] =3D {
- 			COMMON_OPTIONS,
- 			{"auto",		required_argument,	0, 'a'},
- 			{"bucket-size",		required_argument,	0, 'b'},
- 			{"entries",		required_argument,	0, 'E'},
- 			{"help",		no_argument,		0, 'h'},
- 			{"irq",			required_argument,	0, 'i'},
- 			{"nano",		no_argument,		0, 'n'},
- 			{"period",		required_argument,	0, 'p'},
- 			{"stack",		required_argument,	0, 's'},
- 			{"thread",		required_argument,	0, 'T'},
- 			{"trace",		optional_argument,	0, 't'},
- 			{"user-threads",	no_argument,		0, 'u'},
- 			{"kernel-threads",	no_argument,		0, 'k'},
- 			{"user-load",		no_argument,		0, 'U'},
- 			{"no-irq",		no_argument,		0, '0'},
- 			{"no-thread",		no_argument,		0, '1'},
- 			{"no-header",		no_argument,		0, '2'},
- 			{"no-summary",		no_argument,		0, '3'},
- 			{"no-index",		no_argument,		0, '4'},
- 			{"with-zeros",		no_argument,		0, '5'},
- 			{"trigger",		required_argument,	0, '6'},
- 			{"filter",		required_argument,	0, '7'},
- 			{"dma-latency",		required_argument,	0, '8'},
- 			{"no-aa",		no_argument,		0, '9'},
- 			{"dump-task",		no_argument,		0, '\1'},
- 			{"warm-up",		required_argument,	0, '\2'},
- 			{"trace-buffer-size",	required_argument,	0, '\3'},
- 			{"deepest-idle-state",	required_argument,	0, '\4'},
- 			{"on-threshold",	required_argument,	0, '\5'},
- 			{"on-end",		required_argument,	0, '\6'},
- 			{"bpf-action",		required_argument,	0, '\7'},
- 			{"stack-format",	required_argument,	0, '\10'},
- 			{0, 0, 0, 0}
- 		};
-=20
- 		c =3D getopt_auto(argc, argv, long_options);
-=20
- 		if (set_common_option(c, argc, argv, &params->common))
- 			continue;
-=20
- 		/* detect the end of the options. */
- 		if (c =3D=3D -1)
- 			break;
-=20
- 		switch (c) {
- 		case 'a':
- 			auto_thresh =3D get_llong_from_str(optarg);
-=20
- 			/* set thread stop to auto_thresh */
- 			params->common.stop_total_us =3D auto_thresh;
- 			params->common.stop_us =3D auto_thresh;
-=20
- 			/* get stack trace */
- 			params->print_stack =3D auto_thresh;
-=20
- 			/* set trace */
- 			if (!trace_output)
- 				trace_output =3D "timerlat_trace.txt";
-=20
- 			break;
- 		case 'b':
- 			params->common.hist.bucket_size =3D get_llong_from_str(optarg);
- 			if (params->common.hist.bucket_size =3D=3D 0 ||
- 			    params->common.hist.bucket_size >=3D 1000000)
- 				fatal("Bucket size needs to be > 0 and <=3D 1000000");
- 			break;
- 		case 'E':
- 			params->common.hist.entries =3D get_llong_from_str(optarg);
- 			if (params->common.hist.entries < 10 ||
- 			    params->common.hist.entries > 9999999)
- 				fatal("Entries must be > 10 and < 9999999");
- 			break;
- 		case 'h':
- 		case '?':
- 			timerlat_hist_usage();
- 			break;
- 		case 'i':
- 			params->common.stop_us =3D get_llong_from_str(optarg);
- 			break;
- 		case 'k':
- 			params->common.kernel_workload =3D 1;
- 			break;
- 		case 'n':
- 			params->common.output_divisor =3D 1;
- 			break;
- 		case 'p':
- 			params->timerlat_period_us =3D get_llong_from_str(optarg);
- 			if (params->timerlat_period_us > 1000000)
- 				fatal("Period longer than 1 s");
- 			break;
- 		case 's':
- 			params->print_stack =3D get_llong_from_str(optarg);
- 			break;
- 		case 'T':
- 			params->common.stop_total_us =3D get_llong_from_str(optarg);
- 			break;
- 		case 't':
- 			trace_output =3D parse_optional_arg(argc, argv);
- 			if (!trace_output)
- 				trace_output =3D "timerlat_trace.txt";
- 			break;
- 		case 'u':
- 			params->common.user_workload =3D 1;
- 			/* fallback: -u implies in -U */
- 		case 'U':
- 			params->common.user_data =3D 1;
- 			break;
- 		case '0': /* no irq */
- 			params->common.hist.no_irq =3D 1;
- 			break;
- 		case '1': /* no thread */
- 			params->common.hist.no_thread =3D 1;
- 			break;
- 		case '2': /* no header */
- 			params->common.hist.no_header =3D 1;
- 			break;
- 		case '3': /* no summary */
- 			params->common.hist.no_summary =3D 1;
- 			break;
- 		case '4': /* no index */
- 			params->common.hist.no_index =3D 1;
- 			break;
- 		case '5': /* with zeros */
- 			params->common.hist.with_zeros =3D 1;
- 			break;
- 		case '6': /* trigger */
- 			if (params->common.events)
- 				trace_event_add_trigger(params->common.events, optarg);
- 			else
- 				fatal("--trigger requires a previous -e");
- 			break;
- 		case '7': /* filter */
- 			if (params->common.events)
- 				trace_event_add_filter(params->common.events, optarg);
- 			else
- 				fatal("--filter requires a previous -e");
- 			break;
- 		case '8':
- 			params->dma_latency =3D get_llong_from_str(optarg);
- 			if (params->dma_latency < 0 || params->dma_latency > 10000)
- 				fatal("--dma-latency needs to be >=3D 0 and < 10000");
- 			break;
- 		case '9':
- 			params->no_aa =3D 1;
- 			break;
- 		case '\1':
- 			params->dump_tasks =3D 1;
- 			break;
- 		case '\2':
- 			params->common.warmup =3D get_llong_from_str(optarg);
- 			break;
- 		case '\3':
- 			params->common.buffer_size =3D get_llong_from_str(optarg);
- 			break;
- 		case '\4':
- 			params->deepest_idle_state =3D get_llong_from_str(optarg);
- 			break;
- 		case '\5':
- 			retval =3D actions_parse(&params->common.threshold_actions, optarg,
- 					       "timerlat_trace.txt");
- 			if (retval)
- 				fatal("Invalid action %s", optarg);
- 			break;
- 		case '\6':
- 			retval =3D actions_parse(&params->common.end_actions, optarg,
- 					       "timerlat_trace.txt");
- 			if (retval)
- 				fatal("Invalid action %s", optarg);
- 			break;
- 		case '\7':
- 			params->bpf_action_program =3D optarg;
- 			break;
- 		case '\10':
- 			params->stack_format =3D parse_stack_format(optarg);
- 			if (params->stack_format =3D=3D -1)
- 				fatal("Invalid --stack-format option");
- 			break;
- 		default:
- 			fatal("Invalid option");
- 		}
- 	}
-=20
- 	if (trace_output)
- 		actions_add_trace_output(&params->common.threshold_actions, trace_outpu=
t);
-=20
- 	if (geteuid())
- 		fatal("rtla needs root permission");
-=20
- 	if (params->common.hist.no_irq && params->common.hist.no_thread)
- 		fatal("no-irq and no-thread set, there is nothing to do here");
-=20
- 	if (params->common.hist.no_index && !params->common.hist.with_zeros)
- 		fatal("no-index set with with-zeros is not set - it does not make sense=
");
-=20
- 	/*
- 	 * Auto analysis only happens if stop tracing, thus:
- 	 */
- 	if (!params->common.stop_us && !params->common.stop_total_us)
- 		params->no_aa =3D 1;
-=20
- 	if (params->common.kernel_workload && params->common.user_workload)
- 		fatal("--kernel-threads and --user-threads are mutually exclusive!");
-=20
- 	/*
- 	 * If auto-analysis or trace output is enabled, switch from BPF mode to
- 	 * mixed mode
- 	 */
- 	if (params->mode =3D=3D TRACING_MODE_BPF &&
- 	    (params->common.threshold_actions.present[ACTION_TRACE_OUTPUT] ||
- 	     params->common.end_actions.present[ACTION_TRACE_OUTPUT] ||
- 	     !params->no_aa))
- 		params->mode =3D TRACING_MODE_MIXED;
-=20
- 	return &params->common;
- }
-=20
  /*
   * timerlat_hist_apply_config - apply the hist configs to the initialized=
 tool
   */
diff --combined tools/tracing/rtla/src/timerlat_top.c
index 91f88bbebad9eb,18e1071a2e242b..00000000000000
--- a/tools/tracing/rtla/src/timerlat_top.c
+++ b/tools/tracing/rtla/src/timerlat_top.c
@@@ -4,7 -4,6 +4,6 @@@
   */
 =20
  #define _GNU_SOURCE
- #include <getopt.h>
  #include <stdlib.h>
  #include <string.h>
  #include <signal.h>
@@@ -17,6 -16,7 +16,7 @@@
  #include "timerlat.h"
  #include "timerlat_aa.h"
  #include "timerlat_bpf.h"
+ #include "cli.h"
  #include "common.h"
 =20
  struct timerlat_top_cpu {
@@@ -459,290 -459,6 +459,6 @@@ timerlat_print_stats(struct osnoise_too
  	osnoise_report_missed_events(top);
  }
 =20
- /*
-  * timerlat_top_usage - prints timerlat top usage message
-  */
- static void timerlat_top_usage(void)
- {
- 	static const char *const msg_start[] =3D {
- 		"[-q] [-a us] [-d s] [-D] [-n] [-p us] [-i us] [-T us] [-s us] \\",
- 		"	  [[-t [file]] [-e sys[:event]] [--filter <filter>] [--trigger <trigg=
er>] [-c cpu-list] [-H cpu-list]\\",
- 		"	  [-P priority] [--dma-latency us] [--aa-only us] [-C [cgroup_name]] =
[-u|-k] [--warm-up s] [--deepest-idle-state n]",
- 		NULL,
- 	};
-=20
- 	static const char *const msg_opts[] =3D {
- 		"	  -a/--auto: set automatic trace mode, stopping the session if argume=
nt in us latency is hit",
- 		"	     --aa-only us: stop if <us> latency is hit, only printing the aut=
o analysis (reduces CPU usage)",
- 		"	  -p/--period us: timerlat period in us",
- 		"	  -i/--irq us: stop trace if the irq latency is higher than the argum=
ent in us",
- 		"	  -T/--thread us: stop trace if the thread latency is higher than the=
 argument in us",
- 		"	  -s/--stack us: save the stack trace at the IRQ if a thread latency =
is higher than the argument in us",
- 		"	  -c/--cpus cpus: run the tracer only on the given cpus",
- 		"	  -H/--house-keeping cpus: run rtla control threads only on the given=
 cpus",
- 		"	  -C/--cgroup [cgroup_name]: set cgroup, if no cgroup_name is passed,=
 the rtla's cgroup will be inherited",
- 		"	  -d/--duration time[s|m|h|d]: duration of the session",
- 		"	  -D/--debug: print debug info",
- 		"	     --dump-tasks: prints the task running on all CPUs if stop condit=
ions are met (depends on !--no-aa)",
- 		"	  -t/--trace [file]: save the stopped trace to [file|timerlat_trace.t=
xt]",
- 		"	  -e/--event <sys:event>: enable the <sys:event> in the trace instanc=
e, multiple -e are allowed",
- 		"	     --filter <command>: enable a trace event filter to the previous =
-e event",
- 		"	     --trigger <command>: enable a trace event trigger to the previou=
s -e event",
- 		"	  -n/--nano: display data in nanoseconds",
- 		"	     --no-aa: disable auto-analysis, reducing rtla timerlat cpu usage=
",
- 		"	  -q/--quiet print only a summary at the end",
- 		"	     --dma-latency us: set /dev/cpu_dma_latency latency <us> to reduc=
e exit from idle latency",
- 		"	  -P/--priority o:prio|r:prio|f:prio|d:runtime:period : set schedulin=
g parameters",
- 		"		o:prio - use SCHED_OTHER with prio",
- 		"		r:prio - use SCHED_RR with prio",
- 		"		f:prio - use SCHED_FIFO with prio",
- 		"		d:runtime[us|ms|s]:period[us|ms|s] - use SCHED_DEADLINE with runtime=
 and period",
- 		"						       in nanoseconds",
- 		"	  -u/--user-threads: use rtla user-space threads instead of kernel-sp=
ace timerlat threads",
- 		"	  -k/--kernel-threads: use timerlat kernel-space threads instead of r=
tla user-space threads",
- 		"	  -U/--user-load: enable timerlat for user-defined user-space workloa=
d",
- 		"	     --warm-up s: let the workload run for s seconds before collectin=
g data",
- 		"	     --trace-buffer-size kB: set the per-cpu trace buffer size in kB",
- 		"	     --deepest-idle-state n: only go down to idle state n on cpus use=
d by timerlat to reduce exit from idle latency",
- 		"	     --on-threshold <action>: define action to be executed at latency=
 threshold, multiple are allowed",
- 		"	     --on-end: define action to be executed at measurement end, multi=
ple are allowed",
- 		"	     --bpf-action <program>: load and execute BPF program when latenc=
y threshold is exceeded",
- 		"	     --stack-format <format>: set the stack format (truncate, skip, f=
ull)",
- 		NULL,
- 	};
-=20
- 	common_usage("timerlat", "top", "a per-cpu summary of the timer latency",
- 		     msg_start, msg_opts);
- }
-=20
- /*
-  * timerlat_top_parse_args - allocs, parse and fill the cmd line paramete=
rs
-  */
- static struct common_params
- *timerlat_top_parse_args(int argc, char **argv)
- {
- 	struct timerlat_params *params;
- 	long long auto_thresh;
- 	int retval;
- 	int c;
- 	char *trace_output =3D NULL;
-=20
- 	params =3D calloc_fatal(1, sizeof(*params));
-=20
- 	actions_init(&params->common.threshold_actions);
- 	actions_init(&params->common.end_actions);
-=20
- 	/* disabled by default */
- 	params->dma_latency =3D -1;
-=20
- 	/* disabled by default */
- 	params->deepest_idle_state =3D -2;
-=20
- 	/* display data in microseconds */
- 	params->common.output_divisor =3D 1000;
-=20
- 	/* default to BPF mode */
- 	params->mode =3D TRACING_MODE_BPF;
-=20
- 	/* default to truncate stack format */
- 	params->stack_format =3D STACK_FORMAT_TRUNCATE;
-=20
- 	while (1) {
- 		static struct option long_options[] =3D {
- 			COMMON_OPTIONS,
- 			{"auto",		required_argument,	0, 'a'},
- 			{"help",		no_argument,		0, 'h'},
- 			{"irq",			required_argument,	0, 'i'},
- 			{"nano",		no_argument,		0, 'n'},
- 			{"period",		required_argument,	0, 'p'},
- 			{"quiet",		no_argument,		0, 'q'},
- 			{"stack",		required_argument,	0, 's'},
- 			{"thread",		required_argument,	0, 'T'},
- 			{"trace",		optional_argument,	0, 't'},
- 			{"user-threads",	no_argument,		0, 'u'},
- 			{"kernel-threads",	no_argument,		0, 'k'},
- 			{"user-load",		no_argument,		0, 'U'},
- 			{"trigger",		required_argument,	0, '0'},
- 			{"filter",		required_argument,	0, '1'},
- 			{"dma-latency",		required_argument,	0, '2'},
- 			{"no-aa",		no_argument,		0, '3'},
- 			{"dump-tasks",		no_argument,		0, '4'},
- 			{"aa-only",		required_argument,	0, '5'},
- 			{"warm-up",		required_argument,	0, '6'},
- 			{"trace-buffer-size",	required_argument,	0, '7'},
- 			{"deepest-idle-state",	required_argument,	0, '8'},
- 			{"on-threshold",	required_argument,	0, '9'},
- 			{"on-end",		required_argument,	0, '\1'},
- 			{"bpf-action",		required_argument,	0, '\2'},
- 			{"stack-format",	required_argument,	0, '\3'},
- 			{0, 0, 0, 0}
- 		};
-=20
- 		c =3D getopt_auto(argc, argv, long_options);
-=20
- 		if (set_common_option(c, argc, argv, &params->common))
- 			continue;
-=20
- 		/* detect the end of the options. */
- 		if (c =3D=3D -1)
- 			break;
-=20
- 		switch (c) {
- 		case 'a':
- 			auto_thresh =3D get_llong_from_str(optarg);
-=20
- 			/* set thread stop to auto_thresh */
- 			params->common.stop_total_us =3D auto_thresh;
- 			params->common.stop_us =3D auto_thresh;
-=20
- 			/* get stack trace */
- 			params->print_stack =3D auto_thresh;
-=20
- 			/* set trace */
- 			if (!trace_output)
- 				trace_output =3D "timerlat_trace.txt";
-=20
- 			break;
- 		case '5':
- 			/* it is here because it is similar to -a */
- 			auto_thresh =3D get_llong_from_str(optarg);
-=20
- 			/* set thread stop to auto_thresh */
- 			params->common.stop_total_us =3D auto_thresh;
- 			params->common.stop_us =3D auto_thresh;
-=20
- 			/* get stack trace */
- 			params->print_stack =3D auto_thresh;
-=20
- 			/* set aa_only to avoid parsing the trace */
- 			params->common.aa_only =3D 1;
- 			break;
- 		case 'h':
- 		case '?':
- 			timerlat_top_usage();
- 			break;
- 		case 'i':
- 			params->common.stop_us =3D get_llong_from_str(optarg);
- 			break;
- 		case 'k':
- 			params->common.kernel_workload =3D true;
- 			break;
- 		case 'n':
- 			params->common.output_divisor =3D 1;
- 			break;
- 		case 'p':
- 			params->timerlat_period_us =3D get_llong_from_str(optarg);
- 			if (params->timerlat_period_us > 1000000)
- 				fatal("Period longer than 1 s");
- 			break;
- 		case 'q':
- 			params->common.quiet =3D 1;
- 			break;
- 		case 's':
- 			params->print_stack =3D get_llong_from_str(optarg);
- 			break;
- 		case 'T':
- 			params->common.stop_total_us =3D get_llong_from_str(optarg);
- 			break;
- 		case 't':
- 			trace_output =3D parse_optional_arg(argc, argv);
- 			if (!trace_output)
- 				trace_output =3D "timerlat_trace.txt";
- 			break;
- 		case 'u':
- 			params->common.user_workload =3D true;
- 			/* fallback: -u implies -U */
- 		case 'U':
- 			params->common.user_data =3D true;
- 			break;
- 		case '0': /* trigger */
- 			if (params->common.events)
- 				trace_event_add_trigger(params->common.events, optarg);
- 			else
- 				fatal("--trigger requires a previous -e");
- 			break;
- 		case '1': /* filter */
- 			if (params->common.events)
- 				trace_event_add_filter(params->common.events, optarg);
- 			else
- 				fatal("--filter requires a previous -e");
- 			break;
- 		case '2': /* dma-latency */
- 			params->dma_latency =3D get_llong_from_str(optarg);
- 			if (params->dma_latency < 0 || params->dma_latency > 10000)
- 				fatal("--dma-latency needs to be >=3D 0 and < 10000");
- 			break;
- 		case '3': /* no-aa */
- 			params->no_aa =3D 1;
- 			break;
- 		case '4':
- 			params->dump_tasks =3D 1;
- 			break;
- 		case '6':
- 			params->common.warmup =3D get_llong_from_str(optarg);
- 			break;
- 		case '7':
- 			params->common.buffer_size =3D get_llong_from_str(optarg);
- 			break;
- 		case '8':
- 			params->deepest_idle_state =3D get_llong_from_str(optarg);
- 			break;
- 		case '9':
- 			retval =3D actions_parse(&params->common.threshold_actions, optarg,
- 					       "timerlat_trace.txt");
- 			if (retval)
- 				fatal("Invalid action %s", optarg);
- 			break;
- 		case '\1':
- 			retval =3D actions_parse(&params->common.end_actions, optarg,
- 					       "timerlat_trace.txt");
- 			if (retval)
- 				fatal("Invalid action %s", optarg);
- 			break;
- 		case '\2':
- 			params->bpf_action_program =3D optarg;
- 			break;
- 		case '\3':
- 			params->stack_format =3D parse_stack_format(optarg);
- 			if (params->stack_format =3D=3D -1)
- 				fatal("Invalid --stack-format option");
- 			break;
- 		default:
- 			fatal("Invalid option");
- 		}
- 	}
-=20
- 	if (trace_output)
- 		actions_add_trace_output(&params->common.threshold_actions, trace_outpu=
t);
-=20
- 	if (geteuid())
- 		fatal("rtla needs root permission");
-=20
- 	/*
- 	 * Auto analysis only happens if stop tracing, thus:
- 	 */
- 	if (!params->common.stop_us && !params->common.stop_total_us)
- 		params->no_aa =3D 1;
-=20
- 	if (params->no_aa && params->common.aa_only)
- 		fatal("--no-aa and --aa-only are mutually exclusive!");
-=20
- 	if (params->common.kernel_workload && params->common.user_workload)
- 		fatal("--kernel-threads and --user-threads are mutually exclusive!");
-=20
- 	/*
- 	 * If auto-analysis or trace output is enabled, switch from BPF mode to
- 	 * mixed mode
- 	 */
- 	if (params->mode =3D=3D TRACING_MODE_BPF &&
- 	    (params->common.threshold_actions.present[ACTION_TRACE_OUTPUT] ||
- 	     params->common.end_actions.present[ACTION_TRACE_OUTPUT] ||
- 	     !params->no_aa))
- 		params->mode =3D TRACING_MODE_MIXED;
-=20
- 	return &params->common;
- }
-=20
  /*
   * timerlat_top_apply_config - apply the top configs to the initialized t=
ool
   */

--7uHLi7/+eEo7Ny29
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmopg8EACgkQJNaLcl1U
h9CeTwf/TVFksMxgS0RTH4YzVKUUAn0nLr74RAlnHTqhJyRK1KwHfrI55mIAuhck
8HOTOKmTtCQwSpkr+YxnRVtJyyjfavB5WsxQvYNG9CHB907YREOIsVvWAerrcyMP
PCf3B34DI8ubiV0pTRMH473WIMC/kgFM/tjDaKSqxmNS6/zPJyvehq/qVBnzrAdk
lWfNVyULE47BKQjmZy6jlLHGR/3aPgQxwpvwcyZ1dXfrsiyw6uFBGUEejVo/OAro
cjclHcq1syNbTXAeZZZxxRROsRxGq9XPKJdnNf0RvJDwDQbpqzIYLPDCSw/e215U
glDNZx7nVpMaWAG50ywzUFbbb3Shqg==
=vw6q
-----END PGP SIGNATURE-----

--7uHLi7/+eEo7Ny29--
