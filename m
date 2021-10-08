Return-Path: <linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30226C433EF
	for <linux-next@archiver.kernel.org>; Fri,  8 Oct 2021 06:27:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0539660FC3
	for <linux-next@archiver.kernel.org>; Fri,  8 Oct 2021 06:27:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229922AbhJHG3H (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Fri, 8 Oct 2021 02:29:07 -0400
Received: from mail-4317.proton.ch ([185.70.43.17]:35143 "EHLO
        mail-4317.proton.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229657AbhJHG3H (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 8 Oct 2021 02:29:07 -0400
Date:   Fri, 08 Oct 2021 06:27:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
        s=protonmail; t=1633674429;
        bh=juCQPQ9pXdeb3ba8HQ0Lr855lgYX8N0l/Wb3INOrs74=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=jV3lRODPoZ3riUpu9qFhhroDwncAPLs4cxOhKZghIlAt9GQQVpjIrwNI/XbKdUknl
         ATURByya8qPYfEUuhZNPhge9bv9PR9KlWKxnnzIcBe1Zco+T+o6eFULI5PHmt65Jpb
         LaGnUPlC5Uu+SYXuylsDOTl6kuZ1Nfm564laKW0Rf4zw5Un6WWowk2Lvt663bjF5Rj
         by1EXEN2Eul8CIv5FggBpk9dlLp9N+z50C7cvuOA95oaP9HWWgwS00F7nEulbjM8Nx
         MWQkNsMjdfYXysSpI8oAxXwkhhAunBtpsshSur5ISPgechVJcaZ1ka5A2hSgnEgH4b
         XKpNSfRZ/IfXw==
To:     Stephen Rothwell <sfr@canb.auug.org.au>
From:   Simon Ser <contact@emersion.fr>
Cc:     Alex Deucher <alexdeucher@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Reply-To: Simon Ser <contact@emersion.fr>
Subject: Re: linux-next: build failure after merge of the amdgpu tree
Message-ID: <jXLIcCYkgHdIQna5SW6W4GGHVG5By4-GXiaosbXyyaYXFNTH60nmH6twdxMYgM2X63FhEOyxU7Qh_vbKFywBKmUwp7l4DYXe_hTt86AS-ZM=@emersion.fr>
In-Reply-To: <20211008113116.4bdd7b6c@canb.auug.org.au>
References: <20211008113116.4bdd7b6c@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Friday, October 8th, 2021 at 02:31, Stephen Rothwell <sfr@canb.auug.org.=
au> wrote:

> Hi all,
>
> After merging the amdgpu tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>
> ERROR: modpost: "get_mm_exe_file" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] =
undefined!
>
> Caused by commit
>
> f4f80155e6e8 ("amd/display: only require overlay plane to cover whole CRT=
C on ChromeOS")
>
> I have used the amdgpu tree from next-20211007 for today.

Not sure why this would happen. This commit builds fine on my machine, and =
I
don't think it's possible to disable this function with Kconfig?
