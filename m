Return-Path: <linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61942C433E0
	for <linux-next@archiver.kernel.org>; Tue, 26 Jan 2021 09:47:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1EE6323117
	for <linux-next@archiver.kernel.org>; Tue, 26 Jan 2021 09:47:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391285AbhAZJrC (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Tue, 26 Jan 2021 04:47:02 -0500
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:32803 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390506AbhAZJqz (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 26 Jan 2021 04:46:55 -0500
X-Originating-IP: 78.199.60.242
Received: from [192.168.1.150] (unknown [78.199.60.242])
        (Authenticated sender: hadess@hadess.net)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 4A0141BF204;
        Tue, 26 Jan 2021 09:46:08 +0000 (UTC)
Message-ID: <b92aca941b344ce4552b9e4d25d4f438aff4e6d5.camel@hadess.net>
Subject: Re: linux-next: Signed-off-by missing for commit in the bluetooth
 tree
From:   Bastien Nocera <hadess@hadess.net>
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Marcel Holtmann <marcel@holtmann.org>,
        Johan Hedberg <johan.hedberg@gmail.com>
Cc:     Florian Dollinger <dollinger.florian@gmx.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Date:   Tue, 26 Jan 2021 10:46:08 +0100
In-Reply-To: <20210126195441.69c45ad9@canb.auug.org.au>
References: <20210126195441.69c45ad9@canb.auug.org.au>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.2 (3.38.2-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, 2021-01-26 at 19:54 +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Commit
> 
>   98d2c3e17310 ("Bluetooth: L2CAP: Try harder to accept device not
> knowing options")
> 
> is missing a Signed-off-by from its author.

Marcel, is it possible to amend this to add my Signed-off-by?

Signed-off-by: Bastien Nocera <hadess@hadess.net>

Cheers

