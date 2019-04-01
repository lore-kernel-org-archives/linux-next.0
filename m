From: Jens Axboe <axboe@kernel.dk>
Subject: Re: linux-next: Signed-off-by missing for commits in the block tree
Date: Mon, 1 Apr 2019 12:10:27 -0600
Message-ID: <25f6354a-8847-4610-c609-825ed4545b7b@kernel.dk>
References: <20190402050842.2db07437@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190402050842.2db07437@canb.auug.org.au>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On 4/1/19 12:08 PM, Stephen Rothwell wrote:
> Hi Jens,
> 
> Commits
> 
>   837d7c7005c3 ("block: enable multi-page bvec for passthrough IO")
>   df88a384baa3 ("block: pass page to xen_biovec_phys_mergeable")
> 
> are missing a Signed-off-by from their committer.

That's my silly error, I'll fix that up. Thanks for letting me know.

-- 
Jens Axboe
