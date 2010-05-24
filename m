From: Matthew Garrett <mjg@redhat.com>
Subject: Re: [PATCH -next] nouveau: fix acpi_lid_open undefined
Date: Mon, 24 May 2010 13:56:28 +0100
Message-ID: <20100524125628.GA14278@srcf.ucam.org>
References: <20100522170459.4c89723d.sfr@canb.auug.org.au> <20100523170040.3c4aa87c.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20100523170040.3c4aa87c.randy.dunlap@oracle.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Ben Skeggs <bskeggs@redhat.com>, dri-devel@lists.freedesktop.org, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, David Airlie <airlied@linux.ie>
List-Id: linux-next.vger.kernel.org

On Sun, May 23, 2010 at 05:00:40PM -0700, Randy Dunlap wrote:
> From: Randy Dunlap <randy.dunlap@oracle.com>
> 
> When CONFIG_ACPI_BUTTON=m (and probably when ACPI_BUTTON is not enabled)
> and NOUVEAU is built-in (not as a loadable module):

Won't this result in a behavioural difference? The desirable outcome is 
that that configuration be impossible, not for that configuration to 
build but be buggy.

-- 
Matthew Garrett | mjg59@srcf.ucam.org
