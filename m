Return-Path: <linux-next-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3C66EB64DD
	for <linux-next@archiver.kernel.org>; Tue, 11 Jul 2023 17:03:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229770AbjGKRDu (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Tue, 11 Jul 2023 13:03:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229476AbjGKRDu (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 11 Jul 2023 13:03:50 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 250F7A1;
        Tue, 11 Jul 2023 10:03:49 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9722B61586;
        Tue, 11 Jul 2023 17:03:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7053C433C8;
        Tue, 11 Jul 2023 17:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
        s=korg; t=1689095028;
        bh=IuTnRVfM3GCRl98ZCURTBKbe5HFdb5gU5z+pPw1L5iY=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=DNDuzUdk8Gp2a15XMRq+/gKgStsudFf+tMAoJSVTeaIDtXjp/sT9kmvRiAv4FlU5g
         UWgUD/+vs3922HARV1pJvZqj6vfPWV97IHYTrTnXBEZijd7DOBhxLXDqACkH63pkfz
         jKf6auFwrAEan6nyq4KhaVclOHwH5Md8tP9ega9I=
Date:   Tue, 11 Jul 2023 10:03:46 -0700
From:   Andrew Morton <akpm@linux-foundation.org>
To:     Michal =?ISO-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>, Tejun Heo <tj@kernel.org>,
        Domenico Cerasuolo <cerasuolodomenico@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the cgroup tree with the mm tree
Message-Id: <20230711100346.0805ead2e7e65be56ce2911c@linux-foundation.org>
In-Reply-To: <xn7nv52qio4aq2ioquuglnfoe6hn2l7newjf53enyxxthy6opd@ztktowlsjub3>
References: <20230711110734.7009339b@canb.auug.org.au>
        <xn7nv52qio4aq2ioquuglnfoe6hn2l7newjf53enyxxthy6opd@ztktowlsjub3>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, 11 Jul 2023 14:41:18 +0200 Michal Koutn=FD <mkoutny@suse.com> wrote:

> Hello.
>=20
> On Tue, Jul 11, 2023 at 11:07:34AM +1000, Stephen Rothwell <sfr@canb.auug=
.org.au> wrote:
> > You may also want to consider cooperating with the maintainer of the
> > conflicting tree to minimise any particularly complex conflicts.
>=20
> Would alphabetical sorting of entries be helpful? (Lower conflict
> probability than the single end for appending.)

I think so.  People tend to put new entries at the end of lists, which
is the ideal way to cause patch collisions :(
