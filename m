From: Steven Rostedt <rostedt@goodmis.org>
Subject: [PATCH 0/1] ftrace: fix hardirq.h for m68k
Date: Thu, 06 Nov 2008 16:19:49 -0500
Message-ID: <20081106211949.320119144@goodmis.org>
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1753983AbYKFVU5@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Ingo Molnar <mingo@elte.hu>, Alexey Dobriyan <adobriyan@gmail.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org
List-Id: linux-next.vger.kernel.org

[
  Lets try this again. This time in the patch directory.
]


Ingo and Stephen,

The problem that Alexey pointed out should be fixed by this trivial patch.

The following patches are in:

  git://git.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-2.6-trace.git

    branch: tip/devel


Steven Rostedt (1):
      ftrace: split out hardirq ftrace code into own header
