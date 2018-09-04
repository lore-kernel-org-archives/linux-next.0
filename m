From: Jean Delvare <jdelvare@suse.de>
Subject: Re: linux-next: manual merge of the dmi tree with Linus' tree
Date: Tue, 4 Sep 2018 14:51:52 +0200
Message-ID: <20180904145152.5dae4343@endymion>
References: <20180904091950.2e49b1a5@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180904091950.2e49b1a5@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Kai Heng Feng <kai.heng.feng@canonical.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
List-Id: linux-next.vger.kernel.org

Hi Stephen,

On Tue, 4 Sep 2018 09:19:50 +1000, Stephen Rothwell wrote:
> Today's linux-next merge of the dmi tree got a conflict in:
> 
>   drivers/acpi/bus.c
> 
> between commit:
> 
>   ae976358cd7b ("Revert "ACPI / bus: Parse tables as term_list for Dell XPS 9570 and Precision M5530"")
> 
> from Linus' tree and commit:
> 
>   767b174cad46 ("ACPI / bus: Only call dmi_check_system on X86")
> 
> from the dmi tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Thanks for the heads up. I have rebased my dmi tree on top of 4.19-rc2,
and this solves the conflict.

-- 
Jean Delvare
SUSE L3 Support
