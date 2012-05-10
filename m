From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the staging tree with the
 driver-core tree
Date: Thu, 10 May 2012 08:10:51 -0700
Message-ID: <20120510151051.GC17472@kroah.com>
References: <20120510173401.263f10f33f918bfc9e0bec88@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20120510173401.263f10f33f918bfc9e0bec88@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Chanwoo Choi <cw00.choi@samsung.com>, Myungjoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>
List-Id: linux-next.vger.kernel.org

On Thu, May 10, 2012 at 05:34:01PM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the staging tree got a conflict in
> drivers/misc/Makefile between commit 6a7e2618b3db ("misc: MAX8997: Remove
> max8997-muic driver") from the driver-core tree and commit ffc2825c2942
> ("Staging: mei: move the mei code out of staging") from the staging tree.
> 
> Just context changes.  I fixed it up (see below) and can carry the fix as
> necessary.

Looks good to me, thanks for this.

greg k-h
