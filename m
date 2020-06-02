Return-Path: <SRS0=WYMY=7P=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FCC0C433E0
	for <linux-next@archiver.kernel.org>; Tue,  2 Jun 2020 03:26:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 496A22072F
	for <linux-next@archiver.kernel.org>; Tue,  2 Jun 2020 03:26:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725850AbgFBD07 (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Mon, 1 Jun 2020 23:26:59 -0400
Received: from brightrain.aerifal.cx ([216.12.86.13]:38050 "EHLO
        brightrain.aerifal.cx" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725841AbgFBD06 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 1 Jun 2020 23:26:58 -0400
X-Greylist: delayed 913 seconds by postgrey-1.27 at vger.kernel.org; Mon, 01 Jun 2020 23:26:58 EDT
Date:   Mon, 1 Jun 2020 23:11:39 -0400
From:   Rich Felker <dalias@libc.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-sh list <linux-sh@vger.kernel.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>
Subject: linux-sh for-next reactivation
Message-ID: <20200602031123.GA1079@brightrain.aerifal.cx>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Stephen,

Could you reactivate linux-next pull from my arch/sh for-next branch?
It's where it was before, at:

    git://git.libc.org/linux-sh for-next

and has newly accepted patches ready.

Rich
