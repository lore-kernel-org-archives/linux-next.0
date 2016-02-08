From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Subject: Re: linux-next: Tree for Feb 8
Date: Mon, 8 Feb 2016 17:26:11 +0530
Message-ID: <20160208115611.GA10929@sudip-pc>
References: <20160208161756.6809f31a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160208161756.6809f31a@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Steven Miao <realmz6@gmail.com>, Chris Metcalf <cmetcalf@ezchip.com>, adi-buildroot-devel@lists.sourceforge.net
List-Id: linux-next.vger.kernel.org

On Mon, Feb 08, 2016 at 04:17:56PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20160205:

My blackfin defconfig build fails with:

kallsyms failure: relative symbol value 0xffa00000 out of range in
relative mode

build log at:
https://travis-ci.org/sudipm-mukherjee/parport/jobs/107707060

and tilegx defconfig fails with:
kallsyms failure: relative symbol value 0xfffffff700020000 out of range
in relative mode

build log at:
https://travis-ci.org/sudipm-mukherjee/parport/jobs/107707069

I will do a bisect later today to see which has caused this.

regards
sudip
