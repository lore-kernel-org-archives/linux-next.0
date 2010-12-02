From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the staging tree with the
 staging.current tree
Date: Wed, 1 Dec 2010 20:00:31 -0800
Message-ID: <20101202040031.GA10016@kroah.com>
References: <20101202132254.93e019c7.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20101202132254.93e019c7.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Randy Dunlap <randy.dunlap@oracle.com>, Pekka Enberg <penberg@kernel.org>
List-Id: linux-next.vger.kernel.org

On Thu, Dec 02, 2010 at 01:22:54PM +1100, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the staging tree got a conflict in
> drivers/staging/winbond/sysdef.h between commit
> 412dc7f368bf10a8049a8a4c41abbfd0108742e7 ("staging: fix winbond build,
> needs delay.h") from the staging.current tree and commit
> ddee7e28e7d5e4ba2b8537c6a59b035745c250bb ("Staging: w35und: Remove empty
> sysdef.h header") from the staging tree.
> 
> I removed the file.  I wonder if
> drivers/staging/winbond/phy_calibration.c and
> drivers/staging/winbond/reg.c now need their own includes of
> linux/delay.h ...

Heh, probably.  I'll handle this merge when thes staging.current code
goes to Linus this week.

thanks,

greg k-h
