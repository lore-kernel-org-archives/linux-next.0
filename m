From: Borislav Petkov <bp@alien8.de>
Subject: Re: linux-next: Tree for Feb 6 (drivers/edac/skx* and i10nm)
Date: Wed, 6 Feb 2019 22:22:18 +0100
Message-ID: <20190206212218.GJ7314@zn.tnic>
References: <20190206170000.286b1f53@canb.auug.org.au>
 <3f095f3e-ace0-aadb-ead1-01908da5c08c@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <3f095f3e-ace0-aadb-ead1-01908da5c08c@infradead.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Tony Luck <tony.luck@intel.com>, Linux Edac Mailing List <linux-edac@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Wed, Feb 06, 2019 at 01:11:23PM -0800, Randy Dunlap wrote:
> CONFIG_EDAC_I10NM=y
> but CONFIG_EDAC_SKX is not set.
> since # CONFIG_ACPI is not set
> 
> Should EDAC_I10NM depend on ACPI also?

This should do it:

https://git.kernel.org/pub/scm/linux/kernel/git/bp/bp.git/commit/?h=for-next&id=d6a9f7336d925364daca00557afa59a68e78b422

-- 
Regards/Gruss,
    Boris.

Good mailing practices for 400: avoid top-posting and trim the reply.
