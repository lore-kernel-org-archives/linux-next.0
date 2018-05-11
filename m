From: Josh Poimboeuf <jpoimboe@redhat.com>
Subject: Re: mmotm 2018-05-10-16-34 uploaded (objtool)
Date: Fri, 11 May 2018 10:45:19 -0500
Message-ID: <20180511154519.w6bbhptv67fvsgnr@treble>
References: <20180510233519.eYStA%akpm@linux-foundation.org>
 <aa27dcd5-8121-3da9-a6d8-2108a849986e@infradead.org>
 <20180511010122.xvkjqgx7yye77le3@treble>
 <b4c08470-b035-c735-9a1a-3dbf1f2804e2@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <b4c08470-b035-c735-9a1a-3dbf1f2804e2@infradead.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Randy Dunlap <rdunlap@infradead.org>
Cc: akpm@linux-foundation.org, broonie@kernel.org, mhocko@suse.cz, sfr@canb.auug.org.au, linux-next@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, mm-commits@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>
List-Id: linux-next.vger.kernel.org

On Thu, May 10, 2018 at 06:06:38PM -0700, Randy Dunlap wrote:
> >> Hi Josh, Peter:
> >>
> >> Is this something that you already have fixes for?
> >>
> >>
> >> on x86_64:
> >>
> >> drivers/video/fbdev/omap2/omapfb/dss/dispc.o: warning: objtool: dispc_runtime_suspend()+0xbb8: sibling call from callable instruction with modified stack frame
> >> drivers/video/fbdev/omap2/omapfb/dss/dispc.o: warning: objtool: dispc_runtime_resume()+0xcc5: sibling call from callable instruction with modified stack frame
> > 
> > I don't recall seeing that one.  Can you share the .config and/or .o
> > file?
> > 
> 
> Sure.  Both are attached.

Here's a fix (applies on top of the GCC 8 patches I posted this week):

diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index 9bb04fddd3c8..a358489a1560 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -961,11 +961,15 @@ static struct rela *find_switch_table(struct objtool_file *file,
 		if (find_symbol_containing(file->rodata, text_rela->addend))
 			continue;
 
+		/* mov [rodata addr], %reg */
 		rodata_rela = find_rela_by_dest(file->rodata, text_rela->addend);
-		if (!rodata_rela)
-			continue;
+		if (rodata_rela)
+			return rodata_rela;
 
-		return rodata_rela;
+		/* mov [rodata_addr](%rip), %reg */
+		rodata_rela = find_rela_by_dest(file->rodata, text_rela->addend + 4);
+		if (rodata_rela)
+			return rodata_rela;
 	}
 
 	return NULL;
