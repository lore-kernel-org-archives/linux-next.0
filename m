From: Keith Busch <kbusch@kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commits in the block tree
Date: Thu, 23 May 2019 15:52:07 -0600
Message-ID: <20190523215206.GA15192@localhost.localdomain>
References: <20190524074500.1fde68d6@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190524074500.1fde68d6@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jens Axboe <axboe@kernel.dk>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Keith Busch <keith.busch@intel.com>
List-Id: linux-next.vger.kernel.org

On Fri, May 24, 2019 at 07:45:00AM +1000, Stephen Rothwell wrote:
> Commits
> 
>   5fb4aac756ac ("nvme: release namespace SRCU protection before performing controller ioctls")
>   90ec611adcf2 ("nvme: merge nvme_ns_ioctl into nvme_ioctl")
>   3f98bcc58cd5 ("nvme: remove the ifdef around nvme_nvm_ioctl")
>   100c815cbd56 ("nvme: fix srcu locking on error return in nvme_get_ns_from_disk")
> 
> are missing a Signed-off-by from their committer.

Oops, I'd only added my Reviewed-by. Do I need to update the commit
messages and resend, or is this just putting me on notice for next time?
