From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the tip tree
Date: Thu, 9 Nov 2017 14:03:52 +1100
Message-ID: <20171109140352.26e07c5e@canb.auug.org.au>
References: <20171108134717.578046db@canb.auug.org.au>
        <20171108030152.bd76eahiwjwjt3kp@treble>
        <20171108091827.pl3igqvpy56bvvn7@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171108091827.pl3igqvpy56bvvn7@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ingo Molnar <mingo@kernel.org>
Cc: Josh Poimboeuf <jpoimboe@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Hi Ingo,

On Wed, 8 Nov 2017 10:18:28 +0100 Ingo Molnar <mingo@kernel.org> wrote:
>
> * Josh Poimboeuf <jpoimboe@redhat.com> wrote:
> 
> > On Wed, Nov 08, 2017 at 01:47:17PM +1100, Stephen Rothwell wrote:  
> > 
> > Does this fix it?
> > 
> > diff --git a/tools/objtool/Makefile b/tools/objtool/Makefile
> > index 6aaed251b4ed..0f94af3ccaaa 100644
> > --- a/tools/objtool/Makefile
> > +++ b/tools/objtool/Makefile
> > @@ -27,7 +27,7 @@ all: $(OBJTOOL)
> >  
> >  INCLUDES := -I$(srctree)/tools/include \
> >  	    -I$(srctree)/tools/arch/$(HOSTARCH)/include/uapi \
> > -	    -I$(srctree)/tools/objtool/arch/$(HOSTARCH)/include
> > +	    -I$(srctree)/tools/objtool/arch/$(ARCH)/include
> >  WARNINGS := $(EXTRA_WARNINGS) -Wno-switch-default -Wno-switch-enum -Wno-packed
> >  CFLAGS   += -Wall -Werror $(WARNINGS) -fomit-frame-pointer -O2 -g $(INCLUDES)
> >  LDFLAGS  += -lelf $(LIBSUBCMD)  
> 
> Note, I created a commit out of this fix, with your SOB - let me know if you have 
> any objections.

I applied this patch to linux-next today after the tip tree merge.
-- 
Cheers,
Stephen Rothwell
