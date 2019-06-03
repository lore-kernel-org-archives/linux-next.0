From: Matthew Wilcox <willy@infradead.org>
Subject: Re: linux-next: runtime failure of next-20190603
Date: Mon, 3 Jun 2019 15:59:54 -0700
Message-ID: <20190603225954.GD23346@bombadil.infradead.org>
References: <20190603162215.6390707f@canb.auug.org.au>
 <a6c98d75-078a-797f-a582-9687324e8c02@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <a6c98d75-078a-797f-a582-9687324e8c02@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dave Hansen <dave.hansen@intel.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Mon, Jun 03, 2019 at 02:07:26PM -0700, Dave Hansen wrote:
> On 6/2/19 11:22 PM, Stephen Rothwell wrote:
> > My qemu powerpc_pseries_le_defconfig boots failed today with the
> > following output at shutdown time:
> ...
> > [   32.112430] NIP [c000000000bbeb38] xas_load+0x8/0xd0
> ...
> > Reverting commit
> > 
> > fa858b6eec3f ("XArray: Add xas_replace")
> > 
> > made the failure go away.
> 
> I'm seeing a similar softlockup:

I've taken that commit out of my xarray tree.  It's only a performance
optimisation, so I don't mind dropping it until it's debugged.
