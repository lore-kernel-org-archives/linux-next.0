From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: possible removal of the kvm-ppc tree
Date: Mon, 5 Dec 2016 10:39:11 +1100
Message-ID: <20161205103911.5b3e6a40@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexander Graf <agraf@suse.de>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Paul Mackerras <paulus@ozlabs.org>
List-Id: linux-next.vger.kernel.org

Hi Alexander,

I noticed that the kvm-ppc tree
(git://github.com/agraf/linux-2.6.git#kvm-ppc-next) has not been
updated for over a year.  I was wondering if I should remove it from
linux-next?

If so, I will rename the kvm-ppc-paulus tree to be the kvm-ppc tree.

-- 
Cheers,
Stephen Rothwell
