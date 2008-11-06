From: Steven Rostedt <rostedt@goodmis.org>
Subject: [PATCH 0/0] ftrace: fix hardirq.h for m68k
Date: Thu, 06 Nov 2008 16:13:07 -0500
Message-ID: <20081106211307.944238362@goodmis.org>
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1753940AbYKFVOb@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Ingo Molnar <mingo@elte.hu>, Alexey Dobriyan <adobriyan@gmail.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Ingo and Stephen,

The problem that Alexey pointed out should be fixed by this trivial patch.

The following patches are in:

  git://git.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-2.6-trace.git

    branch: tip/devel


Steven Rostedt (1):
      ftrace: split out hardirq ftrace code into own header
