From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the staging-next tree with the
 v4l-dvb tree
Date: Wed, 7 Jul 2010 08:14:19 -0700
Message-ID: <20100707151419.GC2121@kroah.com>
References: <20100706175337.bec9305a.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20100706175337.bec9305a.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Palash Bandyopadhyay <Palash.Bandyopadhyay@conexant.com>, Mauro Carvalho Chehab <mchehab@redhat.com>, Scott Kidder <scott.kidder11@gmail.com>
List-Id: linux-next.vger.kernel.org

On Tue, Jul 06, 2010 at 05:53:37PM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the staging-next tree got a conflict in
> drivers/staging/cx25821/cx25821-audups11.c between commit
> e302c8255a198a567dab3a4ace7bd0222a6dc037 ("V4L/DVB: cx25821: Removed
> duplicate code and cleaned up") from the v4l-dvb tree and commit
> 231ded903f2f30b2bcdbf6672c7197187e3bb1ee ("Staging: cx25821: added KERN_
> facility levels") from the staging-next tree.
> 
> The former moved all te code in this file into other files, so I
> effectively just dropped the usb patch by deleting this file.

That sounds correct to me, thanks for doing this.

greg k-h
