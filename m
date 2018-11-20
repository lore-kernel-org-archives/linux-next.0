From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the staging tree with the drm tree
Date: Tue, 20 Nov 2018 09:54:47 +0100
Message-ID: <20181120085447.GB19171@kroah.com>
References: <20181120131616.139a4c8f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181120131616.139a4c8f@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Dave Airlie <airlied@linux.ie>, DRI <dri-devel@lists.freedesktop.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Alex Deucher <alexander.deucher@amd.com>, Hans de Goede <hdegoede@redhat.com>
List-Id: linux-next.vger.kernel.org

On Tue, Nov 20, 2018 at 01:16:16PM +1100, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the staging tree got a conflict in:
> 
>   drivers/staging/vboxvideo/vbox_ttm.c
> 
> between commits:
> 
>   a64f784bb14a ("drm/ttm: initialize globals during device init (v2)")
> 
> from the drm tree and commit:
> 
>   cd76c287a52f ("staging: vboxvideo: Cleanup the comments")
> 
> from the staging tree.
> 
> I fixed it up (the former removed the comments updated by the latter) and
> can carry the fix as necessary. This is now fixed as far as linux-next
> is concerned, but any non trivial conflicts should be mentioned to your
> upstream maintainer when your tree is submitted for merging.  You may
> also want to consider cooperating with the maintainer of the conflicting
> tree to minimise any particularly complex conflicts.

Fix seems sane to me, thanks.

greg k-h
