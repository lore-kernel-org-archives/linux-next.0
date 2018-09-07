From: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@gmail.com>
Subject: Re: linux-next: build failure after merge of the bpf-next tree
Date: Fri, 7 Sep 2018 07:21:05 +0200
Message-ID: <CAJ+HfNgRd5ztzwJ9HtgnrDyf8F0ykODY_EGC91d9KiAfDbhcXA@mail.gmail.com>
References: <20180907101923.4d2a85c6@canb.auug.org.au> <20180907002223.tpizglyhrwn26oox@ast-mbp.dhcp.thefacebook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180907002223.tpizglyhrwn26oox@ast-mbp.dhcp.thefacebook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: sfr@canb.auug.org.au, Daniel Borkmann <daniel@iogearbox.net>, ast@kernel.org, Netdev <netdev@vger.kernel.org>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>
List-Id: linux-next.vger.kernel.org

Den fre 7 sep. 2018 kl 02:23 skrev Alexei Starovoitov
<alexei.starovoitov@gmail.com>:
>
> On Fri, Sep 07, 2018 at 10:19:23AM +1000, Stephen Rothwell wrote:
> > Hi all,
> >
> > After merging the bpf-next tree, today's linux-next build (powerpc
> > ppc64_defconfig) failed like this:
> >
> > ERROR: ".xsk_reuseq_swap" [drivers/net/ethernet/intel/i40e/i40e.ko] und=
efined!
> > ERROR: ".xsk_reuseq_free" [drivers/net/ethernet/intel/i40e/i40e.ko] und=
efined!
> > ERROR: ".xsk_reuseq_prepare" [drivers/net/ethernet/intel/i40e/i40e.ko] =
undefined
> >
> > Caused by commit
> >
> >   9654bd10da60 ("i40e: clean zero-copy XDP Rx ring on shutdown/reset")
> >
> > CONFIG_XDP_SOCKETS is not set for this build.
> >
> > I have used the version of the bfp-next tree from next-20180906 for tod=
ay.
>
> merge conflict and build error...
> Bjorn, I'm thinking to toss the patches out of bpf-next and reapply
> cleaned up version of the patches...
> what do you think?
>

Yes, do that. I'll get back with a cleaned up v2.


Thanks,
Bj=C3=B6rn
