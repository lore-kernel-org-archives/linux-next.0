From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the btrfs-kdave tree
Date: Wed, 20 Dec 2017 09:20:10 +1100
Message-ID: <20171220092010.36825688@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:42859 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751559AbdLSWUN (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 19 Dec 2017 17:20:13 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Sterba <dsterba@suse.cz>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Qu Wenruo <wqu@suse.com>

Hi David,

After merging the btrfs-kdave tree, today's linux-next build (powerpc
ppc64_defconfig) produced this warning:

fs/btrfs/qgroup.c: In function 'qgroup_reserve':
fs/btrfs/qgroup.c:2432:1: warning: label 'retry' defined but not used [-Wunused-label]
 retry:
 ^

Introduced by commit

  b283738ab0ad ("Revert "btrfs: qgroups: Retry after commit on getting EDQUOT"")

-- 
Cheers,
Stephen Rothwell
