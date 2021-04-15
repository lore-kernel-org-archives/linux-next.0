Return-Path: <linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33F47C433ED
	for <linux-next@archiver.kernel.org>; Thu, 15 Apr 2021 21:19:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 16DD6610CE
	for <linux-next@archiver.kernel.org>; Thu, 15 Apr 2021 21:19:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235110AbhDOVT5 (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Thu, 15 Apr 2021 17:19:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234959AbhDOVT5 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 15 Apr 2021 17:19:57 -0400
Received: from zeniv-ca.linux.org.uk (zeniv-ca.linux.org.uk [IPv6:2607:5300:60:148a::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5979C061574;
        Thu, 15 Apr 2021 14:19:33 -0700 (PDT)
Received: from viro by zeniv-ca.linux.org.uk with local (Exim 4.94 #2 (Red Hat Linux))
        id 1lX9Oc-005bBv-ES; Thu, 15 Apr 2021 21:19:30 +0000
Date:   Thu, 15 Apr 2021 21:19:30 +0000
From:   Al Viro <viro@zeniv.linux.org.uk>
To:     Miklos Szeredi <mszeredi@redhat.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the vfs tree
Message-ID: <YHit4glpYL3cCMoe@zeniv-ca.linux.org.uk>
References: <20210412214730.2dbbcdff@canb.auug.org.au>
 <CAOssrKdAmeVK_uwLCDo_ZT52vOzxSU9X=orgzU6RB088L6OdKA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOssrKdAmeVK_uwLCDo_ZT52vOzxSU9X=orgzU6RB088L6OdKA@mail.gmail.com>
Sender: Al Viro <viro@ftp.linux.org.uk>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Apr 12, 2021 at 03:07:56PM +0200, Miklos Szeredi wrote:
> Hi Al,
> 
> Fixed fileattr branch pushed to:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/mszeredi/vfs.git fileattr_v6

Merged and pushed out...
