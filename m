From: Josh Poimboeuf <jpoimboe@redhat.com>
Subject: Re: linux-next: build failure after merge of the tip tree
Date: Tue, 7 Nov 2017 21:01:52 -0600
Message-ID: <20171108030152.bd76eahiwjwjt3kp@treble>
References: <20171108134717.578046db@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20171108134717.578046db@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Wed, Nov 08, 2017 at 01:47:17PM +1100, Stephen Rothwell wrote:
> Presumably caused by commit
> 
>   6a77cff819ae ("objtool: Move synced files to their original relative locations")
> 
> If it matters, this is a cross compilation (PowerPC host) using O= .
> 
> I have used the tip tree from next-20171107 for today.

Hi Stephen,

Does this fix it?

diff --git a/tools/objtool/Makefile b/tools/objtool/Makefile
index 6aaed251b4ed..0f94af3ccaaa 100644
--- a/tools/objtool/Makefile
+++ b/tools/objtool/Makefile
@@ -27,7 +27,7 @@ all: $(OBJTOOL)
 
 INCLUDES := -I$(srctree)/tools/include \
 	    -I$(srctree)/tools/arch/$(HOSTARCH)/include/uapi \
-	    -I$(srctree)/tools/objtool/arch/$(HOSTARCH)/include
+	    -I$(srctree)/tools/objtool/arch/$(ARCH)/include
 WARNINGS := $(EXTRA_WARNINGS) -Wno-switch-default -Wno-switch-enum -Wno-packed
 CFLAGS   += -Wall -Werror $(WARNINGS) -fomit-frame-pointer -O2 -g $(INCLUDES)
 LDFLAGS  += -lelf $(LIBSUBCMD)
