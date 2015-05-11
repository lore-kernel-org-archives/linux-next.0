From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the staging tree with the v4l-dvb
 tree
Date: Mon, 11 May 2015 11:34:28 -0700
Message-ID: <20150511183428.GB25903@kroah.com>
References: <20150511152804.24dffc0a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150511152804.24dffc0a@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Wei Yongjun <yongjun_wei@trendmicro.com.cn>, Hans Verkuil <hans.verkuil@cisco.com>
List-Id: linux-next.vger.kernel.org

On Mon, May 11, 2015 at 03:28:04PM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the staging tree got a conflict in
> drivers/staging/media/dt3155v4l/dt3155v4l.c between commit cc11b140c3f1
> ("[media] dt3155: move out of staging into drivers/media/pci") from the
> v4l-dvb tree and commit ec80e2428046 ("staging: dt3155v4l: remove
> unused including <linux/version.h>") from the staging tree (which moved
> the file to drivers/media/pci/dt3155/dt3155.c).
> 
> I fixed it up (I just deleted the file from staging - the
> linux/config.h patch needs to be applied to the new file) and can carry
> the fix as necessary (no action is required).

Sounds good, thanks for doing this.

greg k-h
