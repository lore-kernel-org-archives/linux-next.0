Return-Path: <SRS0=iYPk=7S=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AF95C433E0
	for <linux-next@archiver.kernel.org>; Fri,  5 Jun 2020 20:34:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4E51A207D0
	for <linux-next@archiver.kernel.org>; Fri,  5 Jun 2020 20:34:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728196AbgFEUeg (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Fri, 5 Jun 2020 16:34:36 -0400
Received: from ms.lwn.net ([45.79.88.28]:38144 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728129AbgFEUeg (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 5 Jun 2020 16:34:36 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id D2C0160B;
        Fri,  5 Jun 2020 20:34:34 +0000 (UTC)
Date:   Fri, 5 Jun 2020 14:34:33 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     "Alexander A. Klimov" <grandmaster@al2klimov.de>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the jc_docs
 tree
Message-ID: <20200605143433.578aaaf5@lwn.net>
In-Reply-To: <ba5ca7c6-bdf9-b568-b58e-d6d466dc668f@al2klimov.de>
References: <20200526080122.5a91c78a@canb.auug.org.au>
        <20200526084451.69a3bd45@lwn.net>
        <ba5ca7c6-bdf9-b568-b58e-d6d466dc668f@al2klimov.de>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, 5 Jun 2020 22:28:54 +0200
"Alexander A. Klimov" <grandmaster@al2klimov.de> wrote:

> Am I completely blind or did the patch completely disappear?
> 
> $ git log v5.0..docs-5.8 |grep -Fwe 'Alexander A. Klimov'
> $ git log v5.0..lwn/docs-next |grep -Fwe 'Alexander A. Klimov'
> $ git log v5.0..lwn/docs-next-merge |grep -Fwe 'Alexander A. Klimov'
> $ git log v5.0..torvalds/master |grep -Fwe 'Alexander A. Klimov'

I pulled the original version since it wasn't properly signed off.  I have
your replacement, and may yet get it in during the merge window.

(Please don't top-post).

jon
