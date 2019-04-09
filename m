From: Dan Williams <dan.j.williams@intel.com>
Subject: Re: linux-next: Fixes tag needs some work in the nvdimm-fixes tree
Date: Tue, 9 Apr 2019 14:59:05 -0700
Message-ID: <CAPcyv4j=jj4b7_Xg90o2y44YnyKP4RcxE4zYR-k=jn1U=a-FtQ@mail.gmail.com>
References: <20190410071555.6a283e81@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190410071555.6a283e81@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Dave Jiang <dave.jiang@intel.com>
List-Id: linux-next.vger.kernel.org

Dang it. should have validated that more people weren't following that
bad example.

Sorry for the noise.

On Tue, Apr 9, 2019 at 2:16 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi Dan,
>
> In commit
>
>   631804370762 ("tools/testing/nvdimm: Retain security state after overwrite")
>
> Fixes tag
>
>   Fixes: 926f74802cb ("tools/testing/nvdimm: Add overwrite support for nfit_test")
>
> has these problem(s):
>
>   - SHA1 should be at least 12 digits long
>     Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
>     or later) just making sure it is not set (or set to "auto").
>
> --
> Cheers,
> Stephen Rothwell
