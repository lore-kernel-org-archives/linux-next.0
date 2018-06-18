From: Matthew Wilcox <willy@infradead.org>
Subject: Re: linux-next: build warning after merge of the xarray tree
Date: Mon, 18 Jun 2018 08:58:55 -0700
Message-ID: <20180618155855.GB28748@bombadil.infradead.org>
References: <20180618132854.4fcf8d5d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180618132854.4fcf8d5d@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Mon, Jun 18, 2018 at 01:28:54PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the xarray tree, today's linux-next build (x86_64
> allmodconfig) produced this warning:
> 
> WARNING: modpost: missing MODULE_LICENSE() in lib/test_xarray.o
> 
> Introduced by commit
> 
>   d968f529e39f ("xarray: Add XArray load operation")

Thanks; fix pushed.  I hadn't actually built it as a module ;-)
