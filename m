From: Steven Rostedt <rostedt@goodmis.org>
Subject: [PATCH 0/1] Update for constraint fix
Date: Tue, 25 Nov 2008 09:20:41 -0500
Message-ID: <20081125142041.038383632@goodmis.org>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from hrndva-omtalb.mail.rr.com ([71.74.56.123]:37232 "EHLO
	hrndva-omtalb.mail.rr.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750917AbYKYOVd (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 25 Nov 2008 09:21:33 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Ingo Molnar <mingo@elte.hu>, Andrew Morton <akpm@linux-foundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>, "H. Peter Anvin" <hpa@zytor.com>, Uros Bizjak <ubizjak@gmail.com>


Ingo and Stephen,

Please use this patch instead. Uros Bizjak suggested using 'q' over 'Q'.

The following patches are in:

  git://git.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-2.6-trace.git

    branch: urgent


Steven Rostedt (1):
      use limited register constraint for setnz

----
 arch/x86/boot/tty.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)
