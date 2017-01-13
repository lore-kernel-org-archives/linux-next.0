From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
Date: Fri, 13 Jan 2017 14:39:32 +1100
Message-ID: <20170113143932.31017e89@canb.auug.org.au>
References: <20170112144933.7f161c69@canb.auug.org.au>
        <8af7e322-9d1f-112e-3ab3-b8b310939d6f@suse.com>
        <20170112153353.dfb923ac309edca685378444@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170112153353.dfb923ac309edca685378444@linux-foundation.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Eric Ren <zren@suse.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Hi Andrew,

On Thu, 12 Jan 2017 15:33:53 -0800 Andrew Morton <akpm@linux-foundation.org> wrote:
>
> I'll drop
> 
> ocfs2-dlmglue-prepare-tracking-logic-to-avoid-recursive-cluster-lock.patch
> and
> ocfs2-fix-deadlocks-when-taking-inode-lock-at-vfs-entry-points.patch

I removed them from linux-next today.

-- 
Cheers,
Stephen Rothwell
