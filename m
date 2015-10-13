From: Arnaldo Carvalho de Melo <acme@kernel.org>
Subject: Re: [PATCH] tools include: Fix =?utf-8?Q?s?=
 =?utf-8?Q?trict-aliasing_rules_breakage_=22tools=2Finclude=2Flinux=2Fcomp?=
 =?utf-8?Q?iler=2Eh=3A66=3A_error=3A_dereferencing_pointer_=E2=80=98res=2E?=
 =?utf-8?B?NDHigJk=?= does break strict-aliasing rules"
Date: Tue, 13 Oct 2015 11:44:10 -0300
Message-ID: <20151013144410.GR14409@kernel.org>
References: <CAHTgTXXzH7id6qrpG1qvR8BsKPjny4+kjcvnA1zS6OaMx-+TtA@mail.gmail.com>
 <20151008091221.GC17581@krava.landal.opennet>
 <CAHTgTXVQRdsXjsHfjY8hMXXLMWyZDMEuJKAd+eVhfEN5jUBY5Q@mail.gmail.com>
 <20151013085214.GB2705@krava.brq.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:39056 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752422AbbJMOoP (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 13 Oct 2015 10:44:15 -0400
Content-Disposition: inline
In-Reply-To: <20151013085214.GB2705@krava.brq.redhat.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jiri Olsa <jolsa@redhat.com>
Cc: Vinson Lee <vlee@twopensource.com>, linux-next@vger.kernel.org, Peter Zijlstra <a.p.zijlstra@chello.nl>, Ingo Molnar <mingo@redhat.com>, Andi Kleen <ak@linux.intel.com>, Adrian Hunter <adrian.hunter@intel.com>, Jiri Olsa <jolsa@kernel.org>, Rabin Vincent <rabin@rab.in>, Martin =?utf-8?B?TGnFoWth?= <mliska@suse.cz>

Em Tue, Oct 13, 2015 at 10:52:14AM +0200, Jiri Olsa escreveu:
> On Mon, Oct 12, 2015 at 05:48:17PM -0700, Vinson Lee wrote:
> 
> SNIP
> 
> > >                 __builtin_memcpy((void *)res, (const void *)p, size);
> > > @@ -59,11 +64,14 @@ static __always_inline void __read_once_size(const volatile void *p, void *res,
> > >
> > >  static __always_inline void __write_once_size(volatile void *p, void *res, int size)
> > >  {
> > > +       u64_alias_t *u64_p = (u64_alias_t*) p;
> > > +       u64_alias_t *u64_res = (u64_alias_t*) res;
> > > +
> > >         switch (size) {
> > >         case 1: *(volatile __u8 *)p = *(__u8 *)res; break;
> > >         case 2: *(volatile __u16 *)p = *(__u16 *)res; break;
> > >         case 4: *(volatile __u32 *)p = *(__u32 *)res; break;
> > > -       case 8: *(volatile __u64 *)p = *(__u64 *)res; break;
> > > +       case 8: *u64_p = *u64_res; break;
> > >         default:
> > >                 barrier();
> > >                 __builtin_memcpy((void *)p, (const void *)res, size);
> > 
> > 
> > This patch fixes my perf build error with GCC 4.4.
> > 
> > Vinson
> 
> posting complete patch

Applied, with a tested-by Vinson,

thanks,

- Arnaldo
