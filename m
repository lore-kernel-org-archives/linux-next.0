From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the driver-core tree with the mmc
 tree
Date: Thu, 31 Oct 2013 15:16:40 -0700
Message-ID: <20131031221640.GB3595@kroah.com>
References: <20131028222007.30619a9f7d18f5acd9b1ae60@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20131028222007.30619a9f7d18f5acd9b1ae60@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Johan Hovold <jhovold@gmail.com>, Ulf Hansson <ulf.hansson@linaro.org>, Chris Ball <cjb@laptop.org>
List-Id: linux-next.vger.kernel.org

On Mon, Oct 28, 2013 at 10:20:07PM +1100, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the driver-core tree got a conflict in
> drivers/mmc/host/mvsdio.c between commit 50596285e0be ("mmc: mvsdio:
> Remove redundant suspend and resume callbacks") from the mmc tree and
> commit 1867adee6ed7 ("mmc: mvsdio: fix deferred probe from __init") from
> the driver-core tree.
> 
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).

Looks good to me, thanks.

greg k-h
