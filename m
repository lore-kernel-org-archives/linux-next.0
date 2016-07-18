From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH/RFC] Re: linux-next: build failure after merge of the
 luto-misc tree
Date: Tue, 19 Jul 2016 08:22:35 +1000
Message-ID: <20160719082235.42aec856@canb.auug.org.au>
References: <20160715170654.0b09a8bc@canb.auug.org.au>
	<20160715072243.GP30154@twins.programming.kicks-ass.net>
	<20160715073119.GR30927@twins.programming.kicks-ass.net>
	<20160715150903.GA2523@redhat.com>
	<20160715152436.GB2523@redhat.com>
	<20160715154326.GC2523@redhat.com>
	<20160718151845.4de6e274@canb.auug.org.au>
	<CALCETrWqdi=7hsXTx=WKf-=He-9GP-WNLXppijeZgcoZDCq=bg@mail.gmail.com>
	<20160718203634.GF2207@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160718203634.GF2207@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Andy Lutomirski <luto@amacapital.net>, Arnaldo Carvalho de Melo <acme@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Hi Arnaldo,

On Mon, 18 Jul 2016 17:36:34 -0300 Arnaldo Carvalho de Melo <acme@kernel.org> wrote:
>
> Em Mon, Jul 18, 2016 at 01:04:34PM -0700, Andy Lutomirski escreveu:
> > On Sun, Jul 17, 2016 at 10:18 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:  
> > > On Fri, 15 Jul 2016 12:43:26 -0300 Arnaldo Carvalho de Melo <acme@redhat.com> wrote:  
> 
> > >> Ok, same results, it works, queuing this one, ack? Stephen, does it work
> > >> for you?  
> 
> > > Sorry, no.  See my other email.
> > >
> > > I am cross building (if that makes a difference).  
> 
> For me to try to reproduce the problem, yes, what is the environment?
> Cross-compiling to what target?

I am using a x86_64 compiler (target) on powerpc64le (host).
Yesterday, the x86_64 allmodconfig build failed just after I merged the
tip tree (i.e. without the luto-misc tree being involved).  At that
point I have merged quite a few trees, though.  Also, I do not clean my
object tree between builds.  The compiler is v5.2.0 built from upstream
sources.

-- 
Cheers,
Stephen Rothwell
