From: Oliver <oohall@gmail.com>
Subject: Re: linux-next: build failure after merge of the nvdimm tree
Date: Mon, 9 Apr 2018 13:38:11 +1000
Message-ID: <CAOSf1CHToZ5+k90n_sgh_9ezJjXpx21E5-K66TWkdU7t7kUiEw@mail.gmail.com>
References: <20180409131619.0bc5fb45@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180409131619.0bc5fb45@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Dan Williams <dan.j.williams@intel.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Mon, Apr 9, 2018 at 1:16 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Dan,
>
> After merging the nvdimm tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>
> ERROR: "of_node_to_nid" [drivers/nvdimm/of_pmem.ko] undefined!
>
> Caused by commit
>
>   717197608952 ("libnvdimm: Add device-tree based driver")
>
> X86 seems to not have a version of of_node_to_nid() even though CONFIG_OF
> and CONFIG_NUMA are both 'y' in this build.

It's a side effect of a driver selecting CONFIG_OF accidently. There's
a patch to fix this in the drm-misc-next tree:

https://lkml.org/lkml/2018/4/3/17

> I have used the nvdimm tree from next-20180406 for today.

That works too.

Oliver
