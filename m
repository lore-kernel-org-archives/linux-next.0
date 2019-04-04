From: Josh Poimboeuf <jpoimboe@redhat.com>
Subject: Re: linux-next: Tree for Apr 3 (objtool)
Date: Thu, 4 Apr 2019 12:16:18 -0500
Message-ID: <20190404171618.6u36y5zu3euvd4zp@treble>
References: <20190403192407.13a99513@canb.auug.org.au>
 <d37e0909-cacc-7c6c-4376-33891fa69f53@infradead.org>
 <20190403205305.tqqwttjytunzgtub@treble>
 <6a2455b9-5c02-99dc-e41c-e6b7d1c3118d@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <6a2455b9-5c02-99dc-e41c-e6b7d1c3118d@infradead.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>
List-Id: linux-next.vger.kernel.org

On Wed, Apr 03, 2019 at 03:29:17PM -0700, Randy Dunlap wrote:
> On 4/3/19 1:53 PM, Josh Poimboeuf wrote:
> > On Wed, Apr 03, 2019 at 08:02:43AM -0700, Randy Dunlap wrote:
> >> On 4/3/19 1:24 AM, Stephen Rothwell wrote:
> >>> Hi all,
> >>>
> >>> Changes since 20190402:
> >>>
> >>
> >> on x86_64:
> >>
> >> arch/x86/entry/entry_64.o: warning: objtool: .entry.text+0x909: unreachable instruction
> > 
> > Your .o file looks odd.  I can't recreate the issue when I build the
> > same object.
> 
> This (randconfig) build has tracing enabled?  Could that have anything to do
> with it?

No, I can't see any reasonable explanation for it other than a buggy
toolchain.

> The randconfig file is attached.

I still can't recreate with your randconfig.

> > Did the issue only just now show up?  Can you bisect it?  What version
> > of binutils are you using?
> 
> > ld -v
> GNU ld (GNU Binutils; openSUSE Leap 42.3) 2.31.1.20180828-19
> 
> 
> My build logs show it first occurred (in my randconfig builds) in
> linux-next-20190204.

It seems really odd.  Can you do a bisect?

-- 
Josh
