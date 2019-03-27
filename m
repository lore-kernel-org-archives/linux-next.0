From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Subject: Re: linux-next: manual merge of the bpf-next tree with the net tree
Date: Tue, 26 Mar 2019 18:56:25 -0700
Message-ID: <20190327015623.ur46t5gdmraagi2q@ast-mbp>
References: <20190327091437.68ec6903@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190327091437.68ec6903@canb.auug.org.au>
Sender: netdev-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Daniel Borkmann <daniel@iogearbox.net>, Alexei Starovoitov <ast@kernel.org>, Networking <netdev@vger.kernel.org>, David Miller <davem@davemloft.net>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Luca Boccassi <bluca@debian.org>
List-Id: linux-next.vger.kernel.org

On Wed, Mar 27, 2019 at 09:14:37AM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the bpf-next tree got a conflict in:
> 
>   tools/lib/bpf/Makefile
> 
> between commit:
> 
>   1d382264d911 ("bpf, libbpf: fix version info and add it to shared object")
> 
> from the net tree and commit:
> 
>   60e4786e229d ("tools/bpf: generate pkg-config file for libbpf")
> 
> from the bpf-next tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

argh. that's a heavy conflict.
Since that patch was at the top of the bpf-next I removed it for now
and will re-apply when bpf-next gets merged cleanly into net-next and
we bring back net changes into bpf-next. Sorry Luca.
