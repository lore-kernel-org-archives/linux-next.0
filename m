From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Subject: Please add swiotlb.git tree to linux-next
Date: Wed, 31 Oct 2012 08:59:29 -0400
Message-ID: <20121031125929.GA27144@phenom.dumpdata.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: sfr@canb.auug.org.au, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Hello,

Please add:

 git://git.kernel.org/pub/scm/linux/kernel/git/konrad/swiotlb.git #linux-next

in the linux-next system. The branch is 'linux-next'. This would be the
tree and branch used for maintaining the swiotlb and its different users.

The Ack's have already been given per this commit:

commit 6e28b761c5020c4bc943c7e38da86bea8af77d5c
Author: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Date:   Mon Oct 8 16:28:05 2012 -0700

    MAINTAINERS: add Konrad as the SWIOTLB maintainer
    
    Now that I've an IA64 box on top of the other boxes (IBM with Calgary-X,
    Intel VT-d, AMD Vi, and AMD GART - that can use SWIOTLB as fallback) I can
    reliably do regression testing.
    
    Signed-off-by: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
    Cc: FUJITA Tomonori <fujita.tomonori@lab.ntt.co.jp>
    Cc: Ingo Molnar <mingo@elte.hu>
    Acked-by: "H. Peter Anvin" <hpa@zytor.com>
    Cc: Thomas Gleixner <tglx@linutronix.de>
    Acked-by: Tony Luck <tony.luck@intel.com>
    Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
    Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
