From: Joe Stringer <joe@wand.net.nz>
Subject: Re: linux-next: build failure after merge of the bpf-next tree
Date: Tue, 2 Oct 2018 22:29:12 -0700
Message-ID: <CAOftzPhjR55RurO-waNe_idrPuCY-SUCj7V0cx=HY482wv57rw@mail.gmail.com>
References: <20181003131848.4f76db59@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181003131848.4f76db59@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: sfr@canb.auug.org.au
Cc: daniel@iogearbox.net, ast@kernel.org, netdev <netdev@vger.kernel.org>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Joe Stringer <joe@wand.net.nz>
List-Id: linux-next.vger.kernel.org

On Tue, 2 Oct 2018 at 20:19, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> After merging the bpf-next tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>
> x86_64-linux-gnu-ld: net/core/filter.o: in function `sk_lookup':
> (.text+0x19219): undefined reference to `__udp6_lib_lookup'
>
> Caused by commit
>
>   6acc9b432e67 ("bpf: Add helper to retrieve socket in BPF")
>
> I assume that __udp6_lib_lookup ended up in the IPv6 module.
>
> I used the bpf-next tree from next-20181002 for today.

My mistake, will send out a fix shortly.

Cheers,
Joe
