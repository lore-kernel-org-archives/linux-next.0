From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the usb tree with the mips tree
Date: Tue, 19 Oct 2010 08:46:54 -0700
Message-ID: <20101019154654.GD4589@kroah.com>
References: <20101018170619.25f6566f.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20101018170619.25f6566f.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Anatolij Gustschin <agust@denx.de>, David Daney <ddaney@caviumnetworks.com>, Ralf Baechle <ralf@linux-mips.org>
List-Id: linux-next.vger.kernel.org

On Mon, Oct 18, 2010 at 05:06:19PM +1100, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the usb tree got a conflict in
> drivers/usb/host/Kconfig between commit
> cd97084c3aff6f1037e00ee711a872719b60441d ("USB: Add EHCI and OHCH glue
> for OCTEON II SOCs") from the mips tree and commit
> c67a807cb13570bfc7b78f53158d14a433c59591 ("USB: add USB EHCI support for
> MPC5121 SoC") from the usb tree.
> 
> I fixed it up (see below) and can carry the fix as necessary.

Thanks for the fix, looks fine.

greg k-h
