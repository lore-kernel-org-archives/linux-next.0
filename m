From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Subject: Re: linux-next: Tree for Sep 18 (kernel/bpf/syscall)
Date: Tue, 18 Sep 2018 16:22:45 -0400
Message-ID: <CAF=yD-KHzRR1MrDGkQ0d+qC-0_-arVoKBLKze3iwX=HweMYCFw@mail.gmail.com>
References: <20180918151235.4284275f@canb.auug.org.au> <0dc91212-54e8-d2f0-a4e3-30a468c20b8d@infradead.org>
 <a1129d67-97e3-8f10-c938-0de72fee9377@iogearbox.net> <CAF=yD-Kv7ig9UEo8Ci3eZOV=spa9cbGA5Mfa5Too8TgUzVA3fA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAF=yD-Kv7ig9UEo8Ci3eZOV=spa9cbGA5Mfa5Too8TgUzVA3fA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Borkmann <daniel@iogearbox.net>
Cc: rdunlap@infradead.org, Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next Mailing List <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Network Development <netdev@vger.kernel.org>, Alexei Starovoitov <ast@kernel.org>, Petar Penkov <ppenkov@google.com>, Willem de Bruijn <willemb@google.com>
List-Id: linux-next.vger.kernel.org

On Tue, Sep 18, 2018 at 12:28 PM Willem de Bruijn
<willemdebruijn.kernel@gmail.com> wrote:
>
> On Tue, Sep 18, 2018 at 11:44 AM Daniel Borkmann <daniel@iogearbox.net> wrote:
> >
> > [ Cc Petar and Willem ]
> >
> > On 09/18/2018 05:37 PM, Randy Dunlap wrote:
> > > On 9/17/18 10:12 PM, Stephen Rothwell wrote:
> > >> Hi all,
> > >>
> > >> Changes since 20180913:
> > >
> > > on i386 or x86_64: (in 6 of 20 randconfigs)
> > >
> > > kernel/bpf/syscall.o: In function `__x64_sys_bpf':
> > > syscall.c:(.text+0x3278): undefined reference to `skb_flow_dissector_bpf_prog_attach'
> > > syscall.c:(.text+0x3310): undefined reference to `skb_flow_dissector_bpf_prog_detach'
> > > kernel/bpf/syscall.o:(.rodata+0x3f0): undefined reference to `flow_dissector_prog_ops'
> > > kernel/bpf/verifier.o:(.rodata+0x250): undefined reference to `flow_dissector_verifier_ops'
> > >
> > > Full randconfig file is attached.
> >
> > Looks like we need a wrapper for these, config had:
> >
> > # CONFIG_NET is not set
>
> Thanks for forwarding the report.
>
> For the functions, I think we can use a similar static inline stub as
> used e.g., for bpf_map_offload_map_alloc.
>
> The _ops references are from a macro that includes linux/bpf_types.h,
> so indeed a CONFIG looks needed.
>
> I need to look it over before I send out, but tentative patch:

Sent http://patchwork.ozlabs.org/patch/971280/
