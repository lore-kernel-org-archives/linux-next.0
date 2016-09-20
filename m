From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: next-20160920 build: 2 failures 5 warnings (next-20160920)
Date: Tue, 20 Sep 2016 13:39:48 +0200
Message-ID: <20160920113948.GB3461@kroah.com>
References: <E1bmIpL-0004P7-Bh@optimist>
 <20160920111848.GQ10189@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160920111848.GQ10189@sirena.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: frank zago <fzago@cray.com>, James Simmons <uja.ornl@gmail.com>, Dmitry Eremin <dmitry.eremin@intel.com>, Oleg Drokin <oleg.drokin@intel.com>, James Simmons <jsimmons@infradead.org>, kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Tue, Sep 20, 2016 at 12:18:48PM +0100, Mark Brown wrote:
> On Tue, Sep 20, 2016 at 12:03:03PM +0100, Build bot for Mark Brown wrote:
> 
> Today's -next fails to build arm and arm64 allmodconfig due to:
> 
> > 	arm64-allmodconfig
> > 	arm-allmodconfig
> > ERROR: "lustre_swab_lov_mds_md" [drivers/staging/lustre/lustre/lov/lov.ko] undefined!
> > ERROR: "lustre_swab_lov_mds_md" [drivers/staging/lustre/lustre/llite/lustre.ko] undefined!
> 
> due to the series of commits that were added yesterday removing
> EXPORT_SYMBOL()s.

Thanks, James has sent me a patch that was supposed to fix this, but
needs to be redone before I can take it...

greg k-h
