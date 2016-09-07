From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the ftrace tree with the tip tree
Date: Wed, 7 Sep 2016 15:25:17 +1000
Message-ID: <20160907152517.5a67a991@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Steven Rostedt <rostedt@goodmis.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Namhyung Kim <namhyung@kernel.org>, Josh Poimboeuf <jpoimboe@redhat.com>
List-Id: linux-next.vger.kernel.org

Hi Steven,

Today's linux-next merge of the ftrace tree got conflicts in:

  include/linux/ftrace.h
  kernel/trace/trace_functions_graph.c

between commit:

  daa460a88c09 ("ftrace: Only allocate the ret_stack 'fp' field when needed")

from the tip tree and commit:

  8861dd303cba ("ftrace: Access ret_stack->subtime only in the function profiler")

from the ftrace tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc include/linux/ftrace.h
index 6f93ac46e7f0,1e2b316d6693..000000000000
--- a/include/linux/ftrace.h
+++ b/include/linux/ftrace.h
@@@ -794,13 -794,10 +794,15 @@@ struct ftrace_ret_stack 
  	unsigned long ret;
  	unsigned long func;
  	unsigned long long calltime;
+ #ifdef CONFIG_FUNCTION_PROFILER
  	unsigned long long subtime;
+ #endif
 +#ifdef HAVE_FUNCTION_GRAPH_FP_TEST
  	unsigned long fp;
 +#endif
 +#ifdef HAVE_FUNCTION_GRAPH_RET_ADDR_PTR
 +	unsigned long *retp;
 +#endif
  };
  
  /*
diff --cc kernel/trace/trace_functions_graph.c
index 0cbe38a844fa,148c90f1e49b..000000000000
--- a/kernel/trace/trace_functions_graph.c
+++ b/kernel/trace/trace_functions_graph.c
@@@ -170,13 -170,7 +170,12 @@@ ftrace_push_return_trace(unsigned long 
  	current->ret_stack[index].ret = ret;
  	current->ret_stack[index].func = func;
  	current->ret_stack[index].calltime = calltime;
- 	current->ret_stack[index].subtime = 0;
 +#ifdef HAVE_FUNCTION_GRAPH_FP_TEST
  	current->ret_stack[index].fp = frame_pointer;
 +#endif
 +#ifdef HAVE_FUNCTION_GRAPH_RET_ADDR_PTR
 +	current->ret_stack[index].retp = retp;
 +#endif
  	*depth = current->curr_ret_stack;
  
  	return 0;
