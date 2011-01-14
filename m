From: Jesse Barnes <jbarnes@virtuousgeek.org>
Subject: Re: CONFIG_NLS=m resulting in undefined reference to
 utf16s_to_utf8s causing build failure
Date: Fri, 14 Jan 2011 09:14:43 -0800
Message-ID: <20110114091443.66d7d016@jbarnes-desktop>
References: <20110112203414.GA5657@fedora14-r610.oslab.blr.amer.dell.com>
	<20110112160229.7b8d82c1@jbarnes-desktop>
	<alpine.LFD.2.02.1101122217370.19754@x980>
	<20110113075556.789ac3c3@jbarnes-vaio.home>
	<20110113162755.GA5872@fedora14-r610.oslab.blr.amer.dell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from oproxy1-pub.bluehost.com ([66.147.249.253]:50400 "HELO
	oproxy1-pub.bluehost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1756663Ab1ANROs (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 14 Jan 2011 12:14:48 -0500
In-Reply-To: <20110113162755.GA5872@fedora14-r610.oslab.blr.amer.dell.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Narendra_K@Dell.com
Cc: lenb@kernel.org, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, sfr@canb.auug.org.au, Matt_Domsch@Dell.com, Charles_Rose@Dell.com, Surya_Prabhakar@Dell.com

On Thu, 13 Jan 2011 08:03:56 -0800
<Narendra_K@Dell.com> wrote:

> On Thu, Jan 13, 2011 at 09:25:56PM +0530, Jesse Barnes wrote:
> > On Wed, 12 Jan 2011 22:23:55 -0500 (EST)
> > Len Brown <lenb@kernel.org> wrote:
> > > > So there's no other ACPI code that depends on this function?  I'd hate
> > > > to make PCI depend on NLS, so assuming ACPI doesn't need it (in which
> > > > case the select or depend should be there), I guess it should be pulled
> > > > into a common file that will always be included.
> > > 
> > > No, nothing in the ACPI code uses utf16s_to_utf8s.
> > > 
> > > I don't know anything about NLS, but it appears to be
> > > something that file systems (befs, cifs, fat, hfs, isofs, jfs, etc)
> > > use to to support native languages.
> > > 
> > > BTW. I don't understand why pci-label.o appears twice above.
> > > It used to be just the 2nd one, that depends on CONFIG_DMI.
> > 
> > Ok, I'll drop this patch for now then since I haven't seen a fix yet
> > and need to get Linus the rest of the changes.
> 
> Jesse,
> 
> I just compile tested a fix on the following lines without any failure.
> If it is acceptable, i will send a patch in half an hour. It builds
> 
> diff --git a/fs/Makefile b/fs/Makefile
> index db71a5b..2a39275 100644
> --- a/fs/Makefile
> +++ b/fs/Makefile
> @@ -86,7 +86,7 @@ obj-$(CONFIG_NFS_FS)		+= nfs/
>  obj-$(CONFIG_EXPORTFS)		+= exportfs/
>  obj-$(CONFIG_NFSD)		+= nfsd/
>  obj-$(CONFIG_LOCKD)		+= lockd/
> -obj-$(CONFIG_NLS)		+= nls/
> +obj-y				+= nls/
>  obj-$(CONFIG_SYSV_FS)		+= sysv/
>  obj-$(CONFIG_CIFS)		+= cifs/
>  obj-$(CONFIG_NCP_FS)		+= ncpfs/
> diff --git a/fs/nls/Makefile b/fs/nls/Makefile
> index f499dd7..c172fbb 100644
> --- a/fs/nls/Makefile
> +++ b/fs/nls/Makefile
> @@ -2,7 +2,7 @@
>  # Makefile for native language support
>  #
>  
> -obj-$(CONFIG_NLS)		+= nls_base.o
> +obj-y				+= nls_base.o
>  
>  obj-$(CONFIG_NLS_CODEPAGE_437)	+= nls_cp437.o
>  obj-$(CONFIG_NLS_CODEPAGE_737)	+= nls_cp737.o

nls_base.c is pretty small, but I don't want to make it unconditional.
If you don't want to split out the necessary functions into lib/ or
something, then it might be best to make the new code in
pci-label.c conditional on a new config option that describes the
feature, points at the documentation, and either selects or depends on
nls support (documenting it in the help text either way).

Thanks,
-- 
Jesse Barnes, Intel Open Source Technology Center
