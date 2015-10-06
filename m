From: Paul Moore <paul@paul-moore.com>
Subject: Re: linux-next: build warning after merge of the audit tree
Date: Tue, 6 Oct 2015 13:23:19 -0400
Message-ID: <CAHC9VhRH-0FBuBoAxkY1azRtqBXzJ+ENJDnnwBNUYd7WsM-Xqg@mail.gmail.com>
References: <20151006164646.5ad86a14@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-oi0-f46.google.com ([209.85.218.46]:36439 "EHLO
	mail-oi0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751498AbbJFRXT (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 6 Oct 2015 13:23:19 -0400
Received: by oibi136 with SMTP id i136so113025183oib.3
        for <linux-next@vger.kernel.org>; Tue, 06 Oct 2015 10:23:19 -0700 (PDT)
In-Reply-To: <20151006164646.5ad86a14@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Oct 6, 2015 at 1:46 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Paul,
>
> After merging the audit tree, today's linux-next build (i386 defconfig
> and others) produced this warning:
>
> security/lsm_audit.c: In function 'dump_common_audit_data':
> security/lsm_audit.c:340:9: warning: passing argument 1 of 'unix_sk' discards 'const' qualifier from pointer target type
>      u = unix_sk(sk);
>          ^
> In file included from security/lsm_audit.c:22:0:
> include/net/af_unix.h:67:33: note: expected 'struct sock *' but argument is of type 'const struct sock *'
>  static inline struct unix_sock *unix_sk(struct sock *sk)
>                                  ^
>
> Introduced by commit
>
>   43cfd5e38587 ("audit: constify parts of common_audit_data and lsm_network_audit")

Hi Stephen,

I apologize for the build warning, for some reason it works just fine
in audit#next but causes problems on top of more current trees.  I'm
going to drop the patch until I've resolved the issue.

-- 
paul moore
www.paul-moore.com
