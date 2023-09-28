Return-Path: <linux-next-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E993EE732DB
	for <linux-next@archiver.kernel.org>; Thu, 28 Sep 2023 14:52:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230270AbjI1Ows (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Thu, 28 Sep 2023 10:52:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230246AbjI1Owr (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 28 Sep 2023 10:52:47 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67A4C195;
        Thu, 28 Sep 2023 07:52:46 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2F09C433C7;
        Thu, 28 Sep 2023 14:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695912766;
        bh=xfxV1oNP6m/aajUPxOtkXZ3kXT3HBJ0eemme2k/Aa50=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PGft4SwABcmN16PM4hnQadeZXsYwbIqYu2JCaisW2ImTwCEzK9SLvLq0BxU75iXmG
         RbmUbQtHfR7tDoNbTFNj4FoOQ94cFi/Pb055Fto0ljOxT4F5yvBAO1JTaKDxi6gYjF
         68lUS2EkZBnhT0H+utTJrSFg8BeGLlIbqw9iwmrnkIqwc0DUWykskbi3Uih9KcYOV5
         blRJJLe7jIeya6l09/EnK3GOVPU9Z4N8pm9FQ6wFWFHVRHK5P4zTHm7VvV0dN8p8wf
         cIk1GojXFZp8IoIdxLIF2sEZrJMHBUBDO40xOSKqMDrAaqFIIfgL3L10Pit9Yfwh9E
         D1voUq8gNqXMQ==
Date:   Thu, 28 Sep 2023 16:52:42 +0200
From:   Christian Brauner <brauner@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Jan Kara <jack@suse.cz>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the vfs-brauner tree
Message-ID: <20230928-werbung-entbinden-fe6408fe9975@brauner>
References: <20230928103954.78444923@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230928103954.78444923@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Sep 28, 2023 at 10:39:54AM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the vfs-brauner tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> drivers/md/md.c: In function 'md_import_device':
> drivers/md/md.c:3635:25: error: unused variable 'holder' [-Werror=unused-variable]
>  3635 |         struct md_rdev *holder;
>       |                         ^~~~~~
> cc1: all warnings being treated as errors
> 
> Caused by commit
> 
>   15db36126ca6 ("md: Convert to bdev_open_by_dev()")
> 
> I have used the vfs-brauner tree from next-20230927 for today.

Fixed in vfs.super. Thank you!
