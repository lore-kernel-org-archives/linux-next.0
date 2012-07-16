From: Ohad Ben-Cohen <ohad@wizery.com>
Subject: Re: linux-next: manual merge of the remoteproc tree with Linus' tree
Date: Mon, 16 Jul 2012 09:12:44 +0300
Message-ID: <CAK=WgbaAiQPA+q40-4ej=EZqOfN+kAMwK5-7hg4MdvdwJ+febw@mail.gmail.com>
References: <20120716160345.d5e88e6e53483a9c08ba3a75@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-vb0-f46.google.com ([209.85.212.46]:33169 "EHLO
	mail-vb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751192Ab2GPGNF (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 16 Jul 2012 02:13:05 -0400
Received: by vbbff1 with SMTP id ff1so3277126vbb.19
        for <linux-next@vger.kernel.org>; Sun, 15 Jul 2012 23:13:04 -0700 (PDT)
In-Reply-To: <20120716160345.d5e88e6e53483a9c08ba3a75@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, =?ISO-8859-1?Q?=22Sjur_Br=E6ndeland=22?= <sjur.brandeland@stericsson.com>

Hi Stephen,

On Mon, Jul 16, 2012 at 9:03 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Ohad,
>
> Today's linux-next merge of the remoteproc tree got a conflict in
> drivers/remoteproc/remoteproc_core.c between commits e981f6d41acd
> ("remoteproc: fix print format warnings") and 30338cf09f82 ("remoteproc:
> fix missing fault indication in error-path") from Linus' tree and commits
> bd4849848773 ("remoteproc: Pass struct fw to load_segments and
> find_rsc_table") and 72854fb042b1 ("remoteproc: Move Elf related
> functions to separate file") from the remoteproc tree.
>
> I fixed them up (see below) and can carry the fixes as necessary.

Looks great, thanks a lot!

Ohad.
