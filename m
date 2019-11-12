Return-Path: <SRS0=UDaG=ZE=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D9BBC43331
	for <linux-next@archiver.kernel.org>; Tue, 12 Nov 2019 01:36:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D2BC920659
	for <linux-next@archiver.kernel.org>; Tue, 12 Nov 2019 01:36:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="anJC2lQn"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726981AbfKLBgU (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Mon, 11 Nov 2019 20:36:20 -0500
Received: from mail-pf1-f193.google.com ([209.85.210.193]:45467 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726793AbfKLBgU (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 11 Nov 2019 20:36:20 -0500
Received: by mail-pf1-f193.google.com with SMTP id z4so12074403pfn.12
        for <linux-next@vger.kernel.org>; Mon, 11 Nov 2019 17:36:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:date:to:cc:subject:message-id:mime-version:content-disposition;
        bh=YQZjKGXcNZXw1YlSumUSraNmW+wBpqxVy50h/diglN0=;
        b=anJC2lQnzU/tmYJb8L41MLO2K97fK/KrPD5rFMvPnUpBqw0v8Yz2GCgtkZAf3v2S+e
         r0gSd72r65FRokVwyxnajeY1QrMRl2NI6Cf6SFm0+7B1ceYSQiW8wyvb0fXCHWcqJl1P
         0zFe0tbM/+4uZkpysbF7zrcCCIBO2O3v8HmFc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=YQZjKGXcNZXw1YlSumUSraNmW+wBpqxVy50h/diglN0=;
        b=mG4XxIkeStCp8Y06JX3bHFCrz/lSzme6VVeGCPUy7TALiLCUH1+h/7f94/mZBnw+ZM
         Tx7GL69YR6sAc/XkZoumVFppSHiQCAm5wLKJ3HtbWJwOi7rjVJhaA3TAZcd5WQmm+KG5
         sJ7I2mc3iKcWqkaRsPyHHoXaDop8O3/wSL0F+wi+6Dsufgqpv7WB//Nu0sotInrkmV4a
         cN8O62pJoCDlVFBvYeIu0tr+LXebk08cVsFQ1bLb9h/YCSc/0bNrL0lkhuWtctbCW0Z9
         z+0sqEPwz9IEs/8QhE9VzChYME8vfxQBfRwDkAf51A9QPflcamrg2aSDTwsW4FJWxIf/
         KUag==
X-Gm-Message-State: APjAAAWyHDLKeyR+cOARctZ3+60mrtmvr+0dFIansevyua++67Hjr2oh
        NDqSsYDvvQvJbRN5HginFmfRLw==
X-Google-Smtp-Source: APXvYqy+KOQdLaiBP5vNBHvntQxGZSP2j4Imk42xE/QdwhrTk6aVloSfEvAI1sZIq27CxcVvX2rInw==
X-Received: by 2002:a62:aa0a:: with SMTP id e10mr30025340pff.46.1573522579711;
        Mon, 11 Nov 2019 17:36:19 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id k4sm8980905pfa.25.2019.11.11.17.36.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2019 17:36:18 -0800 (PST)
From:   coverity-bot <keescook@chromium.org>
X-Google-Original-From: coverity-bot <keescook+coverity-bot@chromium.org>
Date:   Mon, 11 Nov 2019 17:36:18 -0800
To:     Qu Wenruo <wqu@suse.com>
Cc:     David Sterba <dsterba@suse.com>,
        Anand Jain <anand.jain@oracle.com>,
        Johannes Thumshirn <jthumshirn@suse.de>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org
Subject: Coverity: read_one_block_group(): Concurrent data access violations
Message-ID: <201911111736.E0A3E2DDDB@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hello!

This is an experimental automated report about issues detected by Coverity
from a scan of next-20191108 as part of the linux-next weekly scan project:
https://scan.coverity.com/projects/linux-next-weekly-scan

You're getting this email because you were associated with the identified
lines of code (noted below) that were touched by recent commits:

593669fa8fd7 ("btrfs: block-group: Refactor btrfs_read_block_groups()")

Coverity reported the following:

*** CID 1487834:  Concurrent data access violations  (MISSING_LOCK)
/fs/btrfs/block-group.c: 1721 in read_one_block_group()
1715     		 *    truncate the old free space cache inode and
1716     		 *    setup a new one.
1717     		 * b) Setting 'dirty flag' makes sure that we flush
1718     		 *    the new space cache info onto disk.
1719     		 */
1720     		if (btrfs_test_opt(info, SPACE_CACHE))
vvv     CID 1487834:  Concurrent data access violations  (MISSING_LOCK)
vvv     Accessing "cache->disk_cache_state" without holding lock "btrfs_block_group_cache.lock". Elsewhere, "btrfs_block_group_cache.disk_cache_state" is accessed with "btrfs_block_group_cache.lock" held 12 out of 13 times (6 of these accesses strongly imply that it is necessary).
1721     			cache->disk_cache_state = BTRFS_DC_CLEAR;
1722     	}
1723     	read_extent_buffer(leaf, &bgi, btrfs_item_ptr_offset(leaf, slot),
1724     			   sizeof(bgi));
1725     	if (!mixed && ((cache->flags & BTRFS_BLOCK_GROUP_METADATA) &&
1726     	    (cache->flags & BTRFS_BLOCK_GROUP_DATA))) {

If this is a false positive, please let us know so we can mark it as
such, or teach the Coverity rules to be smarter. If not, please make
sure fixes get into linux-next. :) For patches fixing this, please
include these lines (but double-check the "Fixes" first):

Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
Addresses-Coverity-ID: 1487834 ("Concurrent data access violations")
Fixes: 593669fa8fd7 ("btrfs: block-group: Refactor btrfs_read_block_groups()")


Thanks for your attention!

-- 
Coverity-bot
