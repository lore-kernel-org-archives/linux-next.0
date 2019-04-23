From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: linux-next: Fixes tag needs some work in the rockchip tree
Date: Tue, 23 Apr 2019 23:32:26 +0200
Message-ID: <1748269.eM8PPa3JB8@phil>
References: <20190424072539.51aa27e2@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190424072539.51aa27e2@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Katsuhiro Suzuki <katsuhiro@katsuster.net>
List-Id: linux-next.vger.kernel.org

Am Dienstag, 23. April 2019, 23:25:39 CEST schrieb Stephen Rothwell:
> Hi Heiko,
> 
> In commit
> 
>   89c1f66ae88a ("arm64: dts: rockchip: fix IO domain voltage setting of APIO5 on rockpro64")
> 
> Fixes tag
> 
>   Fixes: e4f3fb4909 ("arm64: dts: rockchip: add initial dts support for Rockpro64")
> 
> has these problem(s):
> 
>   - SHA1 should be at least 12 digits long
>     Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
>     or later) just making sure it is not set (or set to "auto").

Thanks for that catch. I've amended the commit to have a correct
fixes commit-id.


Thanks
Heiko
