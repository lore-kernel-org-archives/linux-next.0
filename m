From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Subject: Re: linux-next: Signed-off-by missing for commits in the bpf-next
 tree
Date: Wed, 12 Dec 2018 15:39:10 -0800
Message-ID: <20181212233909.hhf5q4vpi3mmi37u@ast-mbp.dhcp.thefacebook.com>
References: <20181213073245.5b2d2536@canb.auug.org.au>
 <20181212205253.d3reuxcyjhnwh3ul@ast-mbp.dhcp.thefacebook.com>
 <20181213094820.62d26354@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181213094820.62d26354@canb.auug.org.au>
Sender: netdev-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Daniel Borkmann <daniel@iogearbox.net>, Alexei Starovoitov <ast@kernel.org>, Networking <netdev@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Thu, Dec 13, 2018 at 09:48:20AM +1100, Stephen Rothwell wrote:
> Hi Alexei,
> 
> On Wed, 12 Dec 2018 12:53:11 -0800 Alexei Starovoitov <alexei.starovoitov@gmail.com> wrote:
> >
> > On Thu, Dec 13, 2018 at 07:32:45AM +1100, Stephen Rothwell wrote:
> > > Hi all,
> > > 
> > > Commits
> > > 
> > >   3bdc28aa2340 ("selftests/bpf: add btf annotations for cgroup_local_storage maps")
> > >   1dfd1959fed4 ("bpf: add bpffs pretty print for cgroup local storage maps")
> > >   3adc62d9a5be ("bpf: pass struct btf pointer to the map_check_btf() callback")
> > >   9cf3a785dc4c ("selftests/bpf: use __bpf_constant_htons in test_prog.c")
> > > 
> > > are missing a Signed-off-by from their committers.  
> > 
> > the must be a script mistake?
> > 
> > I clearly see SOBs for all of them.
> 
> For example:
> 
> commit 3bdc28aa2340bf1e5af753287b373522bd1c02a9 (bpf-next/master)
> Author: Roman Gushchin <guroan@gmail.com>
> Date:   Mon Dec 10 15:43:02 2018 -0800
> 
>     selftests/bpf: add btf annotations for cgroup_local_storage maps
>     
>     Add btf annotations to cgroup local storage maps (per-cpu and shared)
>     in the network packet counting example.
>     
>     Signed-off-by: Roman Gushchin <guro@fb.com>
>     Cc: Alexei Starovoitov <ast@kernel.org>
>     Cc: Daniel Borkmann <daniel@iogearbox.net>
>     Acked-by: Martin KaFai Lau <kafai@fb.com>
>     Signed-off-by: Daniel Borkmann <daniel@iogearbox.net>
> 
> But it was committed by you, not Daniel.

since there were only 4 commits I fixed them up manually.
But this approach doesn't scale.
We do rebase our trees when we need to fixup or drop patches and
at any given point a number of commits will be committed by me
and another set by Daniel. When we rebase we cannot keep adding
our SOBs to the other person SOBs.
Then comes the next rebase and we get to the point of
double and triple SOBs ?

I think you need to adjust the script to something like:
SOBs by Daniel | Alexei == commit by Daniel | Alexei
in bpf and bpf-next trees.
