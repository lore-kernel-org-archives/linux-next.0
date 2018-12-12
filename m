From: Bart Van Assche <bvanassche@acm.org>
Subject: Re: linux-next: Signed-off-by missing for commits in the bpf-next
 tree
Date: Wed, 12 Dec 2018 15:45:20 -0800
Message-ID: <1544658320.185366.407.camel@acm.org>
References: <20181213073245.5b2d2536@canb.auug.org.au>
         <20181212205253.d3reuxcyjhnwh3ul@ast-mbp.dhcp.thefacebook.com>
         <20181213094820.62d26354@canb.auug.org.au>
         <20181212233909.hhf5q4vpi3mmi37u@ast-mbp.dhcp.thefacebook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-7"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181212233909.hhf5q4vpi3mmi37u@ast-mbp.dhcp.thefacebook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Daniel Borkmann <daniel@iogearbox.net>, Alexei Starovoitov <ast@kernel.org>, Networking <netdev@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Wed, 2018-12-12 at 15:39 -0800, Alexei Starovoitov wrote:
+AD4 On Thu, Dec 13, 2018 at 09:48:20AM +-1100, Stephen Rothwell wrote:
+AD4 +AD4 Hi Alexei,
+AD4 +AD4 
+AD4 +AD4 On Wed, 12 Dec 2018 12:53:11 -0800 Alexei Starovoitov +ADw-alexei.starovoitov+AEA-gmail.com+AD4 wrote:
+AD4 +AD4 +AD4 
+AD4 +AD4 +AD4 On Thu, Dec 13, 2018 at 07:32:45AM +-1100, Stephen Rothwell wrote:
+AD4 +AD4 +AD4 +AD4 Hi all,
+AD4 +AD4 +AD4 +AD4 
+AD4 +AD4 +AD4 +AD4 Commits
+AD4 +AD4 +AD4 +AD4 
+AD4 +AD4 +AD4 +AD4   3bdc28aa2340 (+ACI-selftests/bpf: add btf annotations for cgroup+AF8-local+AF8-storage maps+ACI)
+AD4 +AD4 +AD4 +AD4   1dfd1959fed4 (+ACI-bpf: add bpffs pretty print for cgroup local storage maps+ACI)
+AD4 +AD4 +AD4 +AD4   3adc62d9a5be (+ACI-bpf: pass struct btf pointer to the map+AF8-check+AF8-btf() callback+ACI)
+AD4 +AD4 +AD4 +AD4   9cf3a785dc4c (+ACI-selftests/bpf: use +AF8AXw-bpf+AF8-constant+AF8-htons in test+AF8-prog.c+ACI)
+AD4 +AD4 +AD4 +AD4 
+AD4 +AD4 +AD4 +AD4 are missing a Signed-off-by from their committers.  
+AD4 +AD4 +AD4 
+AD4 +AD4 +AD4 the must be a script mistake?
+AD4 +AD4 +AD4 
+AD4 +AD4 +AD4 I clearly see SOBs for all of them.
+AD4 +AD4 
+AD4 +AD4 For example:
+AD4 +AD4 
+AD4 +AD4 commit 3bdc28aa2340bf1e5af753287b373522bd1c02a9 (bpf-next/master)
+AD4 +AD4 Author: Roman Gushchin +ADw-guroan+AEA-gmail.com+AD4
+AD4 +AD4 Date:   Mon Dec 10 15:43:02 2018 -0800
+AD4 +AD4 
+AD4 +AD4     selftests/bpf: add btf annotations for cgroup+AF8-local+AF8-storage maps
+AD4 +AD4     
+AD4 +AD4     Add btf annotations to cgroup local storage maps (per-cpu and shared)
+AD4 +AD4     in the network packet counting example.
+AD4 +AD4     
+AD4 +AD4     Signed-off-by: Roman Gushchin +ADw-guro+AEA-fb.com+AD4
+AD4 +AD4     Cc: Alexei Starovoitov +ADw-ast+AEA-kernel.org+AD4
+AD4 +AD4     Cc: Daniel Borkmann +ADw-daniel+AEA-iogearbox.net+AD4
+AD4 +AD4     Acked-by: Martin KaFai Lau +ADw-kafai+AEA-fb.com+AD4
+AD4 +AD4     Signed-off-by: Daniel Borkmann +ADw-daniel+AEA-iogearbox.net+AD4
+AD4 +AD4 
+AD4 +AD4 But it was committed by you, not Daniel.
+AD4 
+AD4 since there were only 4 commits I fixed them up manually.
+AD4 But this approach doesn't scale.
+AD4 We do rebase our trees when we need to fixup or drop patches and
+AD4 at any given point a number of commits will be committed by me
+AD4 and another set by Daniel. When we rebase we cannot keep adding
+AD4 our SOBs to the other person SOBs.
+AD4 Then comes the next rebase and we get to the point of
+AD4 double and triple SOBs ?
+AD4 
+AD4 I think you need to adjust the script to something like:
+AD4 SOBs by Daniel +AHw Alexei +AD0APQ commit by Daniel +AHw Alexei
+AD4 in bpf and bpf-next trees.

Are you aware of Linus' opinion about rebasing? If not, please have a look
at https://lkml.org/lkml/2016/3/26/71 or https://lwn.net/Articles/328436/.

Thanks,

Bart.
