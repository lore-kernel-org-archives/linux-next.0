From: Josh Poimboeuf <jpoimboe@redhat.com>
Subject: [PATCH] tools: Support relative directory path for 'O='
Date: Thu,  3 Mar 2016 08:53:43 -0600
Message-ID: <94a078c6c998fac9f01a14f574008bf7dff40191.1457016803.git.jpoimboe@redhat.com>
References: <20160303143527.GA2348@treble.redhat.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160303143527.GA2348@treble.redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ingo Molnar <mingo@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, linux@roeck-us.net, Andrew Morton <akpm@linux-foundation.org>, live-patching@vger.kernel.org, Jiri Olsa <jolsa@kernel.org>
List-Id: linux-next.vger.kernel.org

Running "make O=foo" (with a relative directory path) fails with:

  scripts/Makefile.include:3: *** O=foo does not exist.  Stop.
  /home/jpoimboe/git/linux/Makefile:1547: recipe for target 'tools/objtool' failed

The tools Makefile gets confused by the relative path and tries to build
objtool in tools/foo.  Convert the output directory to an absolute path
before passing it to the tools Makefile.

Reported-by: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Signed-off-by: Josh Poimboeuf <jpoimboe@redhat.com>
---
 Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 3100e74..5b3723c 100644
--- a/Makefile
+++ b/Makefile
@@ -1541,11 +1541,11 @@ image_name:
 # Clear a bunch of variables before executing the submake
 tools/: FORCE
 	$(Q)mkdir -p $(objtree)/tools
-	$(Q)$(MAKE) LDFLAGS= MAKEFLAGS="$(filter --j% -j,$(MAKEFLAGS))" O=$(O) subdir=tools -C $(src)/tools/
+	$(Q)$(MAKE) LDFLAGS= MAKEFLAGS="$(filter --j% -j,$(MAKEFLAGS))" O=$(shell cd $(objtree) && /bin/pwd) subdir=tools -C $(src)/tools/
 
 tools/%: FORCE
 	$(Q)mkdir -p $(objtree)/tools
-	$(Q)$(MAKE) LDFLAGS= MAKEFLAGS="$(filter --j% -j,$(MAKEFLAGS))" O=$(O) subdir=tools -C $(src)/tools/ $*
+	$(Q)$(MAKE) LDFLAGS= MAKEFLAGS="$(filter --j% -j,$(MAKEFLAGS))" O=$(shell cd $(objtree) && /bin/pwd) subdir=tools -C $(src)/tools/ $*
 
 # Single targets
 # ---------------------------------------------------------------------------
-- 
2.4.3
