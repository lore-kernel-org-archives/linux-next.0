Return-Path: <linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47C91C43217
	for <linux-next@archiver.kernel.org>; Mon, 11 Oct 2021 14:05:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2E79C61355
	for <linux-next@archiver.kernel.org>; Mon, 11 Oct 2021 14:05:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237865AbhJKOHe (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Mon, 11 Oct 2021 10:07:34 -0400
Received: from out02.mta.xmission.com ([166.70.13.232]:33340 "EHLO
        out02.mta.xmission.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236251AbhJKOFc (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 11 Oct 2021 10:05:32 -0400
Received: from in02.mta.xmission.com ([166.70.13.52]:51804)
        by out02.mta.xmission.com with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <ebiederm@xmission.com>)
        id 1mZvtq-009WKJ-9e; Mon, 11 Oct 2021 08:03:30 -0600
Received: from ip68-227-160-95.om.om.cox.net ([68.227.160.95]:37486 helo=email.xmission.com)
        by in02.mta.xmission.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <ebiederm@xmission.com>)
        id 1mZvto-00Dphn-T0; Mon, 11 Oct 2021 08:03:29 -0600
From:   ebiederm@xmission.com (Eric W. Biederman)
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Nicholas Piggin <npiggin@gmail.com>
References: <20211011174103.58413a7b@canb.auug.org.au>
Date:   Mon, 11 Oct 2021 09:03:22 -0500
In-Reply-To: <20211011174103.58413a7b@canb.auug.org.au> (Stephen Rothwell's
        message of "Mon, 11 Oct 2021 17:41:03 +1100")
Message-ID: <87bl3vbqvp.fsf@disp2133>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-XM-SPF: eid=1mZvto-00Dphn-T0;;;mid=<87bl3vbqvp.fsf@disp2133>;;;hst=in02.mta.xmission.com;;;ip=68.227.160.95;;;frm=ebiederm@xmission.com;;;spf=neutral
X-XM-AID: U2FsdGVkX18pvCoX97MHC/BwHnU46j5q1g3ulNRVMTw=
X-SA-Exim-Connect-IP: 68.227.160.95
X-SA-Exim-Mail-From: ebiederm@xmission.com
Subject: Re: linux-next: manual merge of the akpm-current tree with the userns tree
X-SA-Exim-Version: 4.2.1 (built Sat, 08 Feb 2020 21:53:50 +0000)
X-SA-Exim-Scanned: Yes (on in02.mta.xmission.com)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Stephen Rothwell <sfr@canb.auug.org.au> writes:

> Hi all,
>
> Today's linux-next merge of the akpm-current tree got a conflict in:
>
>   kernel/exit.c
>
> between commits:
>
>   d67e03e36161 ("exit: Factor coredump_exit_mm out of exit_mm")
>   92307383082d ("coredump:  Don't perform any cleanups before dumping core")
>
> from the userns tree and commit:
>
>   27692e64c49c ("lazy tlb: introduce lazy mm refcount helper functions")
>
> from the akpm-current tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Thanks.  This looks like a trivial conflict, and the resolution looks
correct.

Eric

