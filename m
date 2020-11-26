Return-Path: <linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 309E6C56202
	for <linux-next@archiver.kernel.org>; Thu, 26 Nov 2020 14:40:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EE58A20872
	for <linux-next@archiver.kernel.org>; Thu, 26 Nov 2020 14:40:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390166AbgKZOjz (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Thu, 26 Nov 2020 09:39:55 -0500
Received: from out03.mta.xmission.com ([166.70.13.233]:46226 "EHLO
        out03.mta.xmission.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389991AbgKZOjz (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 26 Nov 2020 09:39:55 -0500
X-Greylist: delayed 3495 seconds by postgrey-1.27 at vger.kernel.org; Thu, 26 Nov 2020 09:39:54 EST
Received: from in01.mta.xmission.com ([166.70.13.51])
        by out03.mta.xmission.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <ebiederm@xmission.com>)
        id 1kiHWk-00FtFp-7u; Thu, 26 Nov 2020 06:41:38 -0700
Received: from ip68-227-160-95.om.om.cox.net ([68.227.160.95] helo=x220.xmission.com)
        by in01.mta.xmission.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.87)
        (envelope-from <ebiederm@xmission.com>)
        id 1kiHWj-0003Ma-5I; Thu, 26 Nov 2020 06:41:38 -0700
From:   ebiederm@xmission.com (Eric W. Biederman)
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Daniel Borkmann <daniel@iogearbox.net>,
        Alexei Starovoitov <ast@kernel.org>,
        Networking <netdev@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Song Liu <songliubraving@fb.com>
References: <20201126162248.7e7963fe@canb.auug.org.au>
Date:   Thu, 26 Nov 2020 07:41:12 -0600
In-Reply-To: <20201126162248.7e7963fe@canb.auug.org.au> (Stephen Rothwell's
        message of "Thu, 26 Nov 2020 16:22:48 +1100")
Message-ID: <87a6v4nslj.fsf@x220.int.ebiederm.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-XM-SPF: eid=1kiHWj-0003Ma-5I;;;mid=<87a6v4nslj.fsf@x220.int.ebiederm.org>;;;hst=in01.mta.xmission.com;;;ip=68.227.160.95;;;frm=ebiederm@xmission.com;;;spf=neutral
X-XM-AID: U2FsdGVkX19590D4YxTqaZNbKHQ7oHvcJ0XZUjADk20=
X-SA-Exim-Connect-IP: 68.227.160.95
X-SA-Exim-Mail-From: ebiederm@xmission.com
Subject: Re: linux-next: manual merge of the userns tree with the bpf-next tree
X-SA-Exim-Version: 4.2.1 (built Thu, 05 May 2016 13:38:54 -0600)
X-SA-Exim-Scanned: Yes (on in01.mta.xmission.com)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Stephen Rothwell <sfr@canb.auug.org.au> writes:

> Hi all,
>
> Today's linux-next merge of the userns tree got a conflict in:
>
>   kernel/bpf/task_iter.c
>
> between commit:
>
>   91b2db27d3ff ("bpf: Simplify task_file_seq_get_next()")
>
> from the bpf-next tree and commit:
>
>   edc52f17257a ("bpf/task_iter: In task_file_seq_get_next use task_lookup_next_fd_rcu")
>
> from the userns tree.
>
> I fixed it up (I think, see below) and can carry the fix as
> necessary. This is now fixed as far as linux-next is concerned, but any
> non trivial conflicts should be mentioned to your upstream maintainer
> when your tree is submitted for merging.  You may also want to consider
> cooperating with the maintainer of the conflicting tree to minimise any
> particularly complex conflicts.

Thanks.  Reading through the diff that looks right, and it has been already
reported.

Eric

