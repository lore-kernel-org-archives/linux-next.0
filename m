Return-Path: <linux-next-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 173F1C77B76
	for <linux-next@archiver.kernel.org>; Mon, 17 Apr 2023 14:36:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229551AbjDQOgc (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Mon, 17 Apr 2023 10:36:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229573AbjDQOgb (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 17 Apr 2023 10:36:31 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E4D1E8;
        Mon, 17 Apr 2023 07:36:25 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id DC2D862603;
        Mon, 17 Apr 2023 14:36:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11CCFC433D2;
        Mon, 17 Apr 2023 14:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1681742184;
        bh=TJvJT+LSQXiURhDyuoQ3DL12SWV4O4BRIOvlEFEf2K4=;
        h=From:To:Cc:Subject:Date:From;
        b=L/I7s1WWi0EtlddLnCpSrOcdzC2/gyRjEFEHhikUmXtYD/yamH1Uc7qhimNw4CoyZ
         1WJyokHwaqp50Y9ZLKFA7/iFJFxr9Yrjgn0aoAmi95/YGRKQie/OT799bd/fvHeQTa
         FJjEHPpJD3/3mTOfC+/JOJ0rU9a1FgCc/G2yZaPpDOJmRhUGIpBRkEug5OG3ptLXLr
         g+8M8QRzZ9zOMDqRuC/3HXOmOIEgUitf34T8Z4lzm/G6sZ9iHs6O9JYCQAfJ/Xs2uR
         4wrwevW+ppjnLqnqZ+NWc+ZavrMAJmvzdNxILBM+3DzV0NWHRpw1z+bPZaXhSvJeOv
         womyFuPRUTiKw==
From:   broonie@kernel.org
To:     Marcel Holtmann <marcel@holtmann.org>,
        Johan Hedberg <johan.hedberg@gmail.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
Subject: linux-next: manual merge of the bluetooth tree with the origin tree
Date:   Mon, 17 Apr 2023 15:36:18 +0100
Message-Id: <20230417143618.2091407-1-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi all,

Today's linux-next merge of the bluetooth tree got a conflict in:

  net/bluetooth/hci_conn.c

between commit:

  5dc7d23e167e2 ("Bluetooth: hci_conn: Fix possible UAF")

from the origin tree and commit:

  0623067085473 ("Bluetooth: hci_conn: Fix possible UAF")

from the bluetooth tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc net/bluetooth/hci_conn.c
index 8455ba141ee61,640b951bf40a1..0000000000000
--- a/net/bluetooth/hci_conn.c
+++ b/net/bluetooth/hci_conn.c
