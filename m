From: "Kani, Toshimitsu" <toshi.kani@hpe.com>
Subject: RE: linux-next: manual merge of the pm tree with the dmi tree
Date: Mon, 4 Sep 2017 23:17:32 +0000
Message-ID: <DF4PR84MB0187513FF1BE644FF396987082910@DF4PR84MB0187.NAMPRD84.PROD.OUTLOOK.COM>
References: <20170831110759.334c9fe2@canb.auug.org.au>
        <1504272021.4651.1.camel@suse.de>
 <20170904163733.008c3b63@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170904163733.008c3b63@canb.auug.org.au>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Jean Delvare <jdelvare@suse.de>
Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Christoph Hellwig <hch@lst.de>
List-Id: linux-next.vger.kernel.org

> Hi Jean,
> 
> On Fri, 01 Sep 2017 15:20:21 +0200 Jean Delvare <jdelvare@suse.de> wrote:
> >
> > On jeu., 2017-08-31 at 11:07 +1000, Stephen Rothwell wrote:
> > >
> > > Today's linux-next merge of the pm tree got a conflict in:
> > >
> > >   drivers/acpi/blacklist.c
> > >
> > > between commit:
> > >
> > >   f996c4155d0d ("dmi: Mark all struct dmi_system_id instances const")
> > >
> > > from the dmi tree and commit:
> > >
> > >   5aa5911a0ed9 ("ACPI / blacklist: add acpi_match_platform_list()")
> > >
> > > from the pm tree.
> > >
> > > I fixed it up (see below) and can carry the fix as necessary. This
> >
> > Below, where?
> 
> Oops sorry, I think this is it:

The merge change below looks good to me.
Thanks,
-Toshi


> 
> d75dc5255183bfae1181f5e1e8b260f18794d79d
> diff --cc drivers/acpi/blacklist.c
> index f58bbc368f88,037fd537bbf6..995c4d8922b1
> --- a/drivers/acpi/blacklist.c
> +++ b/drivers/acpi/blacklist.c
> @@@ -30,24 -30,7 +30,7 @@@
> 
>   #include "internal.h"
> 
> - enum acpi_blacklist_predicates {
> - 	all_versions,
> - 	less_than_or_equal,
> - 	equal,
> - 	greater_than_or_equal,
> - };
> -
> - struct acpi_blacklist_item {
> - 	char oem_id[7];
> - 	char oem_table_id[9];
> - 	u32 oem_revision;
> - 	char *table;
> - 	enum acpi_blacklist_predicates oem_revision_predicate;
> - 	char *reason;
> - 	u32 is_critical_error;
> - };
> -
>  -static struct dmi_system_id acpi_rev_dmi_table[] __initdata;
>  +static const struct dmi_system_id acpi_rev_dmi_table[] __initconst;
> 
>   /*
>    * POLICY: If *anything* doesn't work, put it on the blacklist.
