From: Kees Cook <keescook@chromium.org>
Subject: Re: linux-next: build warning after merge of the security tree
Date: Mon, 23 Apr 2012 08:23:48 -0700
Message-ID: <CAGXu5j+KuoXLyjYZ2G9vS2XmHUKQ6diNGcV4XnEY+fOpS1DyQQ@mail.gmail.com>
References: <20120423165630.b412159ec0e5412ba41e0a98@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ee0-f46.google.com ([74.125.83.46]:48604 "EHLO
	mail-ee0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752193Ab2DWPXt (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 23 Apr 2012 11:23:49 -0400
Received: by eekc41 with SMTP id c41so3285871eek.19
        for <linux-next@vger.kernel.org>; Mon, 23 Apr 2012 08:23:48 -0700 (PDT)
In-Reply-To: <20120423165630.b412159ec0e5412ba41e0a98@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: James Morris <jmorris@namei.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Sun, Apr 22, 2012 at 11:56 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> After merging the security tree, today's linux-next build (powerpc
> allyesconfig) produced this warning:
>
> security/yama/yama_lsm.c:322:12: warning: 'one' defined but not used [-Wunused-variable]
>
> Introduced by commit 389da25f93ee ("Yama: add additional ptrace scopes").

Thanks! This has already been taken care of:

http://marc.info/?l=linux-security-module&m=133516581114617&w=2

-Kees

-- 
Kees Cook
Chrome OS Security
