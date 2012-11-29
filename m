From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the driver-core tree with the mfd
 tree
Date: Wed, 28 Nov 2012 21:20:31 -0800
Message-ID: <20121129052031.GO4375@kroah.com>
References: <20121129150044.3795f21cd3913abc0c10f45c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20121129150044.3795f21cd3913abc0c10f45c@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Thu, Nov 29, 2012 at 03:00:44PM +1100, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the driver-core tree got a conflict in
> drivers/mfd/tps65090.c between various commits from the mfd tree and
> commits 84449216b01f ("mfd: remove use of __devexit_p"), f791be492f76
> ("mfd: remove use of __devinit") and 4740f73fe538 ("mfd: remove use of
> __devexit") from the driver-core tree.
> 
> I fixed it up (by using the mfd tree version) and can carry the fix as
> necessary (no action is required).

Looks good, thanks.

greg k-h
