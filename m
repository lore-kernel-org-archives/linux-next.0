From: Masami Hiramatsu <mhiramat@redhat.com>
Subject: [PATCH -next 0/3] x86 insn decoder test updates (Re: linux-next: Tree 	for October 29 (x86 posttest))
Date: Mon, 16 Nov 2009 18:06:11 -0500
Message-ID: <20091116230611.5250.86656.stgit@harusame>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <systemtap-return-14301-gls-systemtap=m.gmane.org@sourceware.org>
List-Unsubscribe: <mailto:systemtap-unsubscribe-gls-systemtap=m.gmane.org@sourceware.org>
List-Subscribe: <mailto:systemtap-subscribe@sourceware.org>
List-Post: <mailto:systemtap@sourceware.org>
List-Help: <mailto:systemtap-help@sourceware.org>, <http://sourceware.org/lists.html#faqs>
Sender: systemtap-owner@sourceware.org
To: linux-next@vger.kernel.org
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Randy Dunlap <rdunlap@xenotime.net>, Jim Keniston <jkenisto@us.ibm.com>, "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@elte.hu>, lkml <linux-kernel@vger.kernel.org>, systemtap <systemtap@sources.redhat.com>, DLE <dle-develop@lists.sourceforge.net>
List-Id: linux-next.vger.kernel.org

Here are the patches which update x86 instruction decoder build-time test.
As Stephen reported on linux-next, sometimes objdump decodes bad
instructions as normal. This will cause a false positive result on
x86 insn decoder test. This patches update the test as below;
 - Show more information with V=1
 - Show in which symbol the difference places.
 - Just warning instead of build failure.

Thank you,

---

Masami Hiramatsu (3):
      x86: insn decoder test shows build warning
      x86: Show symbol name if insn decoder test failed
      x86: Add verbose option to insn decoder test


 arch/x86/tools/Makefile       |    9 +++-
 arch/x86/tools/distill.awk    |    5 ++
 arch/x86/tools/test_get_len.c |   99 ++++++++++++++++++++++++++++++++++-------
 3 files changed, 95 insertions(+), 18 deletions(-)

-- 
Masami Hiramatsu

Software Engineer
Hitachi Computer Products (America), Inc.
Software Solutions Division
e-mail: mhiramat@redhat.com
