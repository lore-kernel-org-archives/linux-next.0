From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the staging tree with the v4l-dvb
 tree
Date: Fri, 4 Mar 2011 09:13:06 -0800
Message-ID: <20110304171306.GD22173@kroah.com>
References: <20110304163849.651cfbbe.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20110304163849.651cfbbe.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, Mauro Carvalho Chehab <mchehab@redhat.com>, Timo von Holtz <tvh@informatik.uni-kiel.de>, Alan Cox <alan@linux.intel.com>
List-Id: linux-next.vger.kernel.org

On Fri, Mar 04, 2011 at 04:38:49PM +1100, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the staging tree got a conflict in
> drivers/staging/usbvideo/vicam.c between commit
> af6302700e87a883481c342001ef81b77641bf98 ("[media] staging-usbvideo:
> remove") from the v4l-dvb tree and commits
> 046d747e0d2cb597e0b6fa4a79c32b43e97ed792 ("Staging: usbvideo: vicam:
> fixed some coding style issues") and
> 38a26ef272d8a93c88de54d8d3bd14ac3ce36056 ("staging: usbvideo: vicam: Fix
> build in -next") from the staging tree.
> 
> I removed the file.

thanks for doing this.

greg k-h
