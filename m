From: Jens Axboe <axboe@kernel.dk>
Subject: Re: linux-next: Signed-off-by missing for commits in the block tree
Date: Fri, 25 May 2018 22:03:06 -0600
Message-ID: <fc204457-1e79-131b-d166-5fec6d0cc734@kernel.dk>
References: <20180526135004.00b19986@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180526135004.00b19986@canb.auug.org.au>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Keith Busch <keith.busch@intel.com>
List-Id: linux-next.vger.kernel.org

On 5/25/18 9:50 PM, Stephen Rothwell wrote:
> Hi Jens,
> 
> Commits
> 
>   287a63ebbe7c ("nvme: mark the result argument to nvme_complete_async_event volatile")
>   750dde4472e4 ("nvme-pci: simplify nvme_cqe_valid")
>   d1f06f4ae041 ("nvme-pci: move ->cq_vector == -1 check outside of ->q_lock")
>   1ab0cd6966fc ("nvme-pci: split the nvme queue lock into submission and completion locks")
>   1eae349d18fc ("nvme-pci: drop IRQ disabling on submission queue lock")
> 
> are missing a Signed-off-by from their committer.

Thanks for the heads up. Not a huge problem for these particular commits,

-- 
Jens Axboe
