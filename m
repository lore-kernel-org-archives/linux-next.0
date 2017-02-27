From: David Howells <dhowells@redhat.com>
Subject: Re: linux-next: build failure after merge of the vfs tree
Date: Mon, 27 Feb 2017 08:31:15 +0000
Message-ID: <30472.1488184275@warthog.procyon.org.uk>
References: <20170227112714.23e5ddf4@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170227112714.23e5ddf4@canb.auug.org.au>
Content-ID: <30471.1488184275.1@warthog.procyon.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: dhowells@redhat.com, Al Viro <viro@ZenIV.linux.org.uk>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Mon, 27 Feb 2017 11:21:47 +1100
> Subject: [PATCH] statx: disable the sample code for now
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  samples/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/samples/Kconfig b/samples/Kconfig
> index e1fc9a6a96fa..9cb63188d3ef 100644
> --- a/samples/Kconfig
> +++ b/samples/Kconfig
> @@ -114,6 +114,7 @@ config SAMPLE_VFIO_MDEV_MTTY
>  
>  config SAMPLE_STATX
>  	bool "Build example extended-stat using code"
> +	depends on BROKEN
>  	help
>  	  Build example userspace program to use the new extended-stat syscall.
>  

It turns out that the statx sample depends on the header installation phase of
the build.  I'm not sure how to encode that fact in the Makefile, so marking
it broken for now is fine.

Acked-by: David Howells <dhowells@redhat.com>
