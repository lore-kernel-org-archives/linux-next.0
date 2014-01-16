From: Philipp Hachtmann <phacht@linux.vnet.ibm.com>
Subject: Re: linux-next: build warning after merge of the final tree
 (akpm-current related)
Date: Thu, 16 Jan 2014 14:15:21 +0100
Message-ID: <20140116141521.015fea81@lilie>
References: <20140116173638.5a1f01f8efb8cb7d48e021b0@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20140116173638.5a1f01f8efb8cb7d48e021b0@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Hi Stephen,

thanks for reminding me...

Am Thu, 16 Jan 2014 17:36:38 +1100
schrieb Stephen Rothwell <sfr@canb.auug.org.au>:
> mm/nobootmem.c: In function 'free_low_memory_core_early':
> mm/nobootmem.c:119:26: warning: unused variable
> 'size' [-Wunused-variable]
> Introduced by commit dd3ff251123c ("mm/nobootmem: free_all_bootmem
> again") from the akpm-current tree.

Will send a new version of the patch today.

Philipp
