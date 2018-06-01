From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Subject: Re: linux-next: build failure after merge of the net-next tree
Date: Fri, 1 Jun 2018 04:52:45 -0400
Message-ID: <20180601085243.3p33sctlpckcq7vl@ast-mbp>
References: <20180529132548.7f71c2ff@canb.auug.org.au>
 <20180531073855.29c23fce@canb.auug.org.au>
 <20180601135943.66b90890@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180601135943.66b90890@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Jakub Kicinski <jakub.kicinski@netronome.com>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>
List-Id: linux-next.vger.kernel.org

On Fri, Jun 01, 2018 at 01:59:43PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> On Thu, 31 May 2018 07:38:55 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > On Tue, 29 May 2018 13:25:48 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > >
> > > After merging the net-next tree, today's linux-next build (x86_64
> > > allmodconfig) failed like this:
> > > 
> > > x86_64-linux-ld: unknown architecture of input file `net/bpfilter/bpfilter_umh.o' is incompatible with i386:x86-64 output
> > > 
> > > Caused by commit
> > > 
> > >   d2ba09c17a06 ("net: add skeleton of bpfilter kernel module")
> > > 
> > > In my builds, the host is PowerPC 64 LE ...
> > > 
> > > I have reverted that commit along with
> > > 
> > >   61a552eb487f ("bpfilter: fix build dependency")
> > >   13405468f49d ("bpfilter: don't pass O_CREAT when opening console for debug")
> > > 
> > > for today.  
> > 
> > I am still getting this failure (well, at least yesterday I did).
> 
> Still happened today.  My guess is that bpfilter_umh needs to be built
> with the kernel compiler (not the host compiler - since ir is meant to
> run on the some machine as the kernel, right?) but will require the
> kernel architecture libc etc
> 
> 
> I replaced the reverts above with the following:
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Fri, 1 Jun 2018 13:33:28 +1000
> Subject: [PATCH] net: bpfilter: mark as BROKEN for now
> 
> This does not build in a cross compile environment
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  net/bpfilter/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/net/bpfilter/Kconfig b/net/bpfilter/Kconfig
> index a948b072c28f..ea4be72fdf6e 100644
> --- a/net/bpfilter/Kconfig
> +++ b/net/bpfilter/Kconfig
> @@ -2,6 +2,7 @@ menuconfig BPFILTER
>  	bool "BPF based packet filtering framework (BPFILTER)"
>  	default n
>  	depends on NET && BPF && INET
> +	depends on BROKEN

yeah. that's another option.
Sorry for delay. networking folks are traveling to netconf.
The issue is being discussed here:
https://patchwork.ozlabs.org/patch/921597/

Currently we're thinking how to add a check that hostcc's arch
is equal to cross-cc target arch and ideally equal to arch
of the host where it will be run.
