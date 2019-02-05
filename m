From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Feb 5 (btrfs/zstd)
Date: Tue, 5 Feb 2019 09:40:40 -0800
Message-ID: <26ce21e5-0e3c-d847-c895-6cb166507441@infradead.org>
References: <20190205171228.41a9f771@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <linux-btrfs-owner@vger.kernel.org>
In-Reply-To: <20190205171228.41a9f771@canb.auug.org.au>
Content-Language: en-US
Sender: linux-btrfs-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Btrfs <linux-btrfs@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On 2/4/19 10:12 PM, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20190204:
> 

on i386:

../fs/btrfs/zstd.c: In function ‘zstd_reclaim_timer_fn’:
../fs/btrfs/zstd.c:27:35: warning: integer overflow in expression [-Woverflow]
 #define ZSTD_BTRFS_RECLAIM_NS (45 * NSEC_PER_SEC)
                                   ^
../fs/btrfs/zstd.c:96:33: note: in expansion of macro ‘ZSTD_BTRFS_RECLAIM_NS’
   if (now < victim->last_used + ZSTD_BTRFS_RECLAIM_NS)
                                 ^


-- 
~Randy
