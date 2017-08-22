From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: Tree for Aug 22
Date: Wed, 23 Aug 2017 04:11:17 +1000
Message-ID: <20170823041117.780097f7@canb.auug.org.au>
References: <20170822183816.7925e0f8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170822183816.7925e0f8@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Linux-Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, ppc-dev <linuxppc-dev@lists.ozlabs.org>, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, Nicholas Piggin <npiggin@gmail.com>
List-Id: linux-next.vger.kernel.org

Hi all,

This tree fails to boot on my qemu test.  2 boot logs attached.

Paul, Nick, is this the same/similar to the other RCU/lockup bug you
are chasing.  This is the first time I have seen this failure.

This qemu boot is in full emulation mode if I add --enable-kvm to the
qemu command, it does not fail to boot.  (the test just boots and then shuts down)
-- 
Cheers,
Stephen Rothwell
