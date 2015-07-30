From: Trond Myklebust <trond.myklebust@primarydata.com>
Subject: Re: linux-next: manual merge of the nfsd tree with Linus' tree
Date: Wed, 29 Jul 2015 21:35:11 -0400
Message-ID: <CAHQdGtSeaDoFp2mztbAdk4jTX55ox9Qb+YGV3wKhOF1teZCPXg@mail.gmail.com>
References: <20150730112325.72240f81@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ob0-f169.google.com ([209.85.214.169]:33365 "EHLO
	mail-ob0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751643AbbG3BfL (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 29 Jul 2015 21:35:11 -0400
Received: by obdeg2 with SMTP id eg2so20683869obd.0
        for <linux-next@vger.kernel.org>; Wed, 29 Jul 2015 18:35:11 -0700 (PDT)
In-Reply-To: <20150730112325.72240f81@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "J. Bruce Fields" <bfields@fieldses.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Stephen,

On Wed, Jul 29, 2015 at 9:23 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi all,
>
> Today's linux-next merge of the nfsd tree got a conflict in:
>
>   fs/nfs/nfs42proc.c
>
> between commit:
>
>   bdcc2cd14e4e ("NFSv4.2: handle NFS-specific llseek errors")
>
> from Linus' tree and commit:
>
>   0183ae17c741 ("NFSv4.2: handle NFS-specific llseek errors")
>
> from the nfsd tree.
>
> The only difference here is that _nfs42_proc_llseek is static in the
> former, so I used that.
>

Yes, I snuck that declaration into the patch since it was obvious that
we would never want to export _nfs42_proc_llseek(), and because
"sparse" complained. Apologies if that caused a conflict...

Cheers
  Trond
