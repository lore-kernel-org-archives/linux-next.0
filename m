From: Dan Williams <dan.j.williams@intel.com>
Subject: Re: linux-next: build failure after merge of the nvdimm tree
Date: Fri, 22 Jul 2016 18:04:49 -0700
Message-ID: <CAPcyv4hyw8v=9Fg3c9ZSPnvPTvQyzgScahddnyq3vJiqq1pzAg@mail.gmail.com>
References: <20160722161320.144b7514@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160722161320.144b7514@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Alasdair G Kergon <agk@redhat.com>, Mike Snitzer <snitzer@redhat.com>, linux-next@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Toshi Kani <toshi.kani@hpe.com>
List-Id: linux-next.vger.kernel.org

On Thu, Jul 21, 2016 at 11:13 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Dan,
>
> After merging the nvdimm tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
>
> In file included from drivers/md/dm.h:14:0,
>                  from drivers/md/dm-uevent.c:27:
> include/linux/device-mapper.h:134:22: error: expected ';', ',' or ')' before '*' token
>           void __pmem **kaddr, pfn_t *pfn, long size);
>                       ^
> include/linux/device-mapper.h:182:2: error: unknown type name 'dm_direct_access_fn'
>   dm_direct_access_fn direct_access;
>   ^
>
> Caused by commit
>
>   7a9eb2066631 ("pmem: kill __pmem address space")
>
> interacting with commit
>
>   545ed20e6df6 ("dm: add infrastructure for DAX support")
>
> from the device-mapper tree.
>
> I applied the following merge fix patch for today.  Someone needs to
> tell Linus about this when he merges the trees.

There's no real rush to remove "__pmem" I'll pull this out until after
DM DAX support has merged.

Thanks Stephen!
