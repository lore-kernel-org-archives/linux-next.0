From: Alexey Dobriyan <adobriyan@gmail.com>
Subject: next-2008-11-27: tracing on alpha (again)
Date: Fri, 28 Nov 2008 12:02:58 +0300
Message-ID: <20081128090258.GA27346@x200.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from nf-out-0910.google.com ([64.233.182.191]:16066 "EHLO
	nf-out-0910.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752618AbYK1I7B (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 28 Nov 2008 03:59:01 -0500
Received: by nf-out-0910.google.com with SMTP id d3so701548nfc.21
        for <linux-next@vger.kernel.org>; Fri, 28 Nov 2008 00:58:58 -0800 (PST)
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au
Cc: linux-next@vger.kernel.org, fweisbec@gmail.com, mingo@elte.hu, edwintorok@gmail.com, linux-kernel@vger.kernel.org

On alpha-smp-n-debug-y:

  CC      kernel/trace/trace.o
kernel/trace/trace.c: In function 'ftrace_trace_userstack':
kernel/trace/trace.c:968: error: storage size of 'trace' isn't known
kernel/trace/trace.c:968: warning: unused variable 'trace'
make[3]: *** [kernel/trace/trace.o] Error 1
  CC      kernel/trace/trace_branch.o
kernel/trace/trace_branch.c: In function 'probe_likely_condition':
kernel/trace/trace_branch.c:44: error: implicit declaration of function 'raw_local_irq_save'
kernel/trace/trace_branch.c:76: error: implicit declaration of function 'raw_local_irq_restore'
