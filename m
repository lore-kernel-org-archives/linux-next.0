Return-Path: <SRS0=8J+/=6M=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECA82C83004
	for <linux-next@archiver.kernel.org>; Tue, 28 Apr 2020 07:01:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CEC75206D7
	for <linux-next@archiver.kernel.org>; Tue, 28 Apr 2020 07:01:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726406AbgD1HBi (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Tue, 28 Apr 2020 03:01:38 -0400
Received: from s3.sipsolutions.net ([144.76.43.62]:46164 "EHLO
        sipsolutions.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725867AbgD1HBi (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 28 Apr 2020 03:01:38 -0400
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
        (Exim 4.93)
        (envelope-from <johannes@sipsolutions.net>)
        id 1jTKFH-000sfA-60; Tue, 28 Apr 2020 09:01:31 +0200
Message-ID: <c3922c972277ff627c0308a94dfe3f25ba3b333f.camel@sipsolutions.net>
Subject: Re: linux-next: build failure after merge of the mac80211-next tree
From:   Johannes Berg <johannes@sipsolutions.net>
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Wireless <linux-wireless@vger.kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Date:   Tue, 28 Apr 2020 09:01:30 +0200
In-Reply-To: <20200428122930.51b6a9c2@canb.auug.org.au>
References: <20200428122930.51b6a9c2@canb.auug.org.au>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, 2020-04-28 at 12:29 +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the mac80211-next tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> Caused by commit
> 
>   6cd536fe62ef ("cfg80211: change internal management frame registration API")

Yeah. I forgot about staging. I guess I'll throw in a quick fix.

johannes

