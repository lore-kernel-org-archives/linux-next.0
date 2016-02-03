From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Feb 3 (mm, hugepage)
Date: Wed, 3 Feb 2016 10:19:04 -0800
Message-ID: <56B24498.4040402@infradead.org>
References: <20160203161811.621b399a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <owner-linux-mm@kvack.org>
In-Reply-To: <20160203161811.621b399a@canb.auug.org.au>
Sender: owner-linux-mm@kvack.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Linux MM <linux-mm@kvack.org>
List-Id: linux-next.vger.kernel.org

On 02/02/16 21:18, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20160202:
> 

on x86_64:

when CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD is enabled
and CONFIG_TRANSPARENT_HUGEPAGE is not enabled:

../fs/proc/task_mmu.c: In function 'smaps_pud_range':
../fs/proc/task_mmu.c:596:2: error: implicit declaration of function 'is_huge_zero_pud' [-Werror=implicit-function-declaration]
  if (is_huge_zero_pud(*pud))
  ^



-- 
~Randy

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>
