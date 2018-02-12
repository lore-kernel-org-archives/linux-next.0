From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Signed-off-by missing for commits in the nand tree
Date: Tue, 13 Feb 2018 09:31:53 +1100
Message-ID: <20180213093153.0958cff1@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Hi Boris,

A whole series of commits

  558783726c98 ("mtd: nand: mxc: reorder functions to avoid forward declarations")
to
  e385e291129e ("mtd: nand: mxc: remove now unused code")

are missing a Signed-off-by from their committer.

-- 
Cheers,
Stephen Rothwell
