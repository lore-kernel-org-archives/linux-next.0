From: Jiri Olsa <jolsa@redhat.com>
Subject: Re: linux-next: manual merge of the tip tree with the mips tree
Date: Fri, 17 Apr 2015 17:33:43 +0200
Message-ID: <20150417153343.GE17654@krava>
References: <20150413155913.28eace15@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:46885 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S933403AbbDQPdz (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 17 Apr 2015 11:33:55 -0400
Content-Disposition: inline
In-Reply-To: <20150413155913.28eace15@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Ralf Baechle <ralf@linux-mips.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, David Daney <david.daney@cavium.com>, Jiri Olsa <jolsa@kernel.org>, Arnaldo Carvalho de Melo <acme@redhat.com>

On Mon, Apr 13, 2015 at 03:59:13PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the tip tree got a conflict in
> tools/perf/config/Makefile between commit 4fd6ce055817 ("perf tools:
> Hook up MIPS unwind and dwarf-regs in the Makefile") from the mips tree

hi,
I remember reviewing following patchset:
  [PATCH 1/2] perf tools: Add support for MIPS userspace DWARF callchains.
  [PATCH 2/2] perf tools: Hook up MIPS unwind and dwarf-regs in the Makefile

but it did not fit on top of current tip, v2 was needed,
which I haven't seen yet.. but I might have missed that,
in which case sorry for the noise ;-)

jirka
