From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the ftrace tree
Date: Mon, 24 Nov 2008 11:11:12 +1100
Message-ID: <20081124111112.fa876dce.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:37865 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751496AbYKXAL2 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 23 Nov 2008 19:11:28 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-next@vger.kernel.org, Steven Rostedt <srostedt@redhat.com>

Hi all,

Today's linux-next merge of the ftrace tree got a conflict in
kernel/trace/ftrace.c between commits
820432783190b4096499e38a4a4d7095c511913d ("ftrace: make filtered
functions effective on setting") and
32464779a1b8c15e9aa9aa0306b2f735080df9d8 ("ftrace: fix dyn ftrace filter
selection") from Linus' tree and commit ftrace_startup ("ftrace: add
quick function trace stop") from the ftrace tree.

I fixed it up (see below - which may not be correct) but it needs to be
fixed in the ftrace tree.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc kernel/trace/ftrace.c
index 78db083,beb21a5..0000000
--- a/kernel/trace/ftrace.c
+++ b/kernel/trace/ftrace.c
@@@ -526,8 -560,9 +553,8 @@@ static void ftrace_startup(void
  		return;
  
  	mutex_lock(&ftrace_start_lock);
- 	ftrace_start++;
+ 	ftrace_start_up++;
 -	if (ftrace_start_up == 1)
 -		command |= FTRACE_ENABLE_CALLS;
 +	command |= FTRACE_ENABLE_CALLS;
  
  	if (saved_ftrace_func != ftrace_trace_function) {
  		saved_ftrace_func = ftrace_trace_function;
@@@ -1181,7 -1212,7 +1208,7 @@@ ftrace_regex_release(struct inode *inod
  
  	mutex_lock(&ftrace_sysctl_lock);
  	mutex_lock(&ftrace_start_lock);
- 	if (ftrace_start && ftrace_enabled)
 -	if (iter->filtered && ftrace_start_up && ftrace_enabled)
++	if (ftrace_start_up && ftrace_enabled)
  		ftrace_run_update_code(FTRACE_ENABLE_CALLS);
  	mutex_unlock(&ftrace_start_lock);
  	mutex_unlock(&ftrace_sysctl_lock);
