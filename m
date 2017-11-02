From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning in Linus' tree
Date: Fri, 3 Nov 2017 07:29:48 +1100
Message-ID: <20171103072948.5003f4dc@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:39189 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932241AbdKBU3v (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 2 Nov 2017 16:29:51 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org

Hi Linus,

Just building Linus' tree, today's linux-next build (x86_64 allmodconfig)
produced this warning:

warning: objtool: x86 instruction decoder differs from kernel

This is a change since yesterday.  Linus' tree has been updated with
these commits since then:

  4f2ba5dc183b7..ead751507de8

so, I assume this is just due to the SPDX ids being added to files that
objtool cares about.

The perf build also produced lots of Warnings about differences in
include files.

-- 
Cheers,
Stephen Rothwell
