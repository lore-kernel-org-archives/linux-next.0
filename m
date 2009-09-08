From: "H Hartley Sweeten" <hartleys@visionengravers.com>
Subject: RE: linux-next: manual merge of the mtd tree with the i2c tree
Date: Tue, 8 Sep 2009 12:52:07 -0400
Message-ID: <BD79186B4FD85F4B8E60E381CAEE190901CBE901@mi8nycmail19.Mi8.com>
References: <20090907133621.3b4d4ce3.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1751584AbZIHQwK@vger.kernel.org>
Content-class: urn:content-classes:message
In-Reply-To: <20090907133621.3b4d4ce3.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, David Woodhouse <dwmw2@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, David Brownell <dbrownell@users.sourceforge.net>, Greg Kroah-Hartman <gregkh@suse.de>, Jean Delvare <khali@linux-fr.org>, Andrew Morton <akpm@linux-foundation.org>, Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
List-Id: linux-next.vger.kernel.org

On Sunday, September 06, 2009 8:36 PM, Stephen Rothwell wrote:
> Hi David,
> 
> Today's linux-next merge of the mtd tree got a conflict in
> drivers/mtd/mtdcore.c between commit
> c6ce12828f9146f12d0654241bcb39523c257c90 ("driver model: constify
> attribute groups") from the i2c tree and commit
> fca910883324d437a24d447b08f524fa19261a94 ("mtd: make few symbols static")
> from the mtd tree.
> 
> Just overlapping changes.  I fixed it up (see below) and can carry the
> fix as necessary.

Acked-by: H Hartley Sweeten <hsweeten@visionengravers.com>

> -- 
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
> 
> diff --cc drivers/mtd/mtdcore.c
> index 69007a6,3f559c0..0000000
> --- a/drivers/mtd/mtdcore.c
> +++ b/drivers/mtd/mtdcore.c
> @@@ -217,7 -217,7 +217,7 @@@ static struct attribute_group mtd_grou
>   	.attrs		= mtd_attrs,
>   };
>   
> - const struct attribute_group *mtd_groups[] = {
>  -static struct attribute_group *mtd_groups[] = {
> ++static const struct attribute_group *mtd_groups[] = {
>   	&mtd_group,
>   	NULL,
>   };
