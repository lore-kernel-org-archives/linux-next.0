From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Subject: Re: linux-next: Signed-off-by missing for commits in the bpf-next
 tree
Date: Wed, 12 Dec 2018 12:53:11 -0800
Message-ID: <20181212205253.d3reuxcyjhnwh3ul@ast-mbp.dhcp.thefacebook.com>
References: <20181213073245.5b2d2536@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181213073245.5b2d2536@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Daniel Borkmann <daniel@iogearbox.net>, Alexei Starovoitov <ast@kernel.org>, Networking <netdev@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Thu, Dec 13, 2018 at 07:32:45AM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Commits
> 
>   3bdc28aa2340 ("selftests/bpf: add btf annotations for cgroup_local_storage maps")
>   1dfd1959fed4 ("bpf: add bpffs pretty print for cgroup local storage maps")
>   3adc62d9a5be ("bpf: pass struct btf pointer to the map_check_btf() callback")
>   9cf3a785dc4c ("selftests/bpf: use __bpf_constant_htons in test_prog.c")
> 
> are missing a Signed-off-by from their committers.

the must be a script mistake?

I clearly see SOBs for all of them.
