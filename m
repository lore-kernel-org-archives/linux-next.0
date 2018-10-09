From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the staging tree with the vfs tree
Date: Tue, 9 Oct 2018 11:18:52 +0200
Message-ID: <20181009091851.GB19241@kroah.com>
References: <20181009155945.1b66ee78@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181009155945.1b66ee78@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Al Viro <viro@zeniv.linux.org.uk>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Tue, Oct 09, 2018 at 03:59:45PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the staging tree got a conflict in:
> 
>   drivers/staging/dgnc/dgnc_tty.c
> 
> between commits:
> 
>   b68166ef8fd9 ("dgnc: leave TIOC[GS]SOFTCAR to ldisc")
>   e002c6f1ccb9 ("dgnc: don't bother with (empty) stub for TCXONC")
>   79273fc94ee9 ("dgnc: break-related ioctls won't reach ->ioctl()")
>   246d394c9cc5 ("dgnc: TIOCM... won't reach ->ioctl()")
> 
> from the vfs tree and commit:
> 
>   3268357865d6 ("staging: dgnc: delete the driver")
> 
> from the staging tree.
> 
> I fixed it up (I just removed the file) and can carry the fix as
> necessary.

Removing the file is correct, thanks.

greg k-h
