From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the staging tree with the usb tree
Date: Fri, 11 May 2012 07:44:02 -0700
Message-ID: <20120511144402.GB5958@kroah.com>
References: <20120511151236.c554c07acc0f5809eaeb85b8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20120511151236.c554c07acc0f5809eaeb85b8@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "Justin P. Mattock" <justinmattock@gmail.com>
List-Id: linux-next.vger.kernel.org

On Fri, May 11, 2012 at 03:12:36PM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the staging tree got a conflict in
> drivers/staging/quatech_usb2/quatech_usb2.c between commit 38902cf9f6be
> ("USB: remove staging quatech_usb2 driver") from the usb tree and a
> couple of commits from the staging tree.
> 
> The former removes the file, so I did that.

Wonderful, thanks for doing that.

greg k-h
