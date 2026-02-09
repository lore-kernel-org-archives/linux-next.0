Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D889379978;
	Mon,  9 Feb 2026 15:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770651833; cv=none; b=A09LfkTr1lsVsO+ZOVZqEY04WExiDwy6nBJEi6HrgbTnk3FRzYNW6nKs37EQcxwayP3Jx71YeRSjeMzHa+gmGJzq6m0pvyowhIyz79NNvNQ4klShnvAJHCOhC1Ab+vpJMbZoPuJWD/7NoslOX18a6vQK7/fNrVCZyS9uWIMKIu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770651833; c=relaxed/simple;
	bh=9CDMsK0sx3T1eByHx9ka7CemUpPCRCH2rViWsdj8SZ8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qHafsLbN9nfWC8699Psz087rA+hjJovIooDUhCi5XdJpxFBewOmC6rhvY0YztCMrGPlqskkxij+AjhXvogOo7xuKW46dkyOr+g4vFRuMf0nXh87gvXB74juRCt1Jz9dg+NxVxKjWpOwZ5gXwPW55yhlAZ2xVFTpch2W4whqQyIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AkyD9KmU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AkyD9KmU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CBD9C116C6;
	Mon,  9 Feb 2026 15:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770651833;
	bh=9CDMsK0sx3T1eByHx9ka7CemUpPCRCH2rViWsdj8SZ8=;
	h=Date:From:To:Cc:Subject:From;
	b=AkyD9KmUrIqnNOwrPvXF976CJewqToU6TvfAOXrPuJj/NK580P5c+RV47RxlQoPUO
	 hS3aEc38ExCxUY/kaZ7paMbcfFZL9pF2B3beaXHOl+hboF0iZqjQzXBsBDXJPex5nA
	 JVA8FMn8BY+PJHLAHrs80G1QSFfLu9LQksEFjx5uf0KWT5bLU4HLv5s6w28st47Who
	 nFCYqVLsTajdJ/7yNUUkprk13NY6Kj0VL/hVq3cxpIx/5xUdpPQ+sycjYuIrCO3/AL
	 uPiiyXTuK0TNvXF0zVOEkhju5akCDiwh1lVkcAY3rbxfqyI/sTg9h+LHH92qooVwuP
	 dlNNlKcbMfjnA==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id C772A1AC57F0; Mon, 09 Feb 2026 15:43:49 +0000 (GMT)
Date: Mon, 9 Feb 2026 15:43:49 +0000
From: Mark Brown <broonie@kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Yury Norov <ynorov@nvidia.com>
Subject: linux-next: manual merge of the ftrace tree with the mm-nonmm-stable
 tree
Message-ID: <aYoAtbc4L0N-g6C-@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="DuB7de0gZu01xCGL"
Content-Disposition: inline


--DuB7de0gZu01xCGL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the ftrace tree got a conflict in:

  kernel/trace/trace.c

between commit:

  86e685ff364394 ("tracing: remove size parameter in __trace_puts()")

=66rom the mm-nonmm-stable tree and commits:

  27931ee8f45415 ("tracing: Move trace_printk functions out of trace.c and =
into trace_printk.c")
  0e730bc067e7a7 ("tracing: Move __trace_buffer_{un}lock_*() functions to t=
race.h")

=66rom the ftrace tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.


diff --combined kernel/trace/trace.c
index b1cb30a7b83d3a,845b8a165daf3c..00000000000000
--- a/kernel/trace/trace.c
+++ b/kernel/trace/trace.c
@@@ -67,7 -67,7 +67,7 @@@
   * insertions into the ring-buffer such as trace_printk could occurred
   * at the same time, giving false positive or negative results.
   */
- static bool __read_mostly tracing_selftest_running;
+ bool __read_mostly tracing_selftest_running;
 =20
  /*
   * If boot-time tracing including tracers/events via kernel cmdline
@@@ -83,7 -83,6 +83,6 @@@ void __init disable_tracing_selftest(co
  	}
  }
  #else
- #define tracing_selftest_running	0
  #define tracing_selftest_disabled	0
  #endif
 =20
@@@ -114,7 -113,7 +113,7 @@@ DEFINE_PER_CPU(bool, trace_taskinfo_sav
   * of the tracer is successful. But that is the only place that sets
   * this back to zero.
   */
- static int tracing_disabled =3D 1;
+ int tracing_disabled =3D 1;
 =20
  cpumask_var_t __read_mostly	tracing_buffer_mask;
 =20
@@@ -535,22 -534,11 +534,11 @@@ static struct trace_array global_trace=20
  	.trace_flags =3D TRACE_DEFAULT_FLAGS,
  };
 =20
- static struct trace_array *printk_trace =3D &global_trace;
+ struct trace_array *printk_trace =3D &global_trace;
 =20
  /* List of trace_arrays interested in the top level trace_marker */
  static LIST_HEAD(marker_copies);
 =20
- static __always_inline bool printk_binsafe(struct trace_array *tr)
- {
- 	/*
- 	 * The binary format of traceprintk can cause a crash if used
- 	 * by a buffer from another boot. Force the use of the
- 	 * non binary version of trace_printk if the trace_printk
- 	 * buffer is a boot mapped ring buffer.
- 	 */
- 	return !(tr->flags & TRACE_ARRAY_FL_BOOT);
- }
-=20
  static void update_printk_trace(struct trace_array *tr)
  {
  	if (printk_trace =3D=3D tr)
@@@ -649,248 -637,6 +637,6 @@@ int tracing_check_open_get_tr(struct tr
  	return 0;
  }
 =20
- /**
-  * trace_find_filtered_pid - check if a pid exists in a filtered_pid list
-  * @filtered_pids: The list of pids to check
-  * @search_pid: The PID to find in @filtered_pids
-  *
-  * Returns true if @search_pid is found in @filtered_pids, and false othe=
rwise.
-  */
- bool
- trace_find_filtered_pid(struct trace_pid_list *filtered_pids, pid_t searc=
h_pid)
- {
- 	return trace_pid_list_is_set(filtered_pids, search_pid);
- }
-=20
- /**
-  * trace_ignore_this_task - should a task be ignored for tracing
-  * @filtered_pids: The list of pids to check
-  * @filtered_no_pids: The list of pids not to be traced
-  * @task: The task that should be ignored if not filtered
-  *
-  * Checks if @task should be traced or not from @filtered_pids.
-  * Returns true if @task should *NOT* be traced.
-  * Returns false if @task should be traced.
-  */
- bool
- trace_ignore_this_task(struct trace_pid_list *filtered_pids,
- 		       struct trace_pid_list *filtered_no_pids,
- 		       struct task_struct *task)
- {
- 	/*
- 	 * If filtered_no_pids is not empty, and the task's pid is listed
- 	 * in filtered_no_pids, then return true.
- 	 * Otherwise, if filtered_pids is empty, that means we can
- 	 * trace all tasks. If it has content, then only trace pids
- 	 * within filtered_pids.
- 	 */
-=20
- 	return (filtered_pids &&
- 		!trace_find_filtered_pid(filtered_pids, task->pid)) ||
- 		(filtered_no_pids &&
- 		 trace_find_filtered_pid(filtered_no_pids, task->pid));
- }
-=20
- /**
-  * trace_filter_add_remove_task - Add or remove a task from a pid_list
-  * @pid_list: The list to modify
-  * @self: The current task for fork or NULL for exit
-  * @task: The task to add or remove
-  *
-  * If adding a task, if @self is defined, the task is only added if @self
-  * is also included in @pid_list. This happens on fork and tasks should
-  * only be added when the parent is listed. If @self is NULL, then the
-  * @task pid will be removed from the list, which would happen on exit
-  * of a task.
-  */
- void trace_filter_add_remove_task(struct trace_pid_list *pid_list,
- 				  struct task_struct *self,
- 				  struct task_struct *task)
- {
- 	if (!pid_list)
- 		return;
-=20
- 	/* For forks, we only add if the forking task is listed */
- 	if (self) {
- 		if (!trace_find_filtered_pid(pid_list, self->pid))
- 			return;
- 	}
-=20
- 	/* "self" is set for forks, and NULL for exits */
- 	if (self)
- 		trace_pid_list_set(pid_list, task->pid);
- 	else
- 		trace_pid_list_clear(pid_list, task->pid);
- }
-=20
- /**
-  * trace_pid_next - Used for seq_file to get to the next pid of a pid_list
-  * @pid_list: The pid list to show
-  * @v: The last pid that was shown (+1 the actual pid to let zero be disp=
layed)
-  * @pos: The position of the file
-  *
-  * This is used by the seq_file "next" operation to iterate the pids
-  * listed in a trace_pid_list structure.
-  *
-  * Returns the pid+1 as we want to display pid of zero, but NULL would
-  * stop the iteration.
-  */
- void *trace_pid_next(struct trace_pid_list *pid_list, void *v, loff_t *po=
s)
- {
- 	long pid =3D (unsigned long)v;
- 	unsigned int next;
-=20
- 	(*pos)++;
-=20
- 	/* pid already is +1 of the actual previous bit */
- 	if (trace_pid_list_next(pid_list, pid, &next) < 0)
- 		return NULL;
-=20
- 	pid =3D next;
-=20
- 	/* Return pid + 1 to allow zero to be represented */
- 	return (void *)(pid + 1);
- }
-=20
- /**
-  * trace_pid_start - Used for seq_file to start reading pid lists
-  * @pid_list: The pid list to show
-  * @pos: The position of the file
-  *
-  * This is used by seq_file "start" operation to start the iteration
-  * of listing pids.
-  *
-  * Returns the pid+1 as we want to display pid of zero, but NULL would
-  * stop the iteration.
-  */
- void *trace_pid_start(struct trace_pid_list *pid_list, loff_t *pos)
- {
- 	unsigned long pid;
- 	unsigned int first;
- 	loff_t l =3D 0;
-=20
- 	if (trace_pid_list_first(pid_list, &first) < 0)
- 		return NULL;
-=20
- 	pid =3D first;
-=20
- 	/* Return pid + 1 so that zero can be the exit value */
- 	for (pid++; pid && l < *pos;
- 	     pid =3D (unsigned long)trace_pid_next(pid_list, (void *)pid, &l))
- 		;
- 	return (void *)pid;
- }
-=20
- /**
-  * trace_pid_show - show the current pid in seq_file processing
-  * @m: The seq_file structure to write into
-  * @v: A void pointer of the pid (+1) value to display
-  *
-  * Can be directly used by seq_file operations to display the current
-  * pid value.
-  */
- int trace_pid_show(struct seq_file *m, void *v)
- {
- 	unsigned long pid =3D (unsigned long)v - 1;
-=20
- 	seq_printf(m, "%lu\n", pid);
- 	return 0;
- }
-=20
- /* 128 should be much more than enough */
- #define PID_BUF_SIZE		127
-=20
- int trace_pid_write(struct trace_pid_list *filtered_pids,
- 		    struct trace_pid_list **new_pid_list,
- 		    const char __user *ubuf, size_t cnt)
- {
- 	struct trace_pid_list *pid_list;
- 	struct trace_parser parser;
- 	unsigned long val;
- 	int nr_pids =3D 0;
- 	ssize_t read =3D 0;
- 	ssize_t ret;
- 	loff_t pos;
- 	pid_t pid;
-=20
- 	if (trace_parser_get_init(&parser, PID_BUF_SIZE + 1))
- 		return -ENOMEM;
-=20
- 	/*
- 	 * Always recreate a new array. The write is an all or nothing
- 	 * operation. Always create a new array when adding new pids by
- 	 * the user. If the operation fails, then the current list is
- 	 * not modified.
- 	 */
- 	pid_list =3D trace_pid_list_alloc();
- 	if (!pid_list) {
- 		trace_parser_put(&parser);
- 		return -ENOMEM;
- 	}
-=20
- 	if (filtered_pids) {
- 		/* copy the current bits to the new max */
- 		ret =3D trace_pid_list_first(filtered_pids, &pid);
- 		while (!ret) {
- 			ret =3D trace_pid_list_set(pid_list, pid);
- 			if (ret < 0)
- 				goto out;
-=20
- 			ret =3D trace_pid_list_next(filtered_pids, pid + 1, &pid);
- 			nr_pids++;
- 		}
- 	}
-=20
- 	ret =3D 0;
- 	while (cnt > 0) {
-=20
- 		pos =3D 0;
-=20
- 		ret =3D trace_get_user(&parser, ubuf, cnt, &pos);
- 		if (ret < 0)
- 			break;
-=20
- 		read +=3D ret;
- 		ubuf +=3D ret;
- 		cnt -=3D ret;
-=20
- 		if (!trace_parser_loaded(&parser))
- 			break;
-=20
- 		ret =3D -EINVAL;
- 		if (kstrtoul(parser.buffer, 0, &val))
- 			break;
-=20
- 		pid =3D (pid_t)val;
-=20
- 		if (trace_pid_list_set(pid_list, pid) < 0) {
- 			ret =3D -1;
- 			break;
- 		}
- 		nr_pids++;
-=20
- 		trace_parser_clear(&parser);
- 		ret =3D 0;
- 	}
-  out:
- 	trace_parser_put(&parser);
-=20
- 	if (ret < 0) {
- 		trace_pid_list_free(pid_list);
- 		return ret;
- 	}
-=20
- 	if (!nr_pids) {
- 		/* Cleared the list of pids */
- 		trace_pid_list_free(pid_list);
- 		pid_list =3D NULL;
- 	}
-=20
- 	*new_pid_list =3D pid_list;
-=20
- 	return read;
- }
-=20
  static u64 buffer_ftrace_now(struct array_buffer *buf, int cpu)
  {
  	u64 ts;
@@@ -1033,56 -779,6 +779,6 @@@ static inline void trace_access_lock_in
 =20
  #endif
 =20
- #ifdef CONFIG_STACKTRACE
- static void __ftrace_trace_stack(struct trace_array *tr,
- 				 struct trace_buffer *buffer,
- 				 unsigned int trace_ctx,
- 				 int skip, struct pt_regs *regs);
- static inline void ftrace_trace_stack(struct trace_array *tr,
- 				      struct trace_buffer *buffer,
- 				      unsigned int trace_ctx,
- 				      int skip, struct pt_regs *regs);
-=20
- #else
- static inline void __ftrace_trace_stack(struct trace_array *tr,
- 					struct trace_buffer *buffer,
- 					unsigned int trace_ctx,
- 					int skip, struct pt_regs *regs)
- {
- }
- static inline void ftrace_trace_stack(struct trace_array *tr,
- 				      struct trace_buffer *buffer,
- 				      unsigned long trace_ctx,
- 				      int skip, struct pt_regs *regs)
- {
- }
-=20
- #endif
-=20
- static __always_inline void
- trace_event_setup(struct ring_buffer_event *event,
- 		  int type, unsigned int trace_ctx)
- {
- 	struct trace_entry *ent =3D ring_buffer_event_data(event);
-=20
- 	tracing_generic_entry_update(ent, type, trace_ctx);
- }
-=20
- static __always_inline struct ring_buffer_event *
- __trace_buffer_lock_reserve(struct trace_buffer *buffer,
- 			  int type,
- 			  unsigned long len,
- 			  unsigned int trace_ctx)
- {
- 	struct ring_buffer_event *event;
-=20
- 	event =3D ring_buffer_lock_reserve(buffer, len);
- 	if (event !=3D NULL)
- 		trace_event_setup(event, type, trace_ctx);
-=20
- 	return event;
- }
-=20
  void tracer_tracing_on(struct trace_array *tr)
  {
  	if (tr->array_buffer.buffer)
@@@ -1110,129 -806,10 +806,10 @@@ void tracing_on(void
  }
  EXPORT_SYMBOL_GPL(tracing_on);
 =20
-=20
- static __always_inline void
- __buffer_unlock_commit(struct trace_buffer *buffer, struct ring_buffer_ev=
ent *event)
- {
- 	__this_cpu_write(trace_taskinfo_save, true);
-=20
- 	/* If this is the temp buffer, we need to commit fully */
- 	if (this_cpu_read(trace_buffered_event) =3D=3D event) {
- 		/* Length is in event->array[0] */
- 		ring_buffer_write(buffer, event->array[0], &event->array[1]);
- 		/* Release the temp buffer */
- 		this_cpu_dec(trace_buffered_event_cnt);
- 		/* ring_buffer_unlock_commit() enables preemption */
- 		preempt_enable_notrace();
- 	} else
- 		ring_buffer_unlock_commit(buffer);
- }
-=20
- int __trace_array_puts(struct trace_array *tr, unsigned long ip,
- 		       const char *str, int size)
- {
- 	struct ring_buffer_event *event;
- 	struct trace_buffer *buffer;
- 	struct print_entry *entry;
- 	unsigned int trace_ctx;
- 	int alloc;
-=20
- 	if (!(tr->trace_flags & TRACE_ITER(PRINTK)))
- 		return 0;
-=20
- 	if (unlikely(tracing_selftest_running && tr =3D=3D &global_trace))
- 		return 0;
-=20
- 	if (unlikely(tracing_disabled))
- 		return 0;
-=20
- 	alloc =3D sizeof(*entry) + size + 2; /* possible \n added */
-=20
- 	trace_ctx =3D tracing_gen_ctx();
- 	buffer =3D tr->array_buffer.buffer;
- 	guard(ring_buffer_nest)(buffer);
- 	event =3D __trace_buffer_lock_reserve(buffer, TRACE_PRINT, alloc,
- 					    trace_ctx);
- 	if (!event)
- 		return 0;
-=20
- 	entry =3D ring_buffer_event_data(event);
- 	entry->ip =3D ip;
-=20
- 	memcpy(&entry->buf, str, size);
-=20
- 	/* Add a newline if necessary */
- 	if (entry->buf[size - 1] !=3D '\n') {
- 		entry->buf[size] =3D '\n';
- 		entry->buf[size + 1] =3D '\0';
- 	} else
- 		entry->buf[size] =3D '\0';
-=20
- 	__buffer_unlock_commit(buffer, event);
- 	ftrace_trace_stack(tr, buffer, trace_ctx, 4, NULL);
- 	return size;
- }
- EXPORT_SYMBOL_GPL(__trace_array_puts);
-=20
- /**
-  * __trace_puts - write a constant string into the trace buffer.
-  * @ip:	   The address of the caller
-  * @str:   The constant string to write
-  */
- int __trace_puts(unsigned long ip, const char *str)
- {
- 	return __trace_array_puts(printk_trace, ip, str, strlen(str));
- }
- EXPORT_SYMBOL_GPL(__trace_puts);
-=20
- /**
-  * __trace_bputs - write the pointer to a constant string into trace buff=
er
-  * @ip:	   The address of the caller
-  * @str:   The constant string to write to the buffer to
-  */
- int __trace_bputs(unsigned long ip, const char *str)
- {
- 	struct trace_array *tr =3D READ_ONCE(printk_trace);
- 	struct ring_buffer_event *event;
- 	struct trace_buffer *buffer;
- 	struct bputs_entry *entry;
- 	unsigned int trace_ctx;
- 	int size =3D sizeof(struct bputs_entry);
-=20
- 	if (!printk_binsafe(tr))
- 		return __trace_puts(ip, str);
-=20
- 	if (!(tr->trace_flags & TRACE_ITER(PRINTK)))
- 		return 0;
-=20
- 	if (unlikely(tracing_selftest_running || tracing_disabled))
- 		return 0;
-=20
- 	trace_ctx =3D tracing_gen_ctx();
- 	buffer =3D tr->array_buffer.buffer;
-=20
- 	guard(ring_buffer_nest)(buffer);
- 	event =3D __trace_buffer_lock_reserve(buffer, TRACE_BPUTS, size,
- 					    trace_ctx);
- 	if (!event)
- 		return 0;
-=20
- 	entry =3D ring_buffer_event_data(event);
- 	entry->ip			=3D ip;
- 	entry->str			=3D str;
-=20
- 	__buffer_unlock_commit(buffer, event);
- 	ftrace_trace_stack(tr, buffer, trace_ctx, 4, NULL);
-=20
- 	return 1;
- }
- EXPORT_SYMBOL_GPL(__trace_bputs);
-=20
  #ifdef CONFIG_TRACER_SNAPSHOT
  static void tracing_snapshot_instance_cond(struct trace_array *tr,
  					   void *cond_data)
  {
- 	struct tracer *tracer =3D tr->current_trace;
  	unsigned long flags;
 =20
  	if (in_nmi()) {
@@@ -1248,15 -825,15 +825,15 @@@
  		return;
  	}
 =20
- 	/* Note, snapshot can not be used when the tracer uses it */
- 	if (tracer->use_max_tr) {
- 		trace_array_puts(tr, "*** LATENCY TRACER ACTIVE ***\n");
+ 	if (tr->mapped) {
+ 		trace_array_puts(tr, "*** BUFFER MEMORY MAPPED ***\n");
  		trace_array_puts(tr, "*** Can not use snapshot (sorry) ***\n");
  		return;
  	}
 =20
- 	if (tr->mapped) {
- 		trace_array_puts(tr, "*** BUFFER MEMORY MAPPED ***\n");
+ 	/* Note, snapshot can not be used when the tracer uses it */
+ 	if (tracer_uses_snapshot(tr->current_trace)) {
+ 		trace_array_puts(tr, "*** LATENCY TRACER ACTIVE ***\n");
  		trace_array_puts(tr, "*** Can not use snapshot (sorry) ***\n");
  		return;
  	}
@@@ -1356,12 -933,12 +933,12 @@@ int tracing_alloc_snapshot_instance(str
 =20
  		/* Make the snapshot buffer have the same order as main buffer */
  		order =3D ring_buffer_subbuf_order_get(tr->array_buffer.buffer);
- 		ret =3D ring_buffer_subbuf_order_set(tr->max_buffer.buffer, order);
+ 		ret =3D ring_buffer_subbuf_order_set(tr->snapshot_buffer.buffer, order);
  		if (ret < 0)
  			return ret;
 =20
  		/* allocate spare buffer */
- 		ret =3D resize_buffer_duplicate_size(&tr->max_buffer,
+ 		ret =3D resize_buffer_duplicate_size(&tr->snapshot_buffer,
  				   &tr->array_buffer, RING_BUFFER_ALL_CPUS);
  		if (ret < 0)
  			return ret;
@@@ -1379,10 -956,10 +956,10 @@@ static void free_snapshot(struct trace_
  	 * The max_tr ring buffer has some state (e.g. ring->clock) and
  	 * we want preserve it.
  	 */
- 	ring_buffer_subbuf_order_set(tr->max_buffer.buffer, 0);
- 	ring_buffer_resize(tr->max_buffer.buffer, 1, RING_BUFFER_ALL_CPUS);
- 	set_buffer_entries(&tr->max_buffer, 1);
- 	tracing_reset_online_cpus(&tr->max_buffer);
+ 	ring_buffer_subbuf_order_set(tr->snapshot_buffer.buffer, 0);
+ 	ring_buffer_resize(tr->snapshot_buffer.buffer, 1, RING_BUFFER_ALL_CPUS);
+ 	set_buffer_entries(&tr->snapshot_buffer, 1);
+ 	tracing_reset_online_cpus(&tr->snapshot_buffer);
  	tr->allocated_snapshot =3D false;
  }
 =20
@@@ -1498,7 -1075,7 +1075,7 @@@ int tracing_snapshot_cond_enable(struc
 =20
  	guard(mutex)(&trace_types_lock);
 =20
- 	if (tr->current_trace->use_max_tr)
+ 	if (tracer_uses_snapshot(tr->current_trace))
  		return -EBUSY;
 =20
  	/*
@@@ -1665,9 -1242,18 +1242,18 @@@ EXPORT_SYMBOL_GPL(tracing_off)
  void disable_trace_on_warning(void)
  {
  	if (__disable_trace_on_warning) {
+ 		struct trace_array *tr =3D READ_ONCE(printk_trace);
+=20
  		trace_array_printk_buf(global_trace.array_buffer.buffer, _THIS_IP_,
  			"Disabling tracing due to warning\n");
  		tracing_off();
+=20
+ 		/* Disable trace_printk() buffer too */
+ 		if (tr !=3D &global_trace) {
+ 			trace_array_printk_buf(tr->array_buffer.buffer, _THIS_IP_,
+ 					       "Disabling tracing due to warning\n");
+ 			tracer_tracing_off(tr);
+ 		}
  	}
  }
 =20
@@@ -1902,10 -1488,7 +1488,7 @@@ static ssize_t trace_seq_to_buffer(stru
  unsigned long __read_mostly	tracing_thresh;
 =20
  #ifdef CONFIG_TRACER_MAX_TRACE
- static const struct file_operations tracing_max_lat_fops;
-=20
  #ifdef LATENCY_FS_NOTIFY
-=20
  static struct workqueue_struct *fsnotify_wq;
 =20
  static void latency_fsnotify_workfn(struct work_struct *work)
@@@ -1922,17 -1505,6 +1505,6 @@@ static void latency_fsnotify_workfn_irq
  	queue_work(fsnotify_wq, &tr->fsnotify_work);
  }
 =20
- static void trace_create_maxlat_file(struct trace_array *tr,
- 				     struct dentry *d_tracer)
- {
- 	INIT_WORK(&tr->fsnotify_work, latency_fsnotify_workfn);
- 	init_irq_work(&tr->fsnotify_irqwork, latency_fsnotify_workfn_irq);
- 	tr->d_max_latency =3D trace_create_file("tracing_max_latency",
- 					      TRACE_MODE_WRITE,
- 					      d_tracer, tr,
- 					      &tracing_max_lat_fops);
- }
-=20
  __init static int latency_fsnotify_init(void)
  {
  	fsnotify_wq =3D alloc_workqueue("tr_max_lat_wq",
@@@ -1957,14 -1529,22 +1529,22 @@@ void latency_fsnotify(struct trace_arra
  	 */
  	irq_work_queue(&tr->fsnotify_irqwork);
  }
+ #endif /* !LATENCY_FS_NOTIFY */
 =20
- #else /* !LATENCY_FS_NOTIFY */
-=20
- #define trace_create_maxlat_file(tr, d_tracer)				\
- 	trace_create_file("tracing_max_latency", TRACE_MODE_WRITE,	\
- 			  d_tracer, tr, &tracing_max_lat_fops)
+ static const struct file_operations tracing_max_lat_fops;
 =20
+ static void trace_create_maxlat_file(struct trace_array *tr,
+ 				     struct dentry *d_tracer)
+ {
+ #ifdef LATENCY_FS_NOTIFY
+ 	INIT_WORK(&tr->fsnotify_work, latency_fsnotify_workfn);
+ 	init_irq_work(&tr->fsnotify_irqwork, latency_fsnotify_workfn_irq);
  #endif
+ 	tr->d_max_latency =3D trace_create_file("tracing_max_latency",
+ 					      TRACE_MODE_WRITE,
+ 					      d_tracer, tr,
+ 					      &tracing_max_lat_fops);
+ }
 =20
  /*
   * Copy the new maximum trace into the separate maximum-trace
@@@ -1975,8 -1555,8 +1555,8 @@@ static voi
  __update_max_tr(struct trace_array *tr, struct task_struct *tsk, int cpu)
  {
  	struct array_buffer *trace_buf =3D &tr->array_buffer;
- 	struct array_buffer *max_buf =3D &tr->max_buffer;
  	struct trace_array_cpu *data =3D per_cpu_ptr(trace_buf->data, cpu);
+ 	struct array_buffer *max_buf =3D &tr->snapshot_buffer;
  	struct trace_array_cpu *max_data =3D per_cpu_ptr(max_buf->data, cpu);
 =20
  	max_buf->cpu =3D cpu;
@@@ -2005,7 -1585,14 +1585,14 @@@
  	tracing_record_cmdline(tsk);
  	latency_fsnotify(tr);
  }
+ #else
+ static inline void trace_create_maxlat_file(struct trace_array *tr,
+ 					    struct dentry *d_tracer) { }
+ static inline void __update_max_tr(struct trace_array *tr,
+ 				   struct task_struct *tsk, int cpu) { }
+ #endif /* CONFIG_TRACER_MAX_TRACE */
 =20
+ #ifdef CONFIG_TRACER_SNAPSHOT
  /**
   * update_max_tr - snapshot all trace buffers from global_trace to max_tr
   * @tr: tracer
@@@ -2035,17 -1622,16 +1622,16 @@@ update_max_tr(struct trace_array *tr, s
 =20
  	/* Inherit the recordable setting from array_buffer */
  	if (ring_buffer_record_is_set_on(tr->array_buffer.buffer))
- 		ring_buffer_record_on(tr->max_buffer.buffer);
+ 		ring_buffer_record_on(tr->snapshot_buffer.buffer);
  	else
- 		ring_buffer_record_off(tr->max_buffer.buffer);
+ 		ring_buffer_record_off(tr->snapshot_buffer.buffer);
 =20
- #ifdef CONFIG_TRACER_SNAPSHOT
  	if (tr->cond_snapshot && !tr->cond_snapshot->update(tr, cond_data)) {
  		arch_spin_unlock(&tr->max_lock);
  		return;
  	}
- #endif
- 	swap(tr->array_buffer.buffer, tr->max_buffer.buffer);
+=20
+ 	swap(tr->array_buffer.buffer, tr->snapshot_buffer.buffer);
 =20
  	__update_max_tr(tr, tsk, cpu);
 =20
@@@ -2080,7 -1666,7 +1666,7 @@@ update_max_tr_single(struct trace_arra
 =20
  	arch_spin_lock(&tr->max_lock);
 =20
- 	ret =3D ring_buffer_swap_cpu(tr->max_buffer.buffer, tr->array_buffer.buf=
fer, cpu);
+ 	ret =3D ring_buffer_swap_cpu(tr->snapshot_buffer.buffer, tr->array_buffe=
r.buffer, cpu);
 =20
  	if (ret =3D=3D -EBUSY) {
  		/*
@@@ -2090,7 -1676,7 +1676,7 @@@
  		 * and flag that it failed.
  		 * Another reason is resize is in progress.
  		 */
- 		trace_array_printk_buf(tr->max_buffer.buffer, _THIS_IP_,
+ 		trace_array_printk_buf(tr->snapshot_buffer.buffer, _THIS_IP_,
  			"Failed to swap buffers due to commit or resize in progress\n");
  	}
 =20
@@@ -2099,8 -1685,7 +1685,7 @@@
  	__update_max_tr(tr, tsk, cpu);
  	arch_spin_unlock(&tr->max_lock);
  }
-=20
- #endif /* CONFIG_TRACER_MAX_TRACE */
+ #endif /* CONFIG_TRACER_SNAPSHOT */
 =20
  struct pipe_wait {
  	struct trace_iterator		*iter;
@@@ -2133,13 -1718,13 +1718,13 @@@ static int wait_on_pipe(struct trace_it
  	ret =3D ring_buffer_wait(iter->array_buffer->buffer, iter->cpu_file, ful=
l,
  			       wait_pipe_cond, &pwait);
 =20
- #ifdef CONFIG_TRACER_MAX_TRACE
+ #ifdef CONFIG_TRACER_SNAPSHOT
  	/*
  	 * Make sure this is still the snapshot buffer, as if a snapshot were
  	 * to happen, this would now be the main buffer.
  	 */
  	if (iter->snapshot)
- 		iter->array_buffer =3D &iter->tr->max_buffer;
+ 		iter->array_buffer =3D &iter->tr->snapshot_buffer;
  #endif
  	return ret;
  }
@@@ -2204,10 -1789,10 +1789,10 @@@ static int run_tracer_selftest(struct t
  	tr->current_trace_flags =3D type->flags ? : type->default_flags;
 =20
  #ifdef CONFIG_TRACER_MAX_TRACE
- 	if (type->use_max_tr) {
+ 	if (tracer_uses_snapshot(type)) {
  		/* If we expanded the buffers, make sure the max is expanded too */
  		if (tr->ring_buffer_expanded)
- 			ring_buffer_resize(tr->max_buffer.buffer, trace_buf_size,
+ 			ring_buffer_resize(tr->snapshot_buffer.buffer, trace_buf_size,
  					   RING_BUFFER_ALL_CPUS);
  		tr->allocated_snapshot =3D true;
  	}
@@@ -2229,12 -1814,12 +1814,12 @@@
  	tracing_reset_online_cpus(&tr->array_buffer);
 =20
  #ifdef CONFIG_TRACER_MAX_TRACE
- 	if (type->use_max_tr) {
+ 	if (tracer_uses_snapshot(type)) {
  		tr->allocated_snapshot =3D false;
 =20
  		/* Shrink the max buffer again */
  		if (tr->ring_buffer_expanded)
- 			ring_buffer_resize(tr->max_buffer.buffer, 1,
+ 			ring_buffer_resize(tr->snapshot_buffer.buffer, 1,
  					   RING_BUFFER_ALL_CPUS);
  	}
  #endif
@@@ -2476,8 -2061,8 +2061,8 @@@ void tracing_reset_all_online_cpus_unlo
  			continue;
  		tr->clear_trace =3D false;
  		tracing_reset_online_cpus(&tr->array_buffer);
- #ifdef CONFIG_TRACER_MAX_TRACE
- 		tracing_reset_online_cpus(&tr->max_buffer);
+ #ifdef CONFIG_TRACER_SNAPSHOT
+ 		tracing_reset_online_cpus(&tr->snapshot_buffer);
  #endif
  	}
  }
@@@ -2516,8 -2101,8 +2101,8 @@@ static void tracing_start_tr(struct tra
  	if (buffer)
  		ring_buffer_record_enable(buffer);
 =20
- #ifdef CONFIG_TRACER_MAX_TRACE
- 	buffer =3D tr->max_buffer.buffer;
+ #ifdef CONFIG_TRACER_SNAPSHOT
+ 	buffer =3D tr->snapshot_buffer.buffer;
  	if (buffer)
  		ring_buffer_record_enable(buffer);
  #endif
@@@ -2552,8 -2137,8 +2137,8 @@@ static void tracing_stop_tr(struct trac
  	if (buffer)
  		ring_buffer_record_disable(buffer);
 =20
- #ifdef CONFIG_TRACER_MAX_TRACE
- 	buffer =3D tr->max_buffer.buffer;
+ #ifdef CONFIG_TRACER_SNAPSHOT
+ 	buffer =3D tr->snapshot_buffer.buffer;
  	if (buffer)
  		ring_buffer_record_disable(buffer);
  #endif
@@@ -3001,10 -2586,10 +2586,10 @@@ struct ftrace_stacks=20
  static DEFINE_PER_CPU(struct ftrace_stacks, ftrace_stacks);
  static DEFINE_PER_CPU(int, ftrace_stack_reserve);
 =20
- static void __ftrace_trace_stack(struct trace_array *tr,
- 				 struct trace_buffer *buffer,
- 				 unsigned int trace_ctx,
- 				 int skip, struct pt_regs *regs)
+ void __ftrace_trace_stack(struct trace_array *tr,
+ 			  struct trace_buffer *buffer,
+ 			  unsigned int trace_ctx,
+ 			  int skip, struct pt_regs *regs)
  {
  	struct ring_buffer_event *event;
  	unsigned int size, nr_entries;
@@@ -3087,17 -2672,6 +2672,6 @@@
  	trace_clear_recursion(bit);
  }
 =20
- static inline void ftrace_trace_stack(struct trace_array *tr,
- 				      struct trace_buffer *buffer,
- 				      unsigned int trace_ctx,
- 				      int skip, struct pt_regs *regs)
- {
- 	if (!(tr->trace_flags & TRACE_ITER(STACKTRACE)))
- 		return;
-=20
- 	__ftrace_trace_stack(tr, buffer, trace_ctx, skip, regs);
- }
-=20
  void __trace_stack(struct trace_array *tr, unsigned int trace_ctx,
  		   int skip)
  {
@@@ -3232,324 -2806,6 +2806,6 @@@ void trace_last_func_repeats(struct tra
  	__buffer_unlock_commit(buffer, event);
  }
 =20
- /* created for use with alloc_percpu */
- struct trace_buffer_struct {
- 	int nesting;
- 	char buffer[4][TRACE_BUF_SIZE];
- };
-=20
- static struct trace_buffer_struct __percpu *trace_percpu_buffer;
-=20
- /*
-  * This allows for lockless recording.  If we're nested too deeply, then
-  * this returns NULL.
-  */
- static char *get_trace_buf(void)
- {
- 	struct trace_buffer_struct *buffer =3D this_cpu_ptr(trace_percpu_buffer);
-=20
- 	if (!trace_percpu_buffer || buffer->nesting >=3D 4)
- 		return NULL;
-=20
- 	buffer->nesting++;
-=20
- 	/* Interrupts must see nesting incremented before we use the buffer */
- 	barrier();
- 	return &buffer->buffer[buffer->nesting - 1][0];
- }
-=20
- static void put_trace_buf(void)
- {
- 	/* Don't let the decrement of nesting leak before this */
- 	barrier();
- 	this_cpu_dec(trace_percpu_buffer->nesting);
- }
-=20
- static int alloc_percpu_trace_buffer(void)
- {
- 	struct trace_buffer_struct __percpu *buffers;
-=20
- 	if (trace_percpu_buffer)
- 		return 0;
-=20
- 	buffers =3D alloc_percpu(struct trace_buffer_struct);
- 	if (MEM_FAIL(!buffers, "Could not allocate percpu trace_printk buffer"))
- 		return -ENOMEM;
-=20
- 	trace_percpu_buffer =3D buffers;
- 	return 0;
- }
-=20
- static int buffers_allocated;
-=20
- void trace_printk_init_buffers(void)
- {
- 	if (buffers_allocated)
- 		return;
-=20
- 	if (alloc_percpu_trace_buffer())
- 		return;
-=20
- 	/* trace_printk() is for debug use only. Don't use it in production. */
-=20
- 	pr_warn("\n");
- 	pr_warn("**********************************************************\n");
- 	pr_warn("**   NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE   **\n");
- 	pr_warn("**                                                      **\n");
- 	pr_warn("** trace_printk() being used. Allocating extra memory.  **\n");
- 	pr_warn("**                                                      **\n");
- 	pr_warn("** This means that this is a DEBUG kernel and it is     **\n");
- 	pr_warn("** unsafe for production use.                           **\n");
- 	pr_warn("**                                                      **\n");
- 	pr_warn("** If you see this message and you are not debugging    **\n");
- 	pr_warn("** the kernel, report this immediately to your vendor!  **\n");
- 	pr_warn("**                                                      **\n");
- 	pr_warn("**   NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE   **\n");
- 	pr_warn("**********************************************************\n");
-=20
- 	/* Expand the buffers to set size */
- 	tracing_update_buffers(&global_trace);
-=20
- 	buffers_allocated =3D 1;
-=20
- 	/*
- 	 * trace_printk_init_buffers() can be called by modules.
- 	 * If that happens, then we need to start cmdline recording
- 	 * directly here. If the global_trace.buffer is already
- 	 * allocated here, then this was called by module code.
- 	 */
- 	if (global_trace.array_buffer.buffer)
- 		tracing_start_cmdline_record();
- }
- EXPORT_SYMBOL_GPL(trace_printk_init_buffers);
-=20
- void trace_printk_start_comm(void)
- {
- 	/* Start tracing comms if trace printk is set */
- 	if (!buffers_allocated)
- 		return;
- 	tracing_start_cmdline_record();
- }
-=20
- static void trace_printk_start_stop_comm(int enabled)
- {
- 	if (!buffers_allocated)
- 		return;
-=20
- 	if (enabled)
- 		tracing_start_cmdline_record();
- 	else
- 		tracing_stop_cmdline_record();
- }
-=20
- /**
-  * trace_vbprintk - write binary msg to tracing buffer
-  * @ip:    The address of the caller
-  * @fmt:   The string format to write to the buffer
-  * @args:  Arguments for @fmt
-  */
- int trace_vbprintk(unsigned long ip, const char *fmt, va_list args)
- {
- 	struct ring_buffer_event *event;
- 	struct trace_buffer *buffer;
- 	struct trace_array *tr =3D READ_ONCE(printk_trace);
- 	struct bprint_entry *entry;
- 	unsigned int trace_ctx;
- 	char *tbuffer;
- 	int len =3D 0, size;
-=20
- 	if (!printk_binsafe(tr))
- 		return trace_vprintk(ip, fmt, args);
-=20
- 	if (unlikely(tracing_selftest_running || tracing_disabled))
- 		return 0;
-=20
- 	/* Don't pollute graph traces with trace_vprintk internals */
- 	pause_graph_tracing();
-=20
- 	trace_ctx =3D tracing_gen_ctx();
- 	guard(preempt_notrace)();
-=20
- 	tbuffer =3D get_trace_buf();
- 	if (!tbuffer) {
- 		len =3D 0;
- 		goto out_nobuffer;
- 	}
-=20
- 	len =3D vbin_printf((u32 *)tbuffer, TRACE_BUF_SIZE/sizeof(int), fmt, arg=
s);
-=20
- 	if (len > TRACE_BUF_SIZE/sizeof(int) || len < 0)
- 		goto out_put;
-=20
- 	size =3D sizeof(*entry) + sizeof(u32) * len;
- 	buffer =3D tr->array_buffer.buffer;
- 	scoped_guard(ring_buffer_nest, buffer) {
- 		event =3D __trace_buffer_lock_reserve(buffer, TRACE_BPRINT, size,
- 						    trace_ctx);
- 		if (!event)
- 			goto out_put;
- 		entry =3D ring_buffer_event_data(event);
- 		entry->ip			=3D ip;
- 		entry->fmt			=3D fmt;
-=20
- 		memcpy(entry->buf, tbuffer, sizeof(u32) * len);
- 		__buffer_unlock_commit(buffer, event);
- 		ftrace_trace_stack(tr, buffer, trace_ctx, 6, NULL);
- 	}
- out_put:
- 	put_trace_buf();
-=20
- out_nobuffer:
- 	unpause_graph_tracing();
-=20
- 	return len;
- }
- EXPORT_SYMBOL_GPL(trace_vbprintk);
-=20
- static __printf(3, 0)
- int __trace_array_vprintk(struct trace_buffer *buffer,
- 			  unsigned long ip, const char *fmt, va_list args)
- {
- 	struct ring_buffer_event *event;
- 	int len =3D 0, size;
- 	struct print_entry *entry;
- 	unsigned int trace_ctx;
- 	char *tbuffer;
-=20
- 	if (tracing_disabled)
- 		return 0;
-=20
- 	/* Don't pollute graph traces with trace_vprintk internals */
- 	pause_graph_tracing();
-=20
- 	trace_ctx =3D tracing_gen_ctx();
- 	guard(preempt_notrace)();
-=20
-=20
- 	tbuffer =3D get_trace_buf();
- 	if (!tbuffer) {
- 		len =3D 0;
- 		goto out_nobuffer;
- 	}
-=20
- 	len =3D vscnprintf(tbuffer, TRACE_BUF_SIZE, fmt, args);
-=20
- 	size =3D sizeof(*entry) + len + 1;
- 	scoped_guard(ring_buffer_nest, buffer) {
- 		event =3D __trace_buffer_lock_reserve(buffer, TRACE_PRINT, size,
- 						    trace_ctx);
- 		if (!event)
- 			goto out;
- 		entry =3D ring_buffer_event_data(event);
- 		entry->ip =3D ip;
-=20
- 		memcpy(&entry->buf, tbuffer, len + 1);
- 		__buffer_unlock_commit(buffer, event);
- 		ftrace_trace_stack(printk_trace, buffer, trace_ctx, 6, NULL);
- 	}
- out:
- 	put_trace_buf();
-=20
- out_nobuffer:
- 	unpause_graph_tracing();
-=20
- 	return len;
- }
-=20
- int trace_array_vprintk(struct trace_array *tr,
- 			unsigned long ip, const char *fmt, va_list args)
- {
- 	if (tracing_selftest_running && tr =3D=3D &global_trace)
- 		return 0;
-=20
- 	return __trace_array_vprintk(tr->array_buffer.buffer, ip, fmt, args);
- }
-=20
- /**
-  * trace_array_printk - Print a message to a specific instance
-  * @tr: The instance trace_array descriptor
-  * @ip: The instruction pointer that this is called from.
-  * @fmt: The format to print (printf format)
-  *
-  * If a subsystem sets up its own instance, they have the right to
-  * printk strings into their tracing instance buffer using this
-  * function. Note, this function will not write into the top level
-  * buffer (use trace_printk() for that), as writing into the top level
-  * buffer should only have events that can be individually disabled.
-  * trace_printk() is only used for debugging a kernel, and should not
-  * be ever incorporated in normal use.
-  *
-  * trace_array_printk() can be used, as it will not add noise to the
-  * top level tracing buffer.
-  *
-  * Note, trace_array_init_printk() must be called on @tr before this
-  * can be used.
-  */
- int trace_array_printk(struct trace_array *tr,
- 		       unsigned long ip, const char *fmt, ...)
- {
- 	int ret;
- 	va_list ap;
-=20
- 	if (!tr)
- 		return -ENOENT;
-=20
- 	/* This is only allowed for created instances */
- 	if (tr =3D=3D &global_trace)
- 		return 0;
-=20
- 	if (!(tr->trace_flags & TRACE_ITER(PRINTK)))
- 		return 0;
-=20
- 	va_start(ap, fmt);
- 	ret =3D trace_array_vprintk(tr, ip, fmt, ap);
- 	va_end(ap);
- 	return ret;
- }
- EXPORT_SYMBOL_GPL(trace_array_printk);
-=20
- /**
-  * trace_array_init_printk - Initialize buffers for trace_array_printk()
-  * @tr: The trace array to initialize the buffers for
-  *
-  * As trace_array_printk() only writes into instances, they are OK to
-  * have in the kernel (unlike trace_printk()). This needs to be called
-  * before trace_array_printk() can be used on a trace_array.
-  */
- int trace_array_init_printk(struct trace_array *tr)
- {
- 	if (!tr)
- 		return -ENOENT;
-=20
- 	/* This is only allowed for created instances */
- 	if (tr =3D=3D &global_trace)
- 		return -EINVAL;
-=20
- 	return alloc_percpu_trace_buffer();
- }
- EXPORT_SYMBOL_GPL(trace_array_init_printk);
-=20
- int trace_array_printk_buf(struct trace_buffer *buffer,
- 			   unsigned long ip, const char *fmt, ...)
- {
- 	int ret;
- 	va_list ap;
-=20
- 	if (!(printk_trace->trace_flags & TRACE_ITER(PRINTK)))
- 		return 0;
-=20
- 	va_start(ap, fmt);
- 	ret =3D __trace_array_vprintk(buffer, ip, fmt, ap);
- 	va_end(ap);
- 	return ret;
- }
-=20
- int trace_vprintk(unsigned long ip, const char *fmt, va_list args)
- {
- 	return trace_array_vprintk(printk_trace, ip, fmt, args);
- }
- EXPORT_SYMBOL_GPL(trace_vprintk);
-=20
  static void trace_iterator_increment(struct trace_iterator *iter)
  {
  	struct ring_buffer_iter *buf_iter =3D trace_buffer_iter(iter, iter->cpu);
@@@ -3986,10 -3242,8 +3242,8 @@@ static void *s_start(struct seq_file *m
  	}
  	mutex_unlock(&trace_types_lock);
 =20
- #ifdef CONFIG_TRACER_MAX_TRACE
- 	if (iter->snapshot && iter->trace->use_max_tr)
+ 	if (iter->snapshot && tracer_uses_snapshot(iter->trace))
  		return ERR_PTR(-EBUSY);
- #endif
 =20
  	if (*pos !=3D iter->pos) {
  		iter->ent =3D NULL;
@@@ -4028,10 -3282,8 +3282,8 @@@ static void s_stop(struct seq_file *m,=20
  {
  	struct trace_iterator *iter =3D m->private;
 =20
- #ifdef CONFIG_TRACER_MAX_TRACE
- 	if (iter->snapshot && iter->trace->use_max_tr)
+ 	if (iter->snapshot && tracer_uses_snapshot(iter->trace))
  		return;
- #endif
 =20
  	trace_access_unlock(iter->cpu_file);
  	trace_event_read_unlock();
@@@ -4508,7 -3760,7 +3760,7 @@@ static void test_ftrace_alive(struct se
  		    "#          MAY BE MISSING FUNCTION EVENTS\n");
  }
 =20
- #ifdef CONFIG_TRACER_MAX_TRACE
+ #ifdef CONFIG_TRACER_SNAPSHOT
  static void show_snapshot_main_help(struct seq_file *m)
  {
  	seq_puts(m, "# echo 0 > snapshot : Clears and frees snapshot buffer\n"
@@@ -4686,10 -3938,10 +3938,10 @@@ __tracing_open(struct inode *inode, str
 =20
  	iter->tr =3D tr;
 =20
- #ifdef CONFIG_TRACER_MAX_TRACE
+ #ifdef CONFIG_TRACER_SNAPSHOT
  	/* Currently only the top directory has a snapshot */
  	if (tr->current_trace->print_max || snapshot)
- 		iter->array_buffer =3D &tr->max_buffer;
+ 		iter->array_buffer =3D &tr->snapshot_buffer;
  	else
  #endif
  		iter->array_buffer =3D &tr->array_buffer;
@@@ -4758,11 -4010,6 +4010,6 @@@ int tracing_open_generic(struct inode *
  	return 0;
  }
 =20
- bool tracing_is_disabled(void)
- {
- 	return (tracing_disabled) ? true: false;
- }
-=20
  /*
   * Open and update trace_array ref count.
   * Must have the current trace_array passed to it.
@@@ -4897,7 -4144,7 +4144,7 @@@ static int tracing_open(struct inode *i
 =20
  #ifdef CONFIG_TRACER_MAX_TRACE
  		if (tr->current_trace->print_max)
- 			trace_buf =3D &tr->max_buffer;
+ 			trace_buf =3D &tr->snapshot_buffer;
  #endif
 =20
  		if (cpu =3D=3D RING_BUFFER_ALL_CPUS)
@@@ -4928,11 -4175,9 +4175,9 @@@
  static bool
  trace_ok_for_array(struct tracer *t, struct trace_array *tr)
  {
- #ifdef CONFIG_TRACER_SNAPSHOT
  	/* arrays with mapped buffer range do not have snapshots */
- 	if (tr->range_addr_start && t->use_max_tr)
+ 	if (tr->range_addr_start && tracer_uses_snapshot(t))
  		return false;
- #endif
  	return (tr->flags & TRACE_ARRAY_FL_GLOBAL) || t->allow_instances;
  }
 =20
@@@ -5109,15 -4354,15 +4354,15 @@@ int tracing_set_cpumask(struct trace_ar
  		if (cpumask_test_cpu(cpu, tr->tracing_cpumask) &&
  				!cpumask_test_cpu(cpu, tracing_cpumask_new)) {
  			ring_buffer_record_disable_cpu(tr->array_buffer.buffer, cpu);
- #ifdef CONFIG_TRACER_MAX_TRACE
- 			ring_buffer_record_disable_cpu(tr->max_buffer.buffer, cpu);
+ #ifdef CONFIG_TRACER_SNAPSHOT
+ 			ring_buffer_record_disable_cpu(tr->snapshot_buffer.buffer, cpu);
  #endif
  		}
  		if (!cpumask_test_cpu(cpu, tr->tracing_cpumask) &&
  				cpumask_test_cpu(cpu, tracing_cpumask_new)) {
  			ring_buffer_record_enable_cpu(tr->array_buffer.buffer, cpu);
- #ifdef CONFIG_TRACER_MAX_TRACE
- 			ring_buffer_record_enable_cpu(tr->max_buffer.buffer, cpu);
+ #ifdef CONFIG_TRACER_SNAPSHOT
+ 			ring_buffer_record_enable_cpu(tr->snapshot_buffer.buffer, cpu);
  #endif
  		}
  	}
@@@ -5326,8 -4571,8 +4571,8 @@@ int set_tracer_flag(struct trace_array=20
 =20
  	case TRACE_ITER(OVERWRITE):
  		ring_buffer_change_overwrite(tr->array_buffer.buffer, enabled);
- #ifdef CONFIG_TRACER_MAX_TRACE
- 		ring_buffer_change_overwrite(tr->max_buffer.buffer, enabled);
+ #ifdef CONFIG_TRACER_SNAPSHOT
+ 		ring_buffer_change_overwrite(tr->snapshot_buffer.buffer, enabled);
  #endif
  		break;
 =20
@@@ -5990,7 -5235,7 +5235,7 @@@ static void update_buffer_entries(struc
  	}
  }
 =20
- #ifdef CONFIG_TRACER_MAX_TRACE
+ #ifdef CONFIG_TRACER_SNAPSHOT
  /* resize @tr's buffer to the size of @size_tr's entries */
  static int resize_buffer_duplicate_size(struct array_buffer *trace_buf,
  					struct array_buffer *size_buf, int cpu_id)
@@@ -6016,7 -5261,7 +5261,7 @@@
 =20
  	return ret;
  }
- #endif /* CONFIG_TRACER_MAX_TRACE */
+ #endif /* CONFIG_TRACER_SNAPSHOT */
 =20
  static int __tracing_resize_ring_buffer(struct trace_array *tr,
  					unsigned long size, int cpu)
@@@ -6041,11 -5286,11 +5286,11 @@@
  	if (ret < 0)
  		goto out_start;
 =20
- #ifdef CONFIG_TRACER_MAX_TRACE
+ #ifdef CONFIG_TRACER_SNAPSHOT
  	if (!tr->allocated_snapshot)
  		goto out;
 =20
- 	ret =3D ring_buffer_resize(tr->max_buffer.buffer, size, cpu);
+ 	ret =3D ring_buffer_resize(tr->snapshot_buffer.buffer, size, cpu);
  	if (ret < 0) {
  		int r =3D resize_buffer_duplicate_size(&tr->array_buffer,
  						     &tr->array_buffer, cpu);
@@@ -6070,10 -5315,10 +5315,10 @@@
  		goto out_start;
  	}
 =20
- 	update_buffer_entries(&tr->max_buffer, cpu);
+ 	update_buffer_entries(&tr->snapshot_buffer, cpu);
 =20
   out:
- #endif /* CONFIG_TRACER_MAX_TRACE */
+ #endif /* CONFIG_TRACER_SNAPSHOT */
 =20
  	update_buffer_entries(&tr->array_buffer, cpu);
   out_start:
@@@ -6264,6 -5509,9 +5509,9 @@@ int tracing_update_buffers(struct trace
  {
  	int ret =3D 0;
 =20
+ 	if (!tr)
+ 		tr =3D &global_trace;
+=20
  	guard(mutex)(&trace_types_lock);
 =20
  	update_last_data(tr);
@@@ -6298,9 -5546,7 +5546,7 @@@ int tracing_set_tracer(struct trace_arr
  {
  	struct tracer *trace =3D NULL;
  	struct tracers *t;
- #ifdef CONFIG_TRACER_MAX_TRACE
  	bool had_max_tr;
- #endif
  	int ret;
 =20
  	guard(mutex)(&trace_types_lock);
@@@ -6328,7 -5574,7 +5574,7 @@@
  		return 0;
 =20
  #ifdef CONFIG_TRACER_SNAPSHOT
- 	if (trace->use_max_tr) {
+ 	if (tracer_uses_snapshot(trace)) {
  		local_irq_disable();
  		arch_spin_lock(&tr->max_lock);
  		ret =3D tr->cond_snapshot ? -EBUSY : 0;
@@@ -6360,14 -5606,13 +5606,13 @@@
  	if (tr->current_trace->reset)
  		tr->current_trace->reset(tr);
 =20
- #ifdef CONFIG_TRACER_MAX_TRACE
- 	had_max_tr =3D tr->current_trace->use_max_tr;
+ 	had_max_tr =3D tracer_uses_snapshot(tr->current_trace);
 =20
  	/* Current trace needs to be nop_trace before synchronize_rcu */
  	tr->current_trace =3D &nop_trace;
  	tr->current_trace_flags =3D nop_trace.flags;
 =20
- 	if (had_max_tr && !trace->use_max_tr) {
+ 	if (had_max_tr && !tracer_uses_snapshot(trace)) {
  		/*
  		 * We need to make sure that the update_max_tr sees that
  		 * current_trace changed to nop_trace to keep it from
@@@ -6380,24 -5625,19 +5625,19 @@@
  		tracing_disarm_snapshot(tr);
  	}
 =20
- 	if (!had_max_tr && trace->use_max_tr) {
+ 	if (!had_max_tr && tracer_uses_snapshot(trace)) {
  		ret =3D tracing_arm_snapshot_locked(tr);
  		if (ret)
  			return ret;
  	}
- #else
- 	tr->current_trace =3D &nop_trace;
- #endif
 =20
  	tr->current_trace_flags =3D t->flags ? : t->tracer->flags;
 =20
  	if (trace->init) {
  		ret =3D tracer_init(trace, tr);
  		if (ret) {
- #ifdef CONFIG_TRACER_MAX_TRACE
- 			if (trace->use_max_tr)
+ 			if (tracer_uses_snapshot(trace))
  				tracing_disarm_snapshot(tr);
- #endif
  			tr->current_trace_flags =3D nop_trace.flags;
  			return ret;
  		}
@@@ -7602,7 -6842,7 +6842,7 @@@ tracing_mark_write(struct file *filp, c
  	unsigned long ip;
  	char *buf;
 =20
- 	if (tracing_disabled)
+ 	if (unlikely(tracing_disabled))
  		return -EINVAL;
 =20
  	if (!(tr->trace_flags & TRACE_ITER(MARKERS)))
@@@ -7682,7 -6922,7 +6922,7 @@@ tracing_mark_raw_write(struct file *fil
  	ssize_t written =3D -ENODEV;
  	char *buf;
 =20
- 	if (tracing_disabled)
+ 	if (unlikely(tracing_disabled))
  		return -EINVAL;
 =20
  	if (!(tr->trace_flags & TRACE_ITER(MARKERS)))
@@@ -7783,10 -7023,10 +7023,10 @@@ int tracing_set_clock(struct trace_arra
  	 */
  	tracing_reset_online_cpus(&tr->array_buffer);
 =20
- #ifdef CONFIG_TRACER_MAX_TRACE
- 	if (tr->max_buffer.buffer)
- 		ring_buffer_set_clock(tr->max_buffer.buffer, trace_clocks[i].func);
- 	tracing_reset_online_cpus(&tr->max_buffer);
+ #ifdef CONFIG_TRACER_SNAPSHOT
+ 	if (tr->snapshot_buffer.buffer)
+ 		ring_buffer_set_clock(tr->snapshot_buffer.buffer, trace_clocks[i].func);
+ 	tracing_reset_online_cpus(&tr->snapshot_buffer);
  #endif
 =20
  	if (tr->scratch && !(tr->flags & TRACE_ARRAY_FL_LAST_BOOT)) {
@@@ -7880,26 -7120,6 +7120,6 @@@ u64 tracing_event_time_stamp(struct tra
  	return ring_buffer_event_time_stamp(buffer, rbe);
  }
 =20
- /*
-  * Set or disable using the per CPU trace_buffer_event when possible.
-  */
- int tracing_set_filter_buffering(struct trace_array *tr, bool set)
- {
- 	guard(mutex)(&trace_types_lock);
-=20
- 	if (set && tr->no_filter_buffering_ref++)
- 		return 0;
-=20
- 	if (!set) {
- 		if (WARN_ON_ONCE(!tr->no_filter_buffering_ref))
- 			return -EINVAL;
-=20
- 		--tr->no_filter_buffering_ref;
- 	}
-=20
- 	return 0;
- }
-=20
  struct ftrace_buffer_info {
  	struct trace_iterator	iter;
  	void			*spare;
@@@ -7938,7 -7158,7 +7158,7 @@@ static int tracing_snapshot_open(struc
  		ret =3D 0;
 =20
  		iter->tr =3D tr;
- 		iter->array_buffer =3D &tr->max_buffer;
+ 		iter->array_buffer =3D &tr->snapshot_buffer;
  		iter->cpu_file =3D tracing_get_cpu(inode);
  		m->private =3D iter;
  		file->private_data =3D m;
@@@ -7975,7 -7195,7 +7195,7 @@@ tracing_snapshot_write(struct file *fil
 =20
  	guard(mutex)(&trace_types_lock);
 =20
- 	if (tr->current_trace->use_max_tr)
+ 	if (tracer_uses_snapshot(tr->current_trace))
  		return -EBUSY;
 =20
  	local_irq_disable();
@@@ -8001,7 -7221,7 +7221,7 @@@
  			return -EINVAL;
  #endif
  		if (tr->allocated_snapshot)
- 			ret =3D resize_buffer_duplicate_size(&tr->max_buffer,
+ 			ret =3D resize_buffer_duplicate_size(&tr->snapshot_buffer,
  					&tr->array_buffer, iter->cpu_file);
 =20
  		ret =3D tracing_arm_snapshot_locked(tr);
@@@ -8022,9 -7242,9 +7242,9 @@@
  	default:
  		if (tr->allocated_snapshot) {
  			if (iter->cpu_file =3D=3D RING_BUFFER_ALL_CPUS)
- 				tracing_reset_online_cpus(&tr->max_buffer);
+ 				tracing_reset_online_cpus(&tr->snapshot_buffer);
  			else
- 				tracing_reset_cpu(&tr->max_buffer, iter->cpu_file);
+ 				tracing_reset_cpu(&tr->snapshot_buffer, iter->cpu_file);
  		}
  		break;
  	}
@@@ -8074,13 -7294,13 +7294,13 @@@ static int snapshot_raw_open(struct ino
 =20
  	info =3D filp->private_data;
 =20
- 	if (info->iter.trace->use_max_tr) {
+ 	if (tracer_uses_snapshot(info->iter.trace)) {
  		tracing_buffers_release(inode, filp);
  		return -EBUSY;
  	}
 =20
  	info->iter.snapshot =3D true;
- 	info->iter.array_buffer =3D &info->iter.tr->max_buffer;
+ 	info->iter.array_buffer =3D &info->iter.tr->snapshot_buffer;
 =20
  	return ret;
  }
@@@ -8630,10 -7850,8 +7850,8 @@@ tracing_buffers_read(struct file *filp
  	if (!count)
  		return 0;
 =20
- #ifdef CONFIG_TRACER_MAX_TRACE
- 	if (iter->snapshot && iter->tr->current_trace->use_max_tr)
+ 	if (iter->snapshot && tracer_uses_snapshot(iter->tr->current_trace))
  		return -EBUSY;
- #endif
 =20
  	page_size =3D ring_buffer_subbuf_size_get(iter->array_buffer->buffer);
 =20
@@@ -8817,10 -8035,8 +8035,8 @@@ tracing_buffers_splice_read(struct fil
  	int entries, i;
  	ssize_t ret =3D 0;
 =20
- #ifdef CONFIG_TRACER_MAX_TRACE
- 	if (iter->snapshot && iter->tr->current_trace->use_max_tr)
+ 	if (iter->snapshot && tracer_uses_snapshot(iter->tr->current_trace))
  		return -EBUSY;
- #endif
 =20
  	page_size =3D ring_buffer_subbuf_size_get(iter->array_buffer->buffer);
  	if (*ppos & (page_size - 1))
@@@ -8954,7 -8170,7 +8170,7 @@@ static long tracing_buffers_ioctl(struc
  	return 0;
  }
 =20
- #ifdef CONFIG_TRACER_MAX_TRACE
+ #ifdef CONFIG_TRACER_SNAPSHOT
  static int get_snapshot_map(struct trace_array *tr)
  {
  	int err =3D 0;
@@@ -9958,12 -9174,12 +9174,12 @@@ buffer_subbuf_size_write(struct file *f
  	if (ret)
  		goto out;
 =20
- #ifdef CONFIG_TRACER_MAX_TRACE
+ #ifdef CONFIG_TRACER_SNAPSHOT
 =20
  	if (!tr->allocated_snapshot)
  		goto out_max;
 =20
- 	ret =3D ring_buffer_subbuf_order_set(tr->max_buffer.buffer, order);
+ 	ret =3D ring_buffer_subbuf_order_set(tr->snapshot_buffer.buffer, order);
  	if (ret) {
  		/* Put back the old order */
  		cnt =3D ring_buffer_subbuf_order_set(tr->array_buffer.buffer, old_order=
);
@@@ -10179,12 -9395,12 +9395,12 @@@ static int allocate_trace_buffers(struc
  	if (ret)
  		return ret;
 =20
- #ifdef CONFIG_TRACER_MAX_TRACE
+ #ifdef CONFIG_TRACER_SNAPSHOT
  	/* Fix mapped buffer trace arrays do not have snapshot buffers */
  	if (tr->range_addr_start)
  		return 0;
 =20
- 	ret =3D allocate_trace_buffer(tr, &tr->max_buffer,
+ 	ret =3D allocate_trace_buffer(tr, &tr->snapshot_buffer,
  				    allocate_snapshot ? size : 1);
  	if (MEM_FAIL(ret, "Failed to allocate trace buffer\n")) {
  		free_trace_buffer(&tr->array_buffer);
@@@ -10206,8 -9422,8 +9422,8 @@@ static void free_trace_buffers(struct t
  	free_trace_buffer(&tr->array_buffer);
  	kfree(tr->module_delta);
 =20
- #ifdef CONFIG_TRACER_MAX_TRACE
- 	free_trace_buffer(&tr->max_buffer);
+ #ifdef CONFIG_TRACER_SNAPSHOT
+ 	free_trace_buffer(&tr->snapshot_buffer);
  #endif
  }
 =20
@@@ -10348,7 -9564,7 +9564,7 @@@ trace_array_create_systems(const char *
  	tr->syscall_buf_sz =3D global_trace.syscall_buf_sz;
 =20
  	tr->max_lock =3D (arch_spinlock_t)__ARCH_SPIN_LOCK_UNLOCKED;
- #ifdef CONFIG_TRACER_MAX_TRACE
+ #ifdef CONFIG_TRACER_SNAPSHOT
  	spin_lock_init(&tr->snapshot_trigger_lock);
  #endif
  	tr->current_trace =3D &nop_trace;
@@@ -10673,9 -9889,7 +9889,7 @@@ init_tracer_tracefs(struct trace_array=20
 =20
  	create_trace_options_dir(tr);
 =20
- #ifdef CONFIG_TRACER_MAX_TRACE
  	trace_create_maxlat_file(tr, d_tracer);
- #endif
 =20
  	if (ftrace_create_function_files(tr, d_tracer))
  		MEM_FAIL(1, "Could not allocate function filter files");
@@@ -10774,7 -9988,7 +9988,7 @@@ int tracing_init_dentry(void
  extern struct trace_eval_map *__start_ftrace_eval_maps[];
  extern struct trace_eval_map *__stop_ftrace_eval_maps[];
 =20
- static struct workqueue_struct *eval_map_wq __initdata;
+ struct workqueue_struct *trace_init_wq __initdata;
  static struct work_struct eval_map_work __initdata;
  static struct work_struct tracerfs_init_work __initdata;
 =20
@@@ -10790,15 -10004,15 +10004,15 @@@ static int __init trace_eval_init(void
  {
  	INIT_WORK(&eval_map_work, eval_map_work_func);
 =20
- 	eval_map_wq =3D alloc_workqueue("eval_map_wq", WQ_UNBOUND, 0);
- 	if (!eval_map_wq) {
- 		pr_err("Unable to allocate eval_map_wq\n");
+ 	trace_init_wq =3D alloc_workqueue("trace_init_wq", WQ_UNBOUND, 0);
+ 	if (!trace_init_wq) {
+ 		pr_err("Unable to allocate trace_init_wq\n");
  		/* Do work here */
  		eval_map_work_func(&eval_map_work);
  		return -ENOMEM;
  	}
 =20
- 	queue_work(eval_map_wq, &eval_map_work);
+ 	queue_work(trace_init_wq, &eval_map_work);
  	return 0;
  }
 =20
@@@ -10807,8 -10021,8 +10021,8 @@@ subsys_initcall(trace_eval_init)
  static int __init trace_eval_sync(void)
  {
  	/* Make sure the eval map updates are finished */
- 	if (eval_map_wq)
- 		destroy_workqueue(eval_map_wq);
+ 	if (trace_init_wq)
+ 		destroy_workqueue(trace_init_wq);
  	return 0;
  }
 =20
@@@ -10969,9 -10183,9 +10183,9 @@@ static __init int tracer_init_tracefs(v
  	if (ret)
  		return 0;
 =20
- 	if (eval_map_wq) {
+ 	if (trace_init_wq) {
  		INIT_WORK(&tracerfs_init_work, tracer_init_tracefs_work_func);
- 		queue_work(eval_map_wq, &tracerfs_init_work);
+ 		queue_work(trace_init_wq, &tracerfs_init_work);
  	} else {
  		tracer_init_tracefs_work_func(NULL);
  	}
@@@ -11304,7 -10518,7 +10518,7 @@@ ssize_t trace_parse_run_command(struct=
=20
  	return done;
  }
 =20
- #ifdef CONFIG_TRACER_MAX_TRACE
+ #ifdef CONFIG_TRACER_SNAPSHOT
  __init static bool tr_needs_alloc_snapshot(const char *name)
  {
  	char *test;
@@@ -11494,7 -10708,7 +10708,7 @@@ __init static void enable_instances(voi
  			}
  		} else {
  			/* Only non mapped buffers have snapshot buffers */
- 			if (IS_ENABLED(CONFIG_TRACER_MAX_TRACE))
+ 			if (IS_ENABLED(CONFIG_TRACER_SNAPSHOT))
  				do_allocate_snapshot(name);
  		}
 =20
@@@ -11621,7 -10835,7 +10835,7 @@@ __init static int tracer_alloc_buffers(
  	global_trace.current_trace_flags =3D nop_trace.flags;
 =20
  	global_trace.max_lock =3D (arch_spinlock_t)__ARCH_SPIN_LOCK_UNLOCKED;
- #ifdef CONFIG_TRACER_MAX_TRACE
+ #ifdef CONFIG_TRACER_SNAPSHOT
  	spin_lock_init(&global_trace.snapshot_trigger_lock);
  #endif
  	ftrace_init_global_array_ops(&global_trace);
@@@ -11689,7 -10903,7 +10903,7 @@@ struct trace_array *trace_get_global_ar
 =20
  void __init ftrace_boot_snapshot(void)
  {
- #ifdef CONFIG_TRACER_MAX_TRACE
+ #ifdef CONFIG_TRACER_SNAPSHOT
  	struct trace_array *tr;
 =20
  	if (!snapshot_at_boot)

--DuB7de0gZu01xCGL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmKAKYACgkQJNaLcl1U
h9A8lwgAgwJc9pbwaOFzHNqvllROinwgBgE4bHpY9mSbTcJFQ/4/B1ktmIlFeSkX
u2t+zKdwakAd7dH8QAh2G04llZjhDYJc5CQQK56b0xEbzjFsdteI0ARjziIraPS8
uH1fX4W/eG3cqzjLFImSLwaMA8BUBi0jtqv/t1WLsyGJT4FqH1uF7XmR61QgpBvf
ESCmpt+S65OL7SwzeXhY+osRGbguSKv4HAHwgTmV0X9/4iVVgArHEWwr6z1Wxug+
EkhUZonyFl5eAIc9O+JAmx6BE8seIOJiYRIn98kt4ZxFbFLM1wR8rtdTfVbLUMMM
52ovOTrCkPhAfTuc+bhasFXAepH2+g==
=2ISH
-----END PGP SIGNATURE-----

--DuB7de0gZu01xCGL--
