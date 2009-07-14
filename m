From: David Brownell <david-b@pacbell.net>
Subject: Re: linux-next: driver-core tree build failure
Date: Tue, 14 Jul 2009 00:31:27 -0700
Message-ID: <200907140031.27979.david-b@pacbell.net>
References: <20090714163309.f2ee320d.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1753982AbZGNHba@vger.kernel.org>
In-Reply-To: <20090714163309.f2ee320d.sfr@canb.auug.org.au>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Greg KH <greg@kroah.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Monday 13 July 2009, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next build (x86_64 allmodconfig) failed like this:
> 
> drivers/mtd/mtdcore.c:220: error: expected '{' before 'const'
> drivers/mtd/mtdcore.c:227: error: 'mtd_groups' undeclared here (not in a function)
> 
> Caused by the update to commit ba87b739a1f5dd545679d886b8d193cdede991cf
> ("driver model: constify attribute groups").
> 
> I have applied the patch below for today.

That's a good patch, go with it.  Sorry; I guess this wasn't
the version I had test-built.  My eyes were reporting "static"
as the (expected) initial keyword there; they lied!


> -- 
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Tue, 14 Jul 2009 16:29:39 +1000
> Subject: [PATCH] driver-core: fix for mtd typo
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/mtd/mtdcore.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
> index 93e6731..05a16be 100644
> --- a/drivers/mtd/mtdcore.c
> +++ b/drivers/mtd/mtdcore.c
> @@ -217,7 +217,7 @@ struct attribute_group mtd_group = {
>  	.attrs		= mtd_attrs,
>  };
>  
> -struct const attribute_group *mtd_groups[] = {
> +const struct attribute_group *mtd_groups[] = {
>  	&mtd_group,
>  	NULL,
>  };
> -- 
> 1.6.3.3
> 
> 
