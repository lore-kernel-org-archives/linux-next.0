From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the staging tree with Linus' tree
Date: Thu, 9 Feb 2012 21:30:13 -0800
Message-ID: <20120210053013.GB2068@kroah.com>
References: <20120210154753.54d5620ba268f2d1e8717838@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20120210154753.54d5620ba268f2d1e8717838@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Seth Jennings <sjenning@linux.vnet.ibm.com>
List-Id: linux-next.vger.kernel.org

On Fri, Feb 10, 2012 at 03:47:53PM +1100, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the staging tree got a conflict in
> drivers/staging/zcache/zcache-main.c between commit 2a4830110b90
> ("staging: zcache: fix serialization bug in zv stats") from Linus' tree
> (and also in the staging tree) and commit a49aeb1de585 ("staging: zcache:
> replace xvmalloc with zsmalloc") from the staging tree.
> 
> I used the staging tree version (since these were just further changes to
> the same bits of code).

Thanks, that sounds correct.

greg k-h
