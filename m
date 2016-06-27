From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Can you add the binfmt_misc tree to linux-next?
Date: Mon, 27 Jun 2016 09:16:38 -0700
Message-ID: <1467044198.2264.19.camel@HansenPartnership.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-fsdevel-owner@vger.kernel.org>
Sender: linux-fsdevel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-fsdevel@vger.kernel.org, Linux Containers <containers@lists.linux-foundation.org>
List-Id: linux-next.vger.kernel.org

Since I'd effectively become binfmt_misc maintainer when these patches
get merged on the last person to touch it owns it principle, it makes
sense to begin now more formally.  The tree is at

git://git.kernel.org/pub/scm/linux/kernel/git/jejb/binfmt_misc.git for-next

It currently contains four patches adding the container emulation
infrastructure from the persistent-handlers branch.

Thanks,

James

