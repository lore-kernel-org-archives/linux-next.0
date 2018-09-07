From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Subject: Re: linux-next: build failure after merge of the bpf-next tree
Date: Thu, 6 Sep 2018 22:45:20 -0700
Message-ID: <20180907054518.jnnckempmerazwwh@ast-mbp.dhcp.thefacebook.com>
References: <20180907101923.4d2a85c6@canb.auug.org.au>
 <20180907002223.tpizglyhrwn26oox@ast-mbp.dhcp.thefacebook.com>
 <CAJ+HfNgRd5ztzwJ9HtgnrDyf8F0ykODY_EGC91d9KiAfDbhcXA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAJ+HfNgRd5ztzwJ9HtgnrDyf8F0ykODY_EGC91d9KiAfDbhcXA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@gmail.com>
Cc: sfr@canb.auug.org.au, Daniel Borkmann <daniel@iogearbox.net>, ast@kernel.org, Netdev <netdev@vger.kernel.org>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>
List-Id: linux-next.vger.kernel.org

On Fri, Sep 07, 2018 at 07:21:05AM +0200, Björn Töpel wrote:
> Den fre 7 sep. 2018 kl 02:23 skrev Alexei Starovoitov
> <alexei.starovoitov@gmail.com>:
> >
> > On Fri, Sep 07, 2018 at 10:19:23AM +1000, Stephen Rothwell wrote:
> > > Hi all,
> > >
> > > After merging the bpf-next tree, today's linux-next build (powerpc
> > > ppc64_defconfig) failed like this:
> > >
> > > ERROR: ".xsk_reuseq_swap" [drivers/net/ethernet/intel/i40e/i40e.ko] undefined!
> > > ERROR: ".xsk_reuseq_free" [drivers/net/ethernet/intel/i40e/i40e.ko] undefined!
> > > ERROR: ".xsk_reuseq_prepare" [drivers/net/ethernet/intel/i40e/i40e.ko] undefined
> > >
> > > Caused by commit
> > >
> > >   9654bd10da60 ("i40e: clean zero-copy XDP Rx ring on shutdown/reset")
> > >
> > > CONFIG_XDP_SOCKETS is not set for this build.
> > >
> > > I have used the version of the bfp-next tree from next-20180906 for today.
> >
> > merge conflict and build error...
> > Bjorn, I'm thinking to toss the patches out of bpf-next and reapply
> > cleaned up version of the patches...
> > what do you think?
> >
> 
> Yes, do that. I'll get back with a cleaned up v2.

Done.

Unfortunately during interactive rebase that removed your commits git didn't
preserve merge commits that came after yours,
so Jesper's and Yonghong's cover letters are not in the git history.
Yet all patches are in the same order.
Explicit revert with trail in the git history would have been worse.
patchworks + git isn't the most convenient workflow. sigh.
