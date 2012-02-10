From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the staging tree with Linus' tree
Date: Thu, 9 Feb 2012 21:30:36 -0800
Message-ID: <20120210053036.GC2068@kroah.com>
References: <20120210154806.4a81ec53dc24a40cf91a758a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20120210154806.4a81ec53dc24a40cf91a758a@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Omar Ramirez Luna <omar.ramirez@ti.com>, =?iso-8859-1?Q?V=EDctor_Manuel_J=E1quez?= Leal <vjaquez@igalia.com>
List-Id: linux-next.vger.kernel.org

On Fri, Feb 10, 2012 at 03:48:06PM +1100, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the staging tree got a conflict in
> drivers/staging/tidspbridge/rmgr/drv_interface.c between commit
> 5a63177a6967 ("staging: tidspbridge: fix bridge_open memory leaks") from
> Linus' tree and commit 518761dba127 ("staging: tidspbridge: remove unused
> header") from the staging tree.
> 
> I fixed it up (I think - see below) and can carry the fix as necessary.

Thanks, I'll try to fix this up with a merge tomorrow to get this in
sync.

greg k-h
