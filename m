From: Mike Kravetz <mike.kravetz@oracle.com>
Subject: Re: mmotm 2019-05-29-20-52 uploaded
Date: Thu, 30 May 2019 13:54:07 -0700
Message-ID: <fac5f029-ef20-282e-b0d2-2357589839e8@oracle.com>
References: <20190530035339.hJr4GziBa%akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190530035339.hJr4GziBa%akpm@linux-foundation.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: akpm@linux-foundation.org, broonie@kernel.org, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-next@vger.kernel.org, mhocko@suse.cz, mm-commits@vger.kernel.org, sfr@canb.auug.org.au
Cc: Huang Ying <ying.huang@intel.com>
List-Id: linux-next.vger.kernel.org

On 5/29/19 8:53 PM, akpm@linux-foundation.org wrote:
> The mm-of-the-moment snapshot 2019-05-29-20-52 has been uploaded to
> 
>    http://www.ozlabs.org/~akpm/mmotm/
> 

With this kernel, I seem to get many messages such as:

get_swap_device: Bad swap file entry 1400000000000001

It would seem to be related to commit 3e2c19f9bef7e
> * mm-swap-fix-race-between-swapoff-and-some-swap-operations.patch

-- 
Mike Kravetz
