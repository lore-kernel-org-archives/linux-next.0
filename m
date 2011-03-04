From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the staging tree with the v4l-dvb
 tree
Date: Fri, 4 Mar 2011 09:14:23 -0800
Message-ID: <20110304171423.GG22173@kroah.com>
References: <20110304163915.f0b3f60e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20110304163915.f0b3f60e.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>, Tomas Winkler <tomas.winkler@intel.com>
List-Id: linux-next.vger.kernel.org

On Fri, Mar 04, 2011 at 04:39:15PM +1100, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the staging tree got a conflict in
> drivers/staging/easycap/easycap_ioctl.c between commit
> 0ff69fe7cebb65856eba7feb3fd76fb4ba365bf8 ("[media] v4l: removal of old,
> obsolete ioctls") from the v4l-dvb tree and commits
> f62bc44e055712fc8ccf34654a79137dd4a4d8af ("staging/easycap: remove
> obsolete VIDIOC_S_CTRL_OLD ioctl") and
> 50e1fbdc1c9965b6ddbc5c9900377ff18bbf9ae8 ("staging/easycap: add first
> level indentation to easycap_ioctl.c") from the staging tree.
> 
> The latter two were a superset of the former, so I used that.

Thanks, that looks correct.

greg k-h
