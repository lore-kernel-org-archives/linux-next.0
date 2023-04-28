Return-Path: <linux-next-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CE9AC77B60
	for <linux-next@archiver.kernel.org>; Fri, 28 Apr 2023 15:23:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346284AbjD1PXX (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Fri, 28 Apr 2023 11:23:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230420AbjD1PXW (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 28 Apr 2023 11:23:22 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60F342129;
        Fri, 28 Apr 2023 08:22:56 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C983663753;
        Fri, 28 Apr 2023 15:22:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B194C433EF;
        Fri, 28 Apr 2023 15:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1682695373;
        bh=O0mxmW3dYC4wiE4/rrhpb6tEmJaJgZdGiPbLL2f80lQ=;
        h=From:To:Cc:Subject:Date:From;
        b=msKLp8NsB2qZxk/K0VOA8ryeUmoB9mtK66csvUOhH16RnqVzicDNh4XBtw8mKq0Ar
         XfozOBGto1CFpmz52U6w+9hqDPmhCde3O7yoct5J36tH2QT/IJIpUiHQDSOaJY+U2E
         3zVx5J8dEc9i9Dye6eEGxjzQVRJDJ8suFsnuhiNTKm1hEL9owhL1eErHvH/UvlxloE
         A+/vVU6fHkAK5u+ZJmhvo2swsfxG+jDY1FkOVSxPCv6TTpdMBzwfuyH9LmZJpIaOw4
         0/EDMGv5NyF1RUATYlLtIlDXL544oasdSUcpboW+PMYmgvi0+o1EYMg9g9qIYBJddj
         5aTkexMvz/maA==
From:   broonie@kernel.org
To:     Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Apr 28
Date:   Fri, 28 Apr 2023 16:22:49 +0100
Message-Id: <20230428152249.576448-1-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi all,

This will most likely be my last release until Stephen gets back on 8th
May, it's *possible* there may be some releases next week since it being
the second half of the merge window means things run a bunch faster and
with less intervention but really don't rely on that.

Changes since 20230427:

The loongarch tree gained a conflict against the origin tree.

Non-merge commits (relative to Linus' tree): 3150
 3568 files changed, 295586 insertions(+), 209942 deletions(-)

----------------------------------------------------------------------------

I have created today's linux-next tree at
git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
(patches at http://www.kernel.org/pub/linux/kernel/next/ ).  If you
are tracking the linux-next tree using git, you should not use "git pull"
to do so as that will try to merge the new linux-next release with the
old one.  You should use "git fetch" and checkout or reset to the new
master.

You can see which trees have been included by looking in the Next/Trees
file in the source.  There is also the merge.log file in the Next
directory.  Between each merge, the tree was built with a ppc64_defconfig
for powerpc, an allmodconfig for x86_64, a multi_v7_defconfig for arm
and a native build of tools/perf. After the final fixups (if any), I do
an x86_64 modules_install followed by builds for x86_64 allnoconfig,
powerpc allnoconfig (32 and 64 bit), ppc44x_defconfig, allyesconfig
and pseries_le_defconfig and i386, arm64, s390, sparc and sparc64
defconfig and htmldocs. And finally, a simple boot test of the powerpc
pseries_le_defconfig kernel in qemu (with and without kvm enabled).

Below is a summary of the state of the merge.

I am currently merging 358 trees (counting Linus' and 102 trees of bug
fix patches pending for the current merge release).

Stats about the size of the tree over time can be seen at
http://neuling.org/linux-next-size.html .

Status of my local build tests will be at
http://kisskb.ellerman.id.au/linux-next .  If maintainers want to give
advice about cross compilers/configs that work, we are always open to add
more builds.

Thanks to Randy Dunlap for doing many randconfig builds.  And to Paul
Gortmaker for triage and bug fixes.
