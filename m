From: "Luck, Tony" <tony.luck@intel.com>
Subject: Re: linux-next: Tree for Feb 6 (drivers/edac/skx* and i10nm)
Date: Wed, 6 Feb 2019 13:23:00 -0800
Message-ID: <20190206212259.GA28490@agluck-desk>
References: <20190206170000.286b1f53@canb.auug.org.au>
 <3f095f3e-ace0-aadb-ead1-01908da5c08c@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <3f095f3e-ace0-aadb-ead1-01908da5c08c@infradead.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Edac Mailing List <linux-edac@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Wed, Feb 06, 2019 at 01:11:23PM -0800, Randy Dunlap wrote:
> on x86_64:
> 
> ld: drivers/edac/skx_common.o: in function `skx_mce_check_error':
> skx_common.c:(.text+0x982): undefined reference to `adxl_decode'
> ld: drivers/edac/skx_common.o: in function `skx_adxl_get':
> skx_common.c:(.init.text+0x11): undefined reference to `adxl_get_component_names'
> 
> 
> CONFIG_EDAC_I10NM=y
> but CONFIG_EDAC_SKX is not set.
> since # CONFIG_ACPI is not set
> 
> Should EDAC_I10NM depend on ACPI also?


Yes it should.

Boris applied a patch to fix this to his "for-next" branch today. So
this should be all fixed when linux-next does a new build.

-Tony
