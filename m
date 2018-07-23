From: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: linux-next: Tree for Jul 23
Date: Tue, 24 Jul 2018 00:35:22 +1000
Message-ID: <877elmhvf9.fsf@concordia.ellerman.id.au>
References: <20180723200032.221a8f18@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180723200032.221a8f18@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Stephen Rothwell <sfr@canb.auug.org.au> writes:

> Hi all,
>
> Changes since 20180720:
>
> Dropped trees: xarray, ida (complex conflicts)
>
> The drm-msm tree gained a conflict against the drm tree and a build
> failure due to an interaction with the drm tree for which I added a
> merge fix patch.
>
> The kvm-arm tree gained a conflict against the arm64 tree.
>
> The driver-core tree gained a conflict against the net-next tree.
>
> The xarray tree gained complex conflicts against the nvdimm tree so I have
> dropped it for today (along with the ida tree that is built on top of it).
>
> The akpm-current tree gained a conflict against Linus' tree and also a
> build failure for which I reverted a commit.
>
> Non-merge commits (relative to Linus' tree): 7606
>  7110 files changed, 316203 insertions(+), 143278 deletions(-)

Hi Stephen,

Would you mind adding my "topic/hvc" branch to linux-next.

We (ppc) are notionally the maintainers for that code but it's used by
some other folks, so I'd like it to get some wider testing before I
commit it.

You should get:

  9f65b81f36e3 ("tty: hvc: introduce the hv_ops.flush operation for hvc drivers")

cheers
