From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the staging tree with the v4l-dvb
 tree
Date: Fri, 4 Mar 2011 09:12:40 -0800
Message-ID: <20110304171240.GB22173@kroah.com>
References: <20110304163841.fa243eef.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20110304163841.fa243eef.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, Mauro Carvalho Chehab <mchehab@redhat.com>, Timo von Holtz <tvh@informatik.uni-kiel.de>
List-Id: linux-next.vger.kernel.org

On Fri, Mar 04, 2011 at 04:38:41PM +1100, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the staging tree got a conflict in
> drivers/staging/usbvideo/usbvideo.c between commit
> af6302700e87a883481c342001ef81b77641bf98 ([media] staging-usbvideo:
> remove"") from the v4l-dvb tree and commit  ("Staging: usbvideo:
> usbvideo: fixed some coding style issues") from the staging tree.
> 
> I removed the file.

Thanks, that's the correct thing to do.

greg k-h
