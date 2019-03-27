From: Luca Boccassi <bluca@debian.org>
Subject: Re: linux-next: manual merge of the bpf-next tree with the net tree
Date: Wed, 27 Mar 2019 09:26:02 +0000
Message-ID: <df699947253913a7e572fd1252b99e594431e261.camel@debian.org>
References: <20190327091437.68ec6903@canb.auug.org.au>
         <20190327015623.ur46t5gdmraagi2q@ast-mbp>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190327015623.ur46t5gdmraagi2q@ast-mbp>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Daniel Borkmann <daniel@iogearbox.net>, Alexei Starovoitov <ast@kernel.org>, Networking <netdev@vger.kernel.org>, David Miller <davem@davemloft.net>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Tue, 2019-03-26 at 18:56 -0700, Alexei Starovoitov wrote:
> On Wed, Mar 27, 2019 at 09:14:37AM +1100, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Today's linux-next merge of the bpf-next tree got a conflict in:
> > 
> >   tools/lib/bpf/Makefile
> > 
> > between commit:
> > 
> >   1d382264d911 ("bpf, libbpf: fix version info and add it to shared
> > object")
> > 
> > from the net tree and commit:
> > 
> >   60e4786e229d ("tools/bpf: generate pkg-config file for libbpf")
> > 
> > from the bpf-next tree.
> > 
> > I fixed it up (see below) and can carry the fix as necessary. This
> > is now fixed as far as linux-next is concerned, but any non trivial
> > conflicts should be mentioned to your upstream maintainer when your
> > tree
> > is submitted for merging.  You may also want to consider
> > cooperating
> > with the maintainer of the conflicting tree to minimise any
> > particularly
> > complex conflicts.
> 
> argh. that's a heavy conflict.
> Since that patch was at the top of the bpf-next I removed it for now
> and will re-apply when bpf-next gets merged cleanly into net-next and
> we bring back net changes into bpf-next. Sorry Luca.

No worries - for the next time, should I have based the patch on net-
next rather than bpf-next?

-- 
Kind regards,
Luca Boccassi
