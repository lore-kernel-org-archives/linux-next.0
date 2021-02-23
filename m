Return-Path: <linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D879C433E0
	for <linux-next@archiver.kernel.org>; Tue, 23 Feb 2021 10:45:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0312264DF5
	for <linux-next@archiver.kernel.org>; Tue, 23 Feb 2021 10:45:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230429AbhBWKpQ (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Tue, 23 Feb 2021 05:45:16 -0500
Received: from mail-40133.protonmail.ch ([185.70.40.133]:32752 "EHLO
        mail-40133.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231523AbhBWKpP (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 23 Feb 2021 05:45:15 -0500
Date:   Tue, 23 Feb 2021 10:44:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me; s=protonmail;
        t=1614077065; bh=39RPlxQWGsqc110DvGaTPapbMeScM3H7W2UqSxyya+s=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=FPnplCBme01eJdQnthCyxDdCbTB7Kn2TG1PBMwkWe7N8cOyHlwekdzlAHmVPknCPP
         ZF0ZJISa+Stfa80R00Zbhc3Hcuh3ti2VHfTzDJJ3gpRUvX0CMnm1k1+6Hfbw0lOjQA
         6B7HtyXoGmt9TU5VxnP9Lp7EdhBM7avPMVfAHlTF4QcJ1026Eix05pjmAGXFdRaoy9
         LIrvgLAx45Shj+XCl4y7/MUhi01Ft+LJk62lSs2mYq0tdeEc+iDPxgpQqiAMKkBqiw
         c/kePy7UHPIKsViQNnhsuGC/4xd3nnOJTbr566uq2JYq4ZE3D76FCj31inlphEWkDP
         CgmJVwwhIfb/g==
To:     Stephen Rothwell <sfr@canb.auug.org.au>
From:   Alexander Lobakin <alobakin@pm.me>
Cc:     Alexander Lobakin <alobakin@pm.me>,
        Kees Cook <keescook@chromium.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Sami Tolvanen <samitolvanen@google.com>
Reply-To: Alexander Lobakin <alobakin@pm.me>
Subject: Re: linux-next: manual merge of the kspp tree with the mips tree
Message-ID: <20210223104411.4155-1-alobakin@pm.me>
In-Reply-To: <20210223104950.1f754320@canb.auug.org.au>
References: <20210118150804.378ac9f3@canb.auug.org.au> <20210215074726.60c45281@canb.auug.org.au> <20210223104950.1f754320@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 23 Feb 2021 10:49:50 +1100

> Hi all,

Hi,

> On Mon, 15 Feb 2021 07:47:26 +1100 Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> >
> > On Mon, 18 Jan 2021 15:08:04 +1100 Stephen Rothwell <sfr@canb.auug.org.=
au> wrote:
> > >
> > > Today's linux-next merge of the kspp tree got a conflict in:
> > >
> > >   include/asm-generic/vmlinux.lds.h
> > >
> > > between commits:
> > >
> > >   9a427556fb8e ("vmlinux.lds.hf41b233de0ae: catch compound literals i=
nto data and BSS")
> > >   f41b233de0ae ("vmlinux.lds.h: catch UBSAN's "unnamed data" into dat=
a")
> > >
> > > from the mips tree and commit:
> > >
> > >   dc5723b02e52 ("kbuild: add support for Clang LTO")
> > >
> > > from the kspp tree.
> > >
> > > I fixed it up (9a427556fb8e and dc5723b02e52 made the same change to
> > > DATA_MAIN, which conflicted with the change in f41b233de0ae) and can
> > > carry the fix as necessary. This is now fixed as far as linux-next is
> > > concerned, but any non trivial conflicts should be mentioned to your
> > > upstream maintainer when your tree is submitted for merging. You may
> > > also want to consider cooperating with the maintainer of the
> > > conflicting tree to minimise any particularly complex conflicts.
> >
> > With the merge window about to open, this is a reminder that this
> > conflict still exists.
>
> This is now a conflict between the kspp tree and Linus' tree.

Kees prepared a Git pull of kspp tree for Linus, this will be resolved
soon.

> --
> Cheers,
> Stephen Rothwell

Al

