From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the sh tree with the  tree
Date: Mon, 16 Aug 2010 13:00:05 +1000
Message-ID: <20100816130005.20c2cbf7.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Mundt <lethal@linux-sh.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>
List-Id: linux-next.vger.kernel.org

Hi Paul,

Today's linux-next merge of the sh tree got a conflict in
arch/sh/include/asm/Kbuild between commit
bf56fba6703592149e1bcd19220c60eb42dff9b7 ("archs: replace unifdef-y with
header-y") from Linus' tree and commit
da28c597996a964a195529595c37f7aacd6dad09 ("sh: split out ptrace header
for _32/_64 variants") from the sh tree.

I fixed it up (see below) and can carry the fix for a while.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc arch/sh/include/asm/Kbuild
index 0eed47b,b4d3462..0000000
--- a/arch/sh/include/asm/Kbuild
+++ b/arch/sh/include/asm/Kbuild
@@@ -3,7 -3,10 +3,9 @@@ include include/asm-generic/Kbuild.as
  header-y += cachectl.h
  header-y += cpu-features.h
  header-y += hw_breakpoint.h
 -
 -unifdef-y += unistd_32.h
 -unifdef-y += unistd_64.h
 -unifdef-y += posix_types_32.h
 -unifdef-y += posix_types_64.h
 -unifdef-y += ptrace_32.h
 -unifdef-y += ptrace_64.h
 +header-y += posix_types_32.h
 +header-y += posix_types_64.h
 +header-y += unistd_32.h
 +header-y += unistd_64.h
++header-y += ptrace_32.h
++header-y += ptrace_64.h
