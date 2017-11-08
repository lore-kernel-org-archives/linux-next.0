From: Ingo Molnar <mingo@kernel.org>
Subject: Re: linux-next: build failure after merge of the tip tree
Date: Wed, 8 Nov 2017 10:18:28 +0100
Message-ID: <20171108091827.pl3igqvpy56bvvn7@gmail.com>
References: <20171108134717.578046db@canb.auug.org.au>
 <20171108030152.bd76eahiwjwjt3kp@treble>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wr0-f194.google.com ([209.85.128.194]:44537 "EHLO
        mail-wr0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751106AbdKHJSc (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 8 Nov 2017 04:18:32 -0500
Content-Disposition: inline
In-Reply-To: <20171108030152.bd76eahiwjwjt3kp@treble>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Josh Poimboeuf <jpoimboe@redhat.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>


* Josh Poimboeuf <jpoimboe@redhat.com> wrote:

> On Wed, Nov 08, 2017 at 01:47:17PM +1100, Stephen Rothwell wrote:
> > Presumably caused by commit
> > 
> >   6a77cff819ae ("objtool: Move synced files to their original relative locations")
> > 
> > If it matters, this is a cross compilation (PowerPC host) using O= .
> > 
> > I have used the tip tree from next-20171107 for today.
> 
> Hi Stephen,
> 
> Does this fix it?
> 
> diff --git a/tools/objtool/Makefile b/tools/objtool/Makefile
> index 6aaed251b4ed..0f94af3ccaaa 100644
> --- a/tools/objtool/Makefile
> +++ b/tools/objtool/Makefile
> @@ -27,7 +27,7 @@ all: $(OBJTOOL)
>  
>  INCLUDES := -I$(srctree)/tools/include \
>  	    -I$(srctree)/tools/arch/$(HOSTARCH)/include/uapi \
> -	    -I$(srctree)/tools/objtool/arch/$(HOSTARCH)/include
> +	    -I$(srctree)/tools/objtool/arch/$(ARCH)/include
>  WARNINGS := $(EXTRA_WARNINGS) -Wno-switch-default -Wno-switch-enum -Wno-packed
>  CFLAGS   += -Wall -Werror $(WARNINGS) -fomit-frame-pointer -O2 -g $(INCLUDES)
>  LDFLAGS  += -lelf $(LIBSUBCMD)

Note, I created a commit out of this fix, with your SOB - let me know if you have 
any objections.

Thanks,

	Ingo
