From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the driver-core tree with the mfd
 tree
Date: Wed, 28 Nov 2012 21:20:41 -0800
Message-ID: <20121129052041.GP4375@kroah.com>
References: <20121129145714.4da1094e1f33ce8db417fa19@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20121129145714.4da1094e1f33ce8db417fa19@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Davide Ciminaghi <ciminaghi@gnudd.com>, Samuel Ortiz <sameo@linux.intel.com>, Bill Pemberton <wfp5p@virginia.edu>
List-Id: linux-next.vger.kernel.org

On Thu, Nov 29, 2012 at 02:57:14PM +1100, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the driver-core tree got a conflict in
> drivers/mfd/sta2x11-mfd.c between various commits from the mfd tree and
> commits f791be492f76 ("mfd: remove use of __devinit"), a9e9ce4c4167
> ("mfd: remove use of __devinitdata") and a73e5df16b52 ("mfd: remove use
> of __devinitconst") from the driver-core tree.
> 
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).

Looks good, thanks.

greg k-h
