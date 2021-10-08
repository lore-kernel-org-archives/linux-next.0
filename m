Return-Path: <linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9262BC433EF
	for <linux-next@archiver.kernel.org>; Fri,  8 Oct 2021 18:09:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 68119611EE
	for <linux-next@archiver.kernel.org>; Fri,  8 Oct 2021 18:09:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239929AbhJHSLc (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Fri, 8 Oct 2021 14:11:32 -0400
Received: from mail-4018.proton.ch ([185.70.40.18]:28901 "EHLO
        mail-4018.proton.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243741AbhJHSJg (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 8 Oct 2021 14:09:36 -0400
Date:   Fri, 08 Oct 2021 18:07:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
        s=protonmail; t=1633716457;
        bh=00Ll+BiOoS4RM6Cs8JN4sseiemsZm3PpdaSamdVe79o=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=A0/HM2NWHe4JdW99+1KuqedkPbPrRyjleSFJTMYg7iWEqDxHFE3EkCH+tr2kFMpta
         RYCmdUyQV+EvmABKjD2amiR8UNyH81bOWPD+mnAHxHPuGhQ2kFIeKiJARNEuPWLsSp
         lq/xf9oRyTDfDCIluSg4hRcx3OM82Dhl8Z4YukZRjDkKnzuT/WNas3jZPGTAMMlB64
         Y7XIBWAajQJAAeTcvhp+AwNAVi4bvOkNEh3MHLMADwHircYkN+hg08/63f/Sqw6Z1J
         UL7HGcrHpeZjS6u2uBaVVMGKhXGyvOpgp9EuJ99Z3hqmVumqUyb5ENVBVXJo15Kh9U
         c8PrbErGNd6IA==
To:     Alex Deucher <alexdeucher@gmail.com>,
        Christoph Hellwig <hch@lst.de>
From:   Simon Ser <contact@emersion.fr>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Reply-To: Simon Ser <contact@emersion.fr>
Subject: Re: linux-next: build failure after merge of the amdgpu tree
Message-ID: <_POw9ikafXoqSFqiOb8SZb_uvRZ4okgD4qrl4EtJ0UBiQTV7pwV3pJIM20eIzmpuFWDeBF9NPD00r72ttX0mZZ0bNeH_J44MoaB-jfjrQSU=@emersion.fr>
In-Reply-To: <CADnq5_NUkzK=uOJKn5tiaSSA0i=WPJZFZBSPDne8ooims8JkCQ@mail.gmail.com>
References: <20211008113116.4bdd7b6c@canb.auug.org.au> <jXLIcCYkgHdIQna5SW6W4GGHVG5By4-GXiaosbXyyaYXFNTH60nmH6twdxMYgM2X63FhEOyxU7Qh_vbKFywBKmUwp7l4DYXe_hTt86AS-ZM=@emersion.fr> <20211008192910.600a188d@canb.auug.org.au> <Dz13Vv6-f2sFL9b6FSyhY_PlgeJfAnCBSn_SLFYSVRmXevReQOCK7ZD_DRX2DsjHYb45cTPpnTC-aG-tFNU2AapS9qsQZQB_boozWiTz-dI=@emersion.fr> <CADnq5_NUkzK=uOJKn5tiaSSA0i=WPJZFZBSPDne8ooims8JkCQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Friday, October 8th, 2021 at 16:11, Alex Deucher <alexdeucher@gmail.com>=
 wrote:

> On Fri, Oct 8, 2021 at 5:22 AM Simon Ser contact@emersion.fr wrote:
>
> > On Friday, October 8th, 2021 at 10:29, Stephen Rothwell sfr@canb.auug.o=
rg.au wrote:
> >
> > > That symbol (get_mm_exe_file) is not exported to modules.
> >
> > I see this:
> >
> >     EXPORT_SYMBOL(get_mm_exe_file);
> >
> >
> > in kernel/fork.c
>
> Was recently removed:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/kernel/fork.c?id=3D05da8113c9ba63a8913e6c73dc06ed01cae55f68
>
> I guess we need to rethink that patch.

CC Christoph

Would it be reasonable to re-export get_mm_exe_file? amdgpu uses it here:

https://gitlab.freedesktop.org/agd5f/linux/-/commit/0d4da915c7098eca2aa6f55=
9f42e33b5e9c7c5e8
