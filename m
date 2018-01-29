From: Dan Williams <dan.j.williams@intel.com>
Subject: Re: linux-next: manual merge of the nvdimm tree with the powerpc tree
Date: Mon, 29 Jan 2018 14:49:52 -0800
Message-ID: <CAPcyv4g2pfoe8bpVaKDyrVKJZwSN=+J4U=SvKrsa_mLyT_7pfg@mail.gmail.com>
References: <20180129170445.0e3cc514@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180129170445.0e3cc514@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, PowerPC <linuxppc-dev@lists.ozlabs.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Sun, Jan 28, 2018 at 10:04 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Dan,
>
> Today's linux-next merge of the nvdimm tree got a conflict in:
>
>   arch/powerpc/sysdev/axonram.c
>
> between commit:
>
>   1d65b1c886be ("powerpc/cell: Remove axonram driver")
>
> from the powerpc tree and commit:
>
>   785a3fab4adb ("mm, dax: introduce pfn_t_special()")
>
> from the nvdimm tree.
>
> I fixed it up (I just removed the file) and can carry the fix as
> necessary. This is now fixed as far as linux-next is concerned, but any
> non trivial conflicts should be mentioned to your upstream maintainer
> when your tree is submitted for merging.  You may also want to consider
> cooperating with the maintainer of the conflicting tree to minimise any
> particularly complex conflicts.

Thanks Stephen, resolution looks good to me.
