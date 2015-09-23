From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Subject: Re: linux-next: Tree for Sep 23
Date: Wed, 23 Sep 2015 13:12:08 +0530
Message-ID: <20150923074207.GA27002@sudip-pc>
References: <20150923142343.35797c0f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150923142343.35797c0f@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Paul Burton <paul.burton@imgtec.com>, Ralf Baechle <ralf@linux-mips.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "Maciej W. Rozycki" <macro@linux-mips.org>, linux-mips@linux-mips.org
List-Id: linux-next.vger.kernel.org

On Wed, Sep 23, 2015 at 02:23:43PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20150922:
mips allmodconfig failed with the error:
No rule to make target 'arch/mips/mm/sc-debugfs.o', needed by 'arch/mips/mm/built-in.o'

caused by:
13ea0032658d ("MIPS: Allow L2 prefetch to be configured via debugfs")

regards
sudip
