From: Andy Lutomirski <luto@amacapital.net>
Subject: [PATCH] x86, vdso: Fix vdso2c's special_pages error checking
Date: Fri, 18 Jul 2014 10:21:59 -0700
Message-ID: <eb12efa0eda2ffc23e800b5a5a1c84afc09a4a1e.1405703989.git.luto@amacapital.net>
References: <20140718150005.73db8eb9@canb.auug.org.au>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20140718150005.73db8eb9@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, "H. Peter Anvin" <hpa@zytor.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Andy Lutomirski <luto@amacapital.net>
List-Id: linux-next.vger.kernel.org

Stephen Rothwell's compiler did something amazing: it unrolled a
loop, discovered that one iteration of that loop contained an
always-true test, and emitted a warning that will IMO only serve to
convince people to disable the warning.

That bogus warning caused me to wonder what prompted such an
absurdity from his compiler, and I discovered that the code in
question was, in fact, completely wrong -- I was looking things up
in the wrong array.

This affects 3.16 as well, but the only effect is to screw up the
error checking a bit.  vdso2c's output is unaffected.

Signed-off-by: Andy Lutomirski <luto@amacapital.net>
---
 arch/x86/vdso/vdso2c.h | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/arch/x86/vdso/vdso2c.h b/arch/x86/vdso/vdso2c.h
index fd57829..0224987 100644
--- a/arch/x86/vdso/vdso2c.h
+++ b/arch/x86/vdso/vdso2c.h
@@ -109,16 +109,18 @@ static void BITSFUNC(go)(void *raw_addr, size_t raw_len,
 
 	/* Validate mapping addresses. */
 	for (i = 0; i < sizeof(special_pages) / sizeof(special_pages[0]); i++) {
-		if (!syms[i])
+		INT_BITS symval = syms[special_pages[i]];
+
+		if (!symval)
 			continue;  /* The mapping isn't used; ignore it. */
 
-		if (syms[i] % 4096)
+		if (symval % 4096)
 			fail("%s must be a multiple of 4096\n",
 			     required_syms[i].name);
-		if (syms[sym_vvar_start] > syms[i] + 4096)
-			fail("%s underruns begin_vvar\n",
+		if (symval + 4096 < syms[sym_vvar_start])
+			fail("%s underruns vvar_start\n",
 			     required_syms[i].name);
-		if (syms[i] + 4096 > 0)
+		if (symval + 4096 > 0)
 			fail("%s is on the wrong side of the vdso text\n",
 			     required_syms[i].name);
 	}
-- 
1.9.3
