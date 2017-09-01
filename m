From: Jean Delvare <jdelvare@suse.de>
Subject: Re: linux-next: manual merge of the pm tree with the dmi tree
Date: Fri, 01 Sep 2017 15:20:21 +0200
Message-ID: <1504272021.4651.1.camel@suse.de>
References: <20170831110759.334c9fe2@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170831110759.334c9fe2@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Christoph Hellwig <hch@lst.de>, Toshi Kani <toshi.kani@hpe.com>
List-Id: linux-next.vger.kernel.org

Hi Stephen,

On jeu., 2017-08-31 at 11:07 +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the pm tree got a conflict in:
> 
>   drivers/acpi/blacklist.c
> 
> between commit:
> 
>   f996c4155d0d ("dmi: Mark all struct dmi_system_id instances const")
> 
> from the dmi tree and commit:
> 
>   5aa5911a0ed9 ("ACPI / blacklist: add acpi_match_platform_list()")
> 
> from the pm tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This

Below, where?

> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

-- 
Jean Delvare
SUSE L3 Support
