From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the staging tree with the tty tree
Date: Mon, 7 May 2012 07:48:07 -0700
Message-ID: <20120507144807.GA21302@kroah.com>
References: <20120507155831.a84a079857b24b7772333a37@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20120507155831.a84a079857b24b7772333a37@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Alan Cox <alan@linux.intel.com>, Paul Gortmaker <paul.gortmaker@windriver.com>
List-Id: linux-next.vger.kernel.org

On Mon, May 07, 2012 at 03:58:31PM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the staging tree got a conflict in
> drivers/staging/serial/68360serial.c between commit d29f3ef39be4
> ("tty_lock: Localise the lock") from the tty tree and commit 60e6d2689c2a
> ("staging: evict abandoned 68360serial.c driver from the kernel") from
> the staging tree.
> 
> The latter removed the file, so I did that.

That sounds correct, thanks for doing it.

greg k-h
